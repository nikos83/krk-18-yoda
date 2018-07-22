class FileUploadMailer < ApplicationMailer

  def confirmation_upload(document)
    @document = document
    binding.pry
    @user = document.user
    mail(to: @user.email, subject: "Your file was uploaded successfully")
  end
end
