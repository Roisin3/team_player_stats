class CreatePlayer < ActiveRecord::Migration
  def change
    create_table :player do |t|
      t.string :name
      t.string :position
      t.integer :games
      t.integer :goals
      t.integer :saves
      t.integer :assists
      t.integer :blocks
      t.integer :shots
      t.integer :interceptions
      t.integer :passes
      t.integer :red_cards
      t.integer :yellow_cards
    end
  end
end
