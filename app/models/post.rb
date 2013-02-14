class Post < ActiveRecord::Base
  attr_accessible :comments, :description, :link, :pubdate, :title
end
