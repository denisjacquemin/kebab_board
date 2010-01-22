class Kebab < ActiveRecord::Base
  belongs_to :promoter, :class_name => 'Person'
  has_many :transportations
  has_many :participations
  accepts_nested_attributes_for :promoter, :reject_if => lambda { |a| a[:person_id].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :transportations, :reject_if => lambda { |a| a[:person_id].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :participations, :reject_if => lambda { |a| a[:person_id].blank? }, :allow_destroy => true


end
