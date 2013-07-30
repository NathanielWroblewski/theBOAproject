class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest
      t.string :email, null: false
      t.string :password_reset_token
      t.string :first_name
      t.string :last_name
      t.string :rank
      t.string :gym
      t.text :about
      t.string :location
    end
  end
end
