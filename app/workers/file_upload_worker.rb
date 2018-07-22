class FileUploadWorker
  include Sidekiq::Worker

  def perform
    puts "do something"
  end
end
