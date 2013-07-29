class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest
      t.string :email, null: false
      t.string :password_reset_token
    end
  end
end
