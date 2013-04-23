FactoryGirl.define do
  factory :blog do
    title    'Some Nice Blog'
    url      'http://linktomyblog.com'
    feed_url 'http://feedformybloh.com'
  end

  factory :post do
    link        'http://linktothepost/'
    pubdate     DateTime.now
    title       'Post Title'
    blog_id     { FactoryGirl.create(:blog).id }
    description 'Some long text'
  end
end
