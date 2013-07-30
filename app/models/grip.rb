class Grip < ActiveRecord::Base
  belongs_to :sub_position
  has_many :instructional_videos
  has_many :major_categories, through: :instructional_videos

end
