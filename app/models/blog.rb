class Blog < ActiveRecord::Base
  attr_accessible :title, :url, :logo, :feed_url, :slug
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :posts

  before_save do
    if new_record?
      self.slug = self.title.parameterize
    end
  end
end
