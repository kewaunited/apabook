require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "3b5eea33268cf3f2f9ce9bbdfcde799d585397b8d7a5af38f7eec525849a53cb"

  url_format "/media/:job/:name"

  if Rails.env.development? || Rails.env.test?
    datastore :file,
              root_path: Rails.root.join('public/system/dragonfly', Rails.env),
              server_root: Rails.root.join('public')
  else
    datastore :s3,
              bucket_name: 'apabook',
              access_key_id: ENV['AWS_KEY'],
              secret_access_key: ENV['AWS_SEC'],
              url_scheme: 'https',
              region: 'eu-central-1'
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
