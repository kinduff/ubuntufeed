require 'feedzirra'

feeds_urls = [
"http://www.comoinstalarlinux.com/feed/",
"http://www.atareao.es/feed/",
"http://feeds.feedburner.com/blogalejandrocq?format=xml",
"http://chicheblog.wordpress.com/feed/",
"http://feeds.feedburner.com/emsLinux?format=xml",
"http://encodingthecode.wordpress.com/feed/",
"http://feeds.feedburner.com/EspacioLinux?format=xml",
"http://hatteras.wordpress.com/feed/",
"http://isopenisfree.wordpress.com/feed/",
"http://feeds.feedburner.com/JhosmanLizarazo?format=xml",
"http://feeds.feedburner.com/blogspot/eEKCUv?format=xml",
"http://feeds.feedburner.com/Kuyn?format=xml",
"http://feeds.feedburner.com/blogspot/eEKCUv?format=xml",
"http://libuntu.wordpress.com/feed/",
"http://feeds.feedburner.com/LinuxMusic30?format=xml",
"http://www.muylinux.com/feed/",
"http://netfaozz.wordpress.com/feed/",
"http://feeds.feedburner.com/NoSoloUnix?format=xml",
"http://feeds.feedburner.com/Nosinmiubuntu?format=xml",
"http://feeds.feedburner.com/NovatillaenApuros?format=xml",
"http://ociolinux.blogspot.mx//feeds/posts/default",
"http://feed.mundogeek.net/mundogeekfeed?format=xml",
"http://feeds.feedburner.com/PortalUbuntu?format=xml",
"http://elsoftwarelibre.wordpress.com/feed/",
"http://www.soloubuntu.com/feeds/posts/default",
"http://feeds2.feedburner.com/Ubunlog?format=xml",
"http://ubunteate.es/feed/",
"http://feeds.feedburner.com/blogspot/JOzz?format=xml",
"http://dmolinap.blogspot.mx/rss.xml",
"http://www.ubuntuleon.com/feeds/posts/default",
"http://ubuntulife.wordpress.com/feed/",
"http://ubuntutoday.com/feed/",
"http://portallinux.es/feed/",
"http://unawebmaslibre.blogspot.com/feeds/posts/default",
"http://feeds.feedburner.com/UsemosLinux?format=xml",
"http://feeds.feedburner.com/UbuntizandoElPlaneta?format=xml"
]

namespace :blogs  do
  desc "Gets blogs info"
  task :get => :environment do
    puts "Working..."
    blogs = []
    feeds = Feedzirra::Feed.fetch_and_parse(feeds_urls)
    puts "Looping through feed url's array..."
    feeds.each do |feed_url, feed|
      if Blog.where(:feed_url => feed_url).count == 0
        blogs << {
          :title => feed.title,
          :url => feed.url,
          :feed_url => feed_url,
          :visible => true
        }
        puts "\"#{feed.title}\" in array"
      end
    end
    puts "Saving..."
    if (Blog.create(blogs))
      puts "Success!"
      puts "Array: #{blogs.count}"
      puts "Database: #{Blog.count}"
    else
      puts "Something went wrong"
    end
  end
  task :show => :environment do
    puts "Working..."
    Blog.all.each do |blog|
      puts blog.title
      puts blog.url
      puts blog.feed_url
      puts blog.visible
      puts "========="
      puts " "
    end
    puts "Done!"
  end
end

namespace :update do
  desc "Update blogs"
  task :posts => :environment do
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
          puts "\"#{title}\" in array."
        end
      end
    end
    puts "Done."
    puts "Saving..."
    if (Post.create(posts))
      puts "Success!"
      puts "Saved: #{posts.count}"
    else
      puts "Something went wrong"
    end
  end
end
