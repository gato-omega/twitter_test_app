class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      ap user.attributes
      ap user.errors.full_messages
      redirect_to new_user_session_url
    end

  end
  alias_method :twitter, :all

end
