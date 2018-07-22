class FileUploadWorker
  include Sidekiq::Worker

  def perform(document_id)
    document = Document.find(document_id)
    FileUploadMailer.confirmation_upload(document)
  end
end
