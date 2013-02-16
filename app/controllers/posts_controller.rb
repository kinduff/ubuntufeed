class PostsController < ApplicationController
  def index
    @entradas = Post.order('pubdate DESC').page params[:page]
  end
end
