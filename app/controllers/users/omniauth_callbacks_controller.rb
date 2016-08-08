class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def ivle
		# You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in @user
      @user.remember_me!
      set_flash_message(:notice, :success, :kind => "IVLE") if is_navigational_format?
      redirect_to root_path
		else
			flash[:alert] = "Cannot process your authentication request."
			redirect_to root_path
    end
	end
end
