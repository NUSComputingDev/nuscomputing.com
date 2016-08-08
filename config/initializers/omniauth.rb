Rails.application.config.middleware.use OmniAuth::Builder do
  provider :ivle, api_key: Rails.application.secrets.IVLE_KEY
  provider :google_oauth2, Rails.application.secrets.GOOGLE_CLIENT_ID, Rails.application.secrets.GOOGLE_CLIENT_SECRET

	on_failure { |env| AuthenticationsController.action(:failure).call(env) }
end
