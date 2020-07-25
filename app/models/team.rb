class Team < ActiveRecord::Base
  has_secure_password
  has_many :player

  def slug
      team_name.downcase.gsub('', '-')
  end

  def self.find_by_slug(slug)
      Team.all.find{|team| team.slug == slug}
  end

end

