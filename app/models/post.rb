class Post < ActiveRecord::Base
  attr_accessible :link, :pubdate, :title, :blog_id, :slug, :description
  belongs_to :blog

  before_save do
    if new_record?
      self.slug = self.title.parameterize
    end
  end

  def date
     I18n.localize(Time.at(self.pubdate), :format => '%A, %d de %B de %Y' )
  end

  def date_string
    "#{self.pubdate.day}#{self.pubdate.month}#{self.pubdate.year}"
  end

end
