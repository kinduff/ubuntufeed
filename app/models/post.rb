# coding: utf-8
class Post < ActiveRecord::Base
  attr_accessible :link, :pubdate, :title, :blog_id, :slug, :description
  belongs_to :blog
  has_one :stat

  before_save do
    if new_record?
      self.slug = self.title.parameterize
    end
  end

  def date
    date = I18n.localize(Time.at(self.pubdate.to_time), :format => '%A, %d de %B de %Y' )
    today = I18n.localize(Time.at(Time.now), :format => '%A, %d de %B de %Y' )
    if date == today
      return "Entradas del día de hoy"
    else
      return date
    end
  end

  def date_string
    "#{Time.at(self.pubdate.to_time).day}#{Time.at(self.pubdate.to_time).month}#{Time.at(self.pubdate.to_time).year}"
  end

end
