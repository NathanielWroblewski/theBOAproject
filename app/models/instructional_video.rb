class InstructionalVideo < ActiveRecord::Base
  belongs_to :grip
  belongs_to :major_category
  belongs_to :instructional_video_uploader
end
