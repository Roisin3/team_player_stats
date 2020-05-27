class CreateUser < ActiveRecord::Migration
  def change
    create_table do |t|
      t.string :name
      t.string :username
      t.string :password_digest
  end
end
