class PostsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
      @post = current_user.posts.build
  end

  def index
    @post = Post.all
  end

  def upvote
    if !current_user.liked? @post
      @post.liked_by current_user
    elsif current_user.liked? @post
      #as the above method can also result nil if he is yet to vote
      @post.unliked_by current_user 
    end
  end 
  
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def create
    @post = current_user.posts.build(permit_post)
    if @post.save
      flash[:success] = "Success!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end
  
  private
    def permit_post
      params.require(:post).permit(:image, :description)
    end
end
