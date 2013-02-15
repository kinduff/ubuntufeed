class Blog < ActiveRecord::Base
  attr_accessible :title, :url, :logo, :feed_url
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :posts
end
