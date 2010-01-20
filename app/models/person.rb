class Person < ActiveRecord::Base
  has_many :kebabs
  has_many :transportations
end
