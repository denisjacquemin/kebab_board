class StatisticsController < ApplicationController
  def index
    by_week = Kebab.all.collect {|k|  [k.date.cweek, k.participations.count]}
    @weeks = by_week.collect {|bw| bw[0]} 
    @participations = by_week.collect {|bw| bw[1]} 
  end
end
