class InstructionalVideo < ActiveRecord::Base
  belongs_to :grip
  belongs_to :major_category
  mount_uploader :instructional, InstructionalUploader

  after_save :enqueue_instructional

  def instructional_name
    File.basename(instructional.path || instructional.filename) if instructional
  end

  def enqueue_instructional
    InstructionalWorker.perform_async(id, key) if key.present?
  end
end
