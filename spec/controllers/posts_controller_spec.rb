require 'spec_helper'

describe PostsController do
  describe 'GET index' do
    it 'should succedd' do
      get :index
      response.status.should eql(200)
      response.should render_template(:index)
    end
  end

  describe 'GET feed' do
    it 'should render the feed template' do
      get :feed
      response.status.should eql(200)
      response.should render_template(:feed)
    end
  end
end
