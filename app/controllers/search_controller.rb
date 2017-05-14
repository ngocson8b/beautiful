class SearchesController < ApplicationController
  def index
    q = params[:search]
    users = User.search(fullname_or_username_or_email_cont: q).result
      .includes(:user)
    @items = users + badges
    respond_to do |format|
      format.js
      format.html
    end
  end
end