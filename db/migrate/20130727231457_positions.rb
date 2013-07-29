class Positions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name, null: false
      t.boolean :top
    end
  end
end
