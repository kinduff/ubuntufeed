class PostsController < ApplicationController

  def index
    @posts = Post.order('pubdate DESC').page params[:page]
    @number = params[:page]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @posts.to_json(
          :methods => [:date,:date_string]
      ) }
    end
  end

  def feed
    @posts = Post.order('pubdate DESC').page params[:page]
  end
end
