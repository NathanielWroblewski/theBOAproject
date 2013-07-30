CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id:'AKIAJM2MR2VOK5BYICPQ',
    aws_secret_access_key: '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',
    region: 'us-west-2'
  }
  config.fog_directory = 'boaproject'
end
