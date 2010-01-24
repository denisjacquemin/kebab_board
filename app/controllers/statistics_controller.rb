class StatisticsController < ApplicationController
  def index
    kebab_all = Kebab.all
    
    # Nombre de participants par semaine
    by_week = kebab_all.collect {|k|  [k.date.cweek, k.participations.count]}
    @weeks = by_week.collect {|bw| bw[0]} 
    @participations = by_week.collect {|bw| bw[1]} 
    @average = @participations.inject(0.0) { |sum,el| sum + el } / @participations.size
    @x_axis = (0..@participations.max).to_a
  
    # Les chauffeurs
    @all_transportations = kebab_all.collect{|k| k.transportations}.flatten # build an array of all transportations
    @drivers = @all_transportations.group_by{|t| t.person.name}.keys # build an array of driver's name
    
    by_person = @all_transportations.group_by{|t| t.person_id} # build an hash, the key is person_id and de value is an array of transportations
    @total_transportations = by_person.values.flatten.size # get the total of transportations
    @pieceofpie = by_person.values.map { |x| x.length.to_f / @total_transportations * 100}
    
    #by_person.each_value{|transportations| @pieceofpie << (transportations.size / total_transportations * 100)}
  end
end
