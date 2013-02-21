require 'spec_helper'

describe Blog do
  let(:blog){ FactoryGirl.create :blog }
  describe :slug do
    it 'must be present' do
      blog.slug.should_not be_nil
    end
  end

  describe :title do
    it 'must have a title' do
      blog.title = ''
      blog.should be_invalid
    end

    it 'should have more than 5 chars' do
      blog.title = 'asdf'
      blog.should be_invalid
    end
  end

  describe :url do 
    it 'must have a url' do
      blog.url = ''
      blog.should be_invalid
    end
    it 'should have more than 5 chars' do
      blog.feed_url = 'asdf'
      blog.should be_invalid
    end
  end

  describe :feed_url do
    it 'must have a feed_url' do
      blog.feed_url = ''
      blog.should be_invalid
    end
    it 'should have more than 5 chars' do
      blog.feed_url = 'asdf'
      blog.should be_invalid
    end
  end
end
