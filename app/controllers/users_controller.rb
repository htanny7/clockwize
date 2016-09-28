class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	# GET /users
	# GET /users.json
	def index
		@users = User.all
		render json: @users
	end

	# GET /users/1
	# GET /users/1.json
	def show
	end

	# GET /users/new
	def new
		@user = User.new
	end

	# GET /users/1/edit
	def edit
	end

	# POST /users
	# POST /users.json
	# This is a simple way create or sign-in user
	def create
		respond_to :json

		@user = User.find_by(email: user_params[:email])
		if @user.nil?
			@user = User.new(user_params)
			@user.save
		end

		if @user.errors.blank?
			format.json { render json: @user, status: :created }
		else
			format.json { render json: @user.errors, status: :unprocessable_entity }
		end
	end

	# PATCH/PUT /users/1
	# PATCH/PUT /users/1.json
	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to @user, notice: 'User was successfully updated.' }
				format.json { render :show, status: :ok, location: @user }
			else
				format.html { render :edit }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /users/1
	# DELETE /users/1.json
	def destroy
		@user.destroy
		respond_to do |format|
			format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	def is_signed_in?
		!current.blank?
	end

	# Sign in; return errors if there is a current signed-in.
	def sign_in
		if is_signed_in?
			format.json { render json: @user.errors, status: :unprocessable_entity }
		else
			current.blank?
		end
	end

	# Get and set current user
	def current
		session['current_user']
	end

	private

	# Set current user
	def current(user)
		session['current_user'] = user
	end

	# Use callbacks to share common setup or constraints between actions.
	def set_user
		@user = User.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def user_params
		params.require(:user).permit(:email)
	end
end
