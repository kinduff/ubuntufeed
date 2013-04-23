# encoding: utf-8
require "#{Rails.root}/app/helpers/admin_helper"
include AdminHelper
require 'feedzirra'

namespace :update do
  desc "Update blogs"
  task :posts, [:tweet] => :environment do |t, args| ## OINK!
    puts "Working..."
    feeds_urls = []
    posts = []
    tweets = []
    Blog.where(:visible => true).each do |blog|
      feeds_urls << blog.feed_url
    end
    feeds = Feedzirra::Feed.fetch_and_parse(feeds_urls)
    feeds.each do |feed_url, feed|
      unless feed == 0
        unless feed.entries == 0
          puts " "
          puts "=========================================="
          puts "Looping through \"#{feed.title}\" entries."
          puts "=========================================="
          puts " "
          feed.entries.each do |entry|
            unless entry == 0
              unless entry.title.nil?
                if (Post.where(:link => entry.url).count == 0) && (Post.where(:slug => entry.title.parameterize).count == 0)
                  title = entry.title
                  link = entry.url
                  unless entry.summary.nil?
                    description = entry.summary.sanitize[0..140]
                  end
                  pubdate = entry.published
                  blog_id = Blog.find_by_feed_url(feed_url).id
                  posts << {
                    :title => title,
                    :link => link,
                    :description => description,
                    :pubdate => pubdate,
                    :blog_id => blog_id
                  }
                  short = short link
                  tweets << "#{title} #{short}"
                  puts "\"#{title}\" in array."
                end
              end
            end
          end
        end
      end
    end
    puts "Done."
    puts "Saving..."
    if (Post.create(posts))
      puts "Success!"
      puts "Saved: #{posts.count}"
      log = Log.new({:new_posts => posts.count, :log_type => 2})
      log.save
      if args[:tweet]
        puts "Tweeting posts to @UbuntuF..."
        puts "=========================================="
        tweets.each do |t|
          if tweet(t)
            puts "\"#{t}\" tweeted."
          end
        end
        puts "=========================================="
        puts "Done!"
      end
    else
      puts "Something went wrong"
    end
  end
  task :show => :environment do
    puts "Working..."
    feeds_urls = []
    posts = []
    Blog.where(:visible => true).each do |blog|
      feeds_urls << blog.feed_url
    end
    feeds = Feedzirra::Feed.fetch_and_parse(feeds_urls)
    feeds.each do |feed_url, feed|
      puts " "
      puts "=========================================="
      puts "Looping through \"#{feed.title}\" entries."
      puts "=========================================="
      puts " "
      feed.entries.each do |entry|
        if Post.where(:link => entry.url).count == 0
          unless entry.title.nil?
            title = entry.title
            link = entry.url
            posts << {
              :title => title,
              :link => link
            }
            puts "\"#{title}\" in array."
          end
        end
      end
    end
    puts "=========================================="
    puts "#{posts.count} posts in array."
  end
end
