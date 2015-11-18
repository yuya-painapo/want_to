class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # raise request.env['omniauth.auth'].to_yaml
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"])
    p "------------------------return-------------------------------"
    p request.env["omniauth.auth"]
    p "-------------------------@user------------------------------"
    p @user
    
   if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?   
    #  redirect_to welcome_index_url
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url #new_user_registration_url
    end
  end

end
