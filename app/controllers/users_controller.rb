class UsersController < ApplicationController
<<<<<<< HEAD
=======
	def show
	  	@user = User.find(params[:id])
	  	@post_images = @user.post_images.page(params[:page]).reverse_order
	end

	def edit
        @user = User.find(params[:id])
    end
>>>>>>> origin/master
end
