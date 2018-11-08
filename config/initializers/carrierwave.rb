
  CarrierWave.configure do |config|
if Rails.env.development? || Rails.env.test?
  config.storage :file
else
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                            # required
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],         # required
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],     # required
    }
    config.fog_directory  = ENV['S3_BUCKET_PRODUCTION']                 # required
    config.fog_public     = true                                   # optional, defaults to true
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'files'
    config.permissions = 0777
    config.fog_provider = 'fog/aws'
  end
end
