class StaticPagesController < ApplicationController
  def home
    if current_user
      @post = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)
    end
  end
end
