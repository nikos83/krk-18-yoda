class Document < ApplicationRecord
    belongs_to :bucket
    mount_uploader :file, PhotoUploader
    delegate :user, to: :bucket
end
