class Kebab < ActiveRecord::Base
  belongs_to :promoter, :class_name => 'Person'
  has_many :transportations
  has_many :participations
  accepts_nested_attributes_for :promoter, :transportations, :participations
end
