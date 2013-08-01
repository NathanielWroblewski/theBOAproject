class AddUploaderToInstructionalVideos < ActiveRecord::Migration
  def change
    change_table :instructional_videos do |t|
      t.string :uploader
    end
  end
end
