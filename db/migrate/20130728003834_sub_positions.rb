class SubPositions < ActiveRecord::Migration
  def change
    create_table :sub_positions do |t|
      t.string :name, null: false
      t.references :position, null: false
    end
  end
end
