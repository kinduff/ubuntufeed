class PostsController < ApplicationController
  def index
    @entradas = Post.order('pubdate DESC').all
  end
end
