if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, key: '_baby-needs', domain: 'baby-needs-json-api'
else
  Rails.application.config.session_store :cookie_store, key: '_baby-needs'
end