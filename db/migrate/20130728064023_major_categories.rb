class MajorCategories < ActiveRecord::Migration
  def change
    create_table :major_categories do |t|
      t.string :name
    end
  end
end
