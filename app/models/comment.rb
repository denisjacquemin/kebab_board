class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :kebab
  named_scope :last5, :limit => 5, :order => 'created_at desc'
end
