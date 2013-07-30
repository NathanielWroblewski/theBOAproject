class InstructionalWorker
  include Sidekiq::Worker

  def perform(id, key)
    vid = InstructionalVideo.find(id)
    vid.key = key
    vid.remote_instructional_url = vid.instructional.direct_fog_url(with_path: true)
    vid.save!
    vid.update_column(:video_processed, true)
  end
end
