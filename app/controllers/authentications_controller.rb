class AuthenticationsController < ApplicationController
	def ivle
		logger.info "omniauth info: #{request.env['omniauth.auth']}"
		@user = User.from_omniauth(request.env["omniauth.auth"])
    update_user(request.env["omniauth.auth"], @user)

    if @user.persisted?
      sign_in @user
      @user.remember_me!
      flash[:notice] = "Successfully logged in"
			redirect_to after_sign_in_path_for(@user)
		else
			flash[:alert] = "Cannot process your authentication request."
			redirect_to portal_login_path
		end
	end

	def google_oauth2
		omniauth = request.env["omniauth.auth"]
		if Member.find_by(email: omniauth.info['email'])
			@member = Member.from_omniauth(request.env["omniauth.auth"])

			if @member.persisted?
				sign_in @member
				@member.remember_me!
				session["gollum.author"] = { name: @member.email, email: @member.email }
				flash[:notice] = "Successfully logged in"
				redirect_to mc_root_path
			else
				flash[:alert] = "Cannot process your authentication request."
				redirect_to mc_login_path
			end
		else
			flash[:alert] = "Cannot process your authentication request."
			redirect_to mc_login_path
		end
  end

  private
  def update_user(auth, user)
    email = auth.info['email']
    name = auth.extra['profile']['Name']
    faculty = auth.extra['profile']['Faculty']
    first_major = auth.extra['profile']['FirstMajor']
    second_major = auth.extra['profile']['SecondMajor']
    gender = auth.extra['profile']['Gender']
    matriculation_year = auth.extra['profile']['MatriculationYear']
    user.update email: email,
                name: name,
                faculty: faculty,
                first_major: first_major,
                second_major: second_major,
                gender: gender,
                matriculation_year: matriculation_year
  end
end
