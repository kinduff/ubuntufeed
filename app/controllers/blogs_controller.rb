class BlogsController < ApplicationController

  def create
    @blog = Blog.new params[:blog]
    if @blog.save
      flash[:notice] = true
      redirect_to :new
    else
      render :new
    end
  end

  def new
    @blog = Blog.new
  end

  def index
     @blogs = Blog.visibles.all
  end
end
