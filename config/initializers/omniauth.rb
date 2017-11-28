Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, ENV["MR_MANAGER_ID"], ENV["MR_MANAGER_SECRET"], scope: 'identity.basic,identity.email,chat:write:bot'
end
