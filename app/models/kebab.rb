class Kebab < ActiveRecord::Base
  belongs_to :promoter, :class_name => 'Person'
  accepts_nested_attributes_for :promoter, :reject_if => lambda { |a| a[:person_id].blank? }, :allow_destroy => true
  has_many :transportations
  accepts_nested_attributes_for :transportations, :reject_if => lambda { |a| a[:person_id].blank? }, :allow_destroy => true
  has_many :participations
  accepts_nested_attributes_for :participations, :reject_if => lambda { |a| a[:person_id].blank? }, :allow_destroy => true
end
