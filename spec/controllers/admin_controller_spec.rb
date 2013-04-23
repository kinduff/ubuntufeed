require 'spec_helper'

describe AdminController do
  describe 'unauthenticated' do
    it 'should not access to index' do
      get :index
      response.status.should eql(401)
    end

    it 'should not hide a blog' do
      get :ocultar, :id => FactoryGirl.create(:blog)
      response.status.should eql(401)
    end

    it 'should not show a blog' do
      get :mostrar, :id => FactoryGirl.create(:blog)
      response.status.should eql(401)
    end
  end

  describe 'authenticated' do
    include AuthHelper
    before :each do
      http_login
    end

    it 'should access to index' do
      get :index
      response.status.should eql(200)
      response.should render_template(:index)
    end

    it 'should hide a blog' do
      get :ocultar, :id => FactoryGirl.create(:blog)
      response.should redirect_to(:admin_index)
    end

    it 'should show a blog' do
      get :mostrar, :id => FactoryGirl.create(:blog)
      response.should redirect_to(:admin_index)
    end
  end
end
