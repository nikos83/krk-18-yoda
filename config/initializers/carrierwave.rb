CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     Rails.application.credentials.dig(:aws, :access_key_id),
      aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
      use_iam_profile:       true,
      region:                Rails.application.credentials.dig(:aws, :region),
      host:                  'localhost:3000',
      endpoint:              'http://localhost:3000'
  }
  config.fog_directory  = Rails.application.credentials.dig(:aws, :bucket)
  config.fog_public     = false
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
end