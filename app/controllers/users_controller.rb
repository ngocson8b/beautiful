class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end
  
  def live_search
		if(params[:email])
		    @users = User.where("lower(email) LIKE ?", '%' + params[:email].downcase + '%')
		    respond_to do |format|
		      format.js
			  end
		end
  end
end
