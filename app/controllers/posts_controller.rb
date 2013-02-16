class PostsController < ApplicationController
  def index
    @entradas = Post.order('pubdate DESC').all.page params[:page]
  end
end
