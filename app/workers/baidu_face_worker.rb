class BaiduFaceWorker
  include BaiduFace
  include Sidekiq::Worker

  def perform(worker_id)
    add_faces(worker_id)
  end
end
