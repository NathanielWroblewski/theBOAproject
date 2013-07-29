class Position < ActiveRecord::Base
  has_many :sub_positions
  has_many :grips, through: :sub_positions

  validates_presence_of :name
end
