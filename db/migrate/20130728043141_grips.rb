class Grips < ActiveRecord::Migration
  def change
    create_table :grips do |t|
      t.string :name, null: false
      t.references :sub_position
    end
  end
end
