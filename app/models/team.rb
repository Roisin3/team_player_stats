class Team < ActiveRecord::Base
  has_many :player
  belongs_to :user

end
