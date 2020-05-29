class User < ActiveRecord::Base
  has_one :team
  validates_presence_of :email, :username, :password_digest
end
