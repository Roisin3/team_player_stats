class Player < ActiveRecord::Base
  belongs_to :team

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  
end
