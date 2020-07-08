class Team < ActiveRecord::Base
  has_many :players
  has_secure_password

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

end
