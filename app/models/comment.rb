class Comment < ActiveRecord::Base
  belongs_to :person
  belongs_to :kebab
end
