# Rails.application.config.middleware.use OmniAuth::Builder do
# #  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'] , {redirect_uri: 'https://desolate-journey-54830.herokuapp.com/users/auth/google_oauth2/callback'}
#
# end
# OmniAuth.config.allowed_request_methods = %i[get]
OmniAuth.config.allowed_request_methods = [:post]
