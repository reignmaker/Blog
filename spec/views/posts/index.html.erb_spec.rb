require "spec_helper"

describe 'posts/index' do
  
  before(:each) do
    @user ||= build(:user)
    sign_in @user
    @blogs = [build(:blog), build(:blog, :name => 'Blog name')]
  end
  
  it 'displays all the posts' do
    assign(:posts, [create(:post, :title => 'Welcome!'), create(:post)])
    render
    rendered.should =~ /Welcome/
    rendered.should =~ /Hello/
  end

  it 'hides action buttons if not signed in' do
    assign(:posts, [create(:post, :title => 'Welcome!'), create(:post)])
    render
    rendered.should_not =~ /Edit/
    rendered.should_not =~ /Destroy/
  end

end