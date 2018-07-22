class FileUploadMailer < ApplicationMailer

  def confirmation_upload(document_id)
    document = Document.find(document_id)
    # @user = document.bucket.user
    mail(to: 'labasdamian@gmail.com', subject: "Your file was uploaded successfully")
  end
end
