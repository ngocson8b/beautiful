class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end
  
  def following
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], per_page: 10)
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 10)
    render 'show_follow'
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
