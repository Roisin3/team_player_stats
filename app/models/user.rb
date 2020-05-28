class User < ActiveRecord::Base
  has_one :team
  validates_presence_of :name, :username, :password_digest
end
