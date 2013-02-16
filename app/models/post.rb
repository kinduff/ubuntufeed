class Post < ActiveRecord::Base
  attr_accessible :description, :link, :pubdate, :title, :blog_id, :slug
  belongs_to :blog

  before_save do
    if new_record?
      self.slug = self.title.parameterize
    end
  end
end
