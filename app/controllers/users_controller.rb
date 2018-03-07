class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		@user.save
	end
    def edit
        @user = User.find(params[:uid])
    end
	def update
	    @user = User.find(params[:uid])
	    @user.update(user_params)
	    redirect_to user_path(@user.uid)
	end
	def show
	    @user = User.find(params[:uid])
   		@events = @user.events.page(params[:page])
	end

	private
	def user_params
	    params.require(:user).permit(:name, :profile_image, :uid, :email, :password)
	end
end