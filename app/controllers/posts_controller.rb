class PostsController < ApplicationController
  def index
    @posts = Post.order('pubdate DESC').page params[:page]
    @number = params[:page]
  end
  def about
    @blogs = Blog.all
  end
  def enviar
    
  end
end
