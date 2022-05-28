# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController # You need to implement the method below in your model (e.g. app/models/user.rb)


    def facebook
      handle_auth "Facebook"
    end

    def google_oauth2
      handle_auth "Google"
    end


    def handle_auth(kind)
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
        if is_navigational_format?
          set_flash_message(:notice, :success, kind: kind)
        end
      else
        session['devise.auth_data'] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end

    def failure
      redirect_to root_path
    end
  end
end
