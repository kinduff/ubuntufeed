require 'spec_helper'
describe BlogsController do
  describe 'GET new' do
    it 'should succeed' do
      get :new
      response.status.should eql(200)
      response.should render_template(:new)
    end
  end

  describe 'POST create' do
    it 'should render template if not valid' do
      blog = FactoryGirl.attributes_for :blog, :title => ''
      post :create, :blog => blog
      response.should render_template(:new)
    end

    it 'should redirect if valid' do
      blog = FactoryGirl.attributes_for :blog
      post :create, :blog => blog
      response.should redirect_to( new_blog_path )
    end
  end

  describe 'GET index' do
    it 'should succeed' do
      get :index
      response.status.should eql(200)
      response.should render_template(:index)
    end
  end
end
