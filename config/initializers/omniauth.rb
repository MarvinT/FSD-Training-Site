require 'openid/store/filesystem' 

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :google_apps, :store => OpenID::Store::Filesystem.new('./tmp'), :domain => 'fsdinternational.org', :name =>'admin'
  provider :google_apps, :store => OpenID::Store::Filesystem.new('./tmp'),  :domain => 'fsdinternational.org', :name =>'admin'
end
