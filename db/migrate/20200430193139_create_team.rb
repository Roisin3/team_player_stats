class CreateTeam < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :email
      t.string :password_digest
    end
  end
end
