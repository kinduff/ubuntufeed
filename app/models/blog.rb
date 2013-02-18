class Blog < ActiveRecord::Base
  attr_accessible :title, :url, :logo, :feed_url, :slug
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :posts
  validate :validar

  before_save do
    if new_record?
      self.slug = self.title.parameterize
    end
  end
  def validar
    errors.add :title, "Escribe un titulo" unless self.title.parameterize.length >= 5
    errors.add :url, "Escribe una URL" unless self.url.parameterize.length >= 5
    errors.add :feed_url, "Escribe una URL" unless self.feed_url.parameterize.length >= 5
  end
end
