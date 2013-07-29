class SubPosition < ActiveRecord::Base
  belongs_to :position
  has_many :grips

  validates_presence_of :name
  validates_presence_of :position_id
end
