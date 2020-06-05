class Team < ActiveRecord::Base
  validates_presence_of :email, :team_name, :password_digest
  has_many :player, through: :players_team

end
