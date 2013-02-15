class Post < ActiveRecord::Base
  attr_accessible :description, :link, :pubdate, :title, :blog_id
  belongs_to :blog
end
