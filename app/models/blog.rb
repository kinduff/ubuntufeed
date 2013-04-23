class Blog < ActiveRecord::Base
  attr_accessible :title, :url, :logo, :feed_url, :slug, :visible
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :posts

  validates :title,    :presence => true, :length => { :minimum => 5 }
  validates :url,      :presence => true, :length => { :minimum => 5 }
  validates :feed_url, :presence => true, :length => { :minimum => 5 }

  before_save do
    if new_record?
      self.slug = self.title.parameterize
    end
  end

  def self.visibles
    self.where :visible => true
  end
end
