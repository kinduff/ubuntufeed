class AdminController < ApplicationController
  http_basic_authenticate_with :name => ENV['U'], :password => ENV['P']
  def index
    @blogs = Blog.order('title ASC').all
  end
  def ocultar
    blog = Blog.find params[:id]
    blog.visible = false
    if blog.save
      redirect_to admin_index_path
    end
  end
  def mostrar
    blog = Blog.find params[:id]
    blog.visible = true
    if blog.save
      redirect_to admin_index_path
    end
  end
end
