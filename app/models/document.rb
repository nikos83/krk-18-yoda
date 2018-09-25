# frozen_string_literal: true

class Document < ApplicationRecord
  belongs_to :bucket, optional: true
  mount_uploader :file, FileUploader
  delegate :user, to: :bucket
  accepts_nested_attributes_for :bucket, reject_if: :all_blank
end
