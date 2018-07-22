# frozen_string_literal: true

class FileUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png pdf)
  end

  def size_range
    0.1..20.megabytes
  end
end
