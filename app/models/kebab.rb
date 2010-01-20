class Kebab < ActiveRecord::Base
  belongs_to :promoter, :class_name => 'Person'
  has_many :transportations
  accepts_nested_attributes_for :promoter, :transportations
end
