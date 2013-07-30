class InstructionalVideos < ActiveRecord::Migration
  def change
    create_table :instructional_videos do |t|
      t.string :instructional, InstructionalUploader
      t.string :url
      t.string :title
      t.text :description
      t.boolean :video_processed
      t.references :major_category
      t.references :grip
    end
  end
end
