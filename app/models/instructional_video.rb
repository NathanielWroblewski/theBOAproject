class InstructionalVideo < ActiveRecord::Base
  belongs_to :grip
  belongs_to :major_category
end
