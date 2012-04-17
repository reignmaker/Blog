require 'spec_helper'

describe PostsController do
  describe 'GET index' do
    
    it 'should be successfull' do
      get :index
      response.should be_success
    end

    it 'assigns all posts to @posts' do
      get :index
      assigns(:posts).should_not be_nil
    end

    it 'should render index template' do
      get :index
      response.should render_template :index
    end

  end

  describe 'GET show' do
    
    it 'should be successfull' do
      get :show, :id => 2
      response.should be_success
    end

    it 'assigns post to @post' do
      get :show, :id => 1
      assigns(:post).should be_kind_of(Post)
    end

    it 'should render show template' do
      get :show, :id => 1
      response.should render_template :show
    end

  end

end