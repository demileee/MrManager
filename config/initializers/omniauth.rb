Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, ENV["MRMANAGER_ID"], ENV["MRMANAGER_SECRET"], scope: 'users:read'
end
