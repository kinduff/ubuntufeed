class Post < ActiveRecord::Base
  attr_accessible :comments, :description, :link, :pubdate, :title
  belongs_to :blog
end
