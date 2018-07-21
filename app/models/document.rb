class Document < ApplicationRecord
    belongs_to :bucket
    mount_uploader :name, PhotoUploader
end
