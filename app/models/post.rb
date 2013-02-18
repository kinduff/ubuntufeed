class Post < ActiveRecord::Base
  attr_accessible :link, :pubdate, :title, :blog_id, :slug, :description
  belongs_to :blog

  before_save do
    if new_record?
      self.slug = self.title.parameterize
    end
  end
end
