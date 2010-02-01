class Person < ActiveRecord::Base
  has_many :kebabs
  has_many :transportations
  
  validate :name_mr_bureaux_cannot_be_updated, :on => :update
  
  private
  def name_mr_bureaux_cannot_be_updated
    errors.add(:name, 'Ce nom ne peut etre modifie') if 
      Person.find(id, :select => 'name').name =='Mr Bureaux'
  end
end
