class AdminController < ApplicationController
  include AdminHelper
  http_basic_authenticate_with :name => ENV['U'], :password => ENV['P']
  def index
    @blogs = Blog.order('title ASC').all
  end
  def ocultar
    blog = Blog.find params[:id]
    blog.visible = false
    if blog.save
      redirect_to admin_path
    end
  end
  def mostrar
    blog = Blog.find params[:id]
    blog.visible = true
    if blog.save
      redirect_to admin_path
    end
  end
  def eliminar
    blog = Blog.find params[:id]
    if blog.destroy
      redirect_to admin_path
    end
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.new params[:blog]
    @blog.visible = true
    if @blog.save
      flash[:notice] = true
      redirect_to :new_admin
    else
      render :new
    end
  end
  def edit
    @blog = Blog.find params[:id]
  end
  def update
    @blog = Blog.find params[:id]
    if @blog.update_attributes params[:blog]
      flash[:notice] = true
      redirect_to :admin_edit
    else
      render :edit
    end
  end
  def actualizar ## OINK!
    feeds_urls = []
    posts = []
    tweets = []
    Blog.where(:visible => true).each do |blog|
      feeds_urls << blog.feed_url
    end
    feeds = Feedzirra::Feed.fetch_and_parse(feeds_urls)
    feeds.each do |feed_url, feed|
      feed.entries.each do |entry|
        unless entry.title.nil?
          if (Post.where(:link => entry.url).count == 0) && (Post.where(:slug => entry.title.parameterize).count == 0)
            title = entry.title
            link = entry.url
            unless entry.summary.nil?
              description = entry.summary.sanitize[0..140]
            end
            pubdate = entry.published
            blog_id = Blog.find_by_feed_url(feed_url).id
            short = short link
            tweets << "#{title} #{short}"
            posts << {
              :title => title,
              :link => link,
              :description => description,
              :pubdate => pubdate,
              :blog_id => blog_id
            }
          end
        end
      end
    end
    if params[:arg] == '2'
      redirect_to admin_path, :flash => { :info => "#{posts.count} posts pendientes." }
    else
      if (Post.create(posts))
        if params[:arg] == '1'
          tweets.each do |t|
            tweet t
          end
        end
        redirect_to admin_path, :flash => { :info => "#{posts.count} posts guardados correctamente." }
      else
        redirect_to admin_path, :flash => { :info => "Oh noes! Error. Intenta de nuevo." }
      end
    end
  end
  def stats
    @stats = Stat.order('clicks DESC')
  end
  def encuesta
    @encuestas = Encuesta.order('created_at DESC')
  end
end
