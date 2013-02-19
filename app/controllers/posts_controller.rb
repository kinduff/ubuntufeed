class PostsController < ApplicationController

  def index
    @posts = Post.order('pubdate DESC').page params[:page]
    @number = params[:page]
  end

  def feed
    @posts = Post.order('pubdate DESC').page params[:page]
  end
end
