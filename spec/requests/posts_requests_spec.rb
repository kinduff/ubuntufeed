require 'spec_helper'

describe 'Posts Request' do
  describe 'Posts list' do
    it 'Should display the posts' do
      post = FactoryGirl.create :post
      visit posts_path
      page.should have_content(post.title)
    end
  end
end
