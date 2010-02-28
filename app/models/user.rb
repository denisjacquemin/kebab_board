class User < ActiveRecord::Base
  include Clearance::User
  has_many :comments
  is_gravtastic!
  ajaxful_rater
end
