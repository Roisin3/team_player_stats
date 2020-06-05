class Player < ActiveRecord::Base
  belongs_to :team, through: :players_team

end
