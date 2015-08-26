CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJFJ7322FQXGSWAZQ',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-1'                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'modulions-prj-img'                          # required

end