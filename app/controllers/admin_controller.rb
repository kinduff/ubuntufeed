class AdminController < ApplicationController
  http_basic_authenticate_with :name => ENV['U'], :password => ENV['P']
  def index
    @blogs = Blog.all
  end
end
