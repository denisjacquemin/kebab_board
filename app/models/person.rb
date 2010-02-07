class Person < ActiveRecord::Base
  has_many :participations
  has_many :transportations
  has_many :promoters, :class_name => 'Person'
  
  validate_on_update :name_mr_bureaux_cannot_be_updated
  
  before_destroy :name_mr_bureaux_cannot_be_deleted
  
  private
  def name_mr_bureaux_cannot_be_updated
    errors.add(:name, 'ce nom ne peut etre modifie') if 
      Person.find(id, :select => 'name').name =='Mr Bureaux'
  end
  
  def name_mr_bureaux_cannot_be_deleted
    if Person.find(id, :select => 'name').name =='Mr Bureaux'
      false
    end 
  end
end
