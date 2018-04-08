class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		@user.save
	end
    def edit
        @user = User.find(params[:id])
    end
	def update
	    @user = User.find(params[:id])
	    @user.update(user_params)
	    redirect_to user_path(@user.id)
	end
	def show
	    @user = current_user
   		#@events = @user.events.page(params[:page])
   		@events = @user.events
	end

	private
	def user_params
	    params.require(:user).permit(:id, :name, :profile_image, :uid, :email, :password)
	end
end