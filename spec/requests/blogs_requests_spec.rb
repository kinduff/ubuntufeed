require 'spec_helper'

describe 'Blogs Request' do
  describe 'Submit a new Blog' do
    it 'should create a new blog' do
      visit new_blog_path
      fill_in I18n.t('activerecord.attributes.blog.title'), :with => 'Mi Blog'
      fill_in I18n.t('activerecord.attributes.blog.url'), :with => 'http://lolololo.com'
      fill_in I18n.t('activerecord.attributes.blog.feed_url'), :with => 'http://lolololo.com/feed'
      click_button 'Enviar blog'
      page.should have_content('Tu blog se ha recibido')
    end

    it 'should not create a blog if invalid' do
      visit new_blog_path
      click_button 'Enviar blog'
      page.should have_selector('form')
    end
  end
end
