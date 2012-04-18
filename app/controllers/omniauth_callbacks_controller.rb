class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def twitter
    omniauth = request.env['omniauth.auth']
    if auth = Authentication.find_by_uid_and_provider(omniauth['uid'], omniauth['provider'])
      sign_in_and_redirect(:user, auth.user)
    elsif omniauth['info']['email']
      if user = User.find_by_email(omniauth['info']['email'])
        user.apply_omniauth(omniauth)
      else
        user = User.create(:email => omniauth['info']['email'], :password => Devise.friendly_token)
      end
      sign_in_and_redirect(:user, user)
    else
      user = User.new(:email => omniauth['info']['email'], :password => Devise.friendly_token)
      user.apply_omniauth(omniauth)
      if user.save
        sign_in_and_redirect :user, user
      else
        session['devise.omniauth'] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end
  
  def yandex
    omniauth = request.env['omniauth.auth']
    if auth = Authentication.find_by_uid_and_provider(omniauth['uid'], omniauth['provider'])
      sign_in_and_redirect(:user, auth.user)
    elsif omniauth['info']['email'].length > 0 # wtf? yandex sets emty hash if no email
      if user = User.find_by_email(omniauth['info']['email'])
        user.apply_omniauth(omniauth)
      else
        user = User.create(:email => omniauth['info']['email'], :password => Devise.friendly_token)
      end
      sign_in_and_redirect(:user, user)
    else
      user = User.new(:email => omniauth['info']['email'], :password => Devise.friendly_token)
      user.apply_omniauth(omniauth)
      if user.save
        sign_in_and_redirect :user, user
      else
        session['devise.omniauth'] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end
end