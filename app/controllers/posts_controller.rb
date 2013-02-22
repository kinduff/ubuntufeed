class PostsController < ApplicationController

  def index
    @posts = Post.order('pubdate DESC').page params[:page]
    @number = params[:page]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @posts.to_json(
          :methods => [:date,:date_string],
          :include => { :blog => { :only => :title } }
      ) }
    end
  end

  def feed
    @posts = Post.order('pubdate DESC').page params[:page]
  end

  def post
    post = Post.find params[:id]
    stat = Stat.find_or_create_by_post_id(params[:id])
    if stat.clicks.nil?
      stat.clicks = 1
    else
      stat.clicks += 1
    end
    if stat.save
      redirect_to post.link
    else
      redirect_to post.link
    end
  end
end
