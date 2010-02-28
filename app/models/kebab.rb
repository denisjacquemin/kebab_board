class Kebab < ActiveRecord::Base
  ajaxful_rateable :stars => 5, :dimensions => [:organisation, :ambiance, :repas], :allow_update => true
  
  belongs_to :promoter, :class_name => 'Person'
  has_many :transportations
  has_many :participations
  has_many :comments
  accepts_nested_attributes_for :promoter, :reject_if => lambda { |a| a[:person_id].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :transportations, :reject_if => lambda { |a| a[:person_id].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :participations, :reject_if => lambda { |a| a[:person_id].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :comments, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
