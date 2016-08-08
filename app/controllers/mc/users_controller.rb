class Mc::UsersController < Mc::BaseController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
    @users = User.all.order('uid')
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
    @user.uid = @user.uid.downcase

    # default values for those not assigned
    @user.provider = 'ivle';
    @user.gender = '';
    @user.matriculation_year = '';
    @user.first_major = '';
    @user.second_major = '';

		respond_to do |format|
			if @user.save
				format.html { redirect_to [:mc, @user], notice: 'User is successfully created' }
				format.json { render json: @user, status: :created, location: @user }
			else
				format.html { render 'new' }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to mc_user_path
		else
			render 'edit'
		end
	end

	def destroy
		@user.destroy
		redirect_to mc_users_path
  end

  private
	def set_user
		@user = User.find(params['id'])
	end

	def user_params
		params.require('user').permit('uid', 'name', 'email', 'faculty')
	end
end
