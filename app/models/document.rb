# frozen_string_literal: true

class Document < ApplicationRecord
  attr_accessor :new_bucket_name
  before_save :create_bucket_from_name
  belongs_to :bucket
  mount_uploader :file, FileUploader
  delegate :user, to: :bucket

  def create_bucket_from_name
    create_bucket(name: new_bucket_name) unless new_bucket_name.blank?
      
    end
  end

end
