class PostsController < ApplicationController
  def index
    @posts = Post.order('pubdate DESC').page params[:page]
    @number = params[:page]
  end
  def about
    @blogs = Blog.visibles.all
  end
  def enviar
    @blog = Blog.new
  end
  def enviar_go
    @blog = Blog.new params[:blog]
    if @blog.save
      flash[:notice] = true
      redirect_to :enviar
    else
      render :enviar
    end
  end
end
