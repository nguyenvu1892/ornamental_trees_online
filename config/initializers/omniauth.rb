OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1747687288588976', '289e57448ed6c2d79c8503d1cd20201e'
end
