# frozen_string_literal: true

class Document < ApplicationRecord
  mount_uploader :file, FileUploader
  delegate :user, to: :bucket
  belongs_to :bucket
  attr_accessor :new_bucket_name
end
