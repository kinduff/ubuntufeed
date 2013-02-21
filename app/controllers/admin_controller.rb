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
  def update
    feeds_urls = []
    posts = []
    tweets = []
    Blog.where(:visible => true).each do |blog|
      feeds_urls << blog.feed_url
    end
    feeds = Feedzirra::Feed.fetch_and_parse(feeds_urls)
    feeds.each do |feed_url, feed|
      feed.entries.each do |entry|
        if Post.where(:link => entry.url).count == 0
          unless entry.title.nil?
            title = entry.title
            link = entry.url
            unless entry.summary.nil?
              description = entry.summary.sanitize[0..140]
            end
            pubdate = entry.published
            blog_id = Blog.find_by_feed_url(feed_url).id
            tweets << "#{title} #{link}"
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
    if (Post.create(posts))
      tweets.each do |t|
        tweet t
      end
      redirect_to admin_index_path, :flash => { :info => "#{posts.count} posts guardados correctamente y tuits enviados." }
    else
      redirect_to admin_index_path, :flash => { :info => "Oh noes! Error. Intenta de nuevo." }
    end
  end
end
