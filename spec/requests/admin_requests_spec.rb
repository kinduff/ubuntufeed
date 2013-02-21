require 'spec_helper'

describe 'Admin Requests' do
  describe 'Autheticated' do
    include AuthHelper
    before :each do
      http_login_capybara
    end
    it 'should have access to admin' do
      visit admin_index_path
      page.should have_css('.blogs_list')
    end

    it 'should hide a blog' do
      blog = FactoryGirl.create :blog
      visit ocultar_path(blog.id)
      page.should have_css('.blogs_list')
      current_path.should eql(admin_index_path)
      blog.reload
      blog.visible.should be_false
    end

    it 'should show a blog' do
      blog = FactoryGirl.create :blog, :visible => false
      visit mostrar_path(blog.id)
      page.should have_css('.blogs_list')
      current_path.should eql(admin_index_path)
      blog.reload
      blog.visible.should be_true
    end
  end
end
