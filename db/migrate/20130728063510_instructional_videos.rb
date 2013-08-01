class InstructionalVideos < ActiveRecord::Migration
  def change
    create_table :instructional_videos do |t|
      t.string :url
      t.string :title
      t.text :description
      t.references :major_category
      t.references :grip
    end
  end
end
