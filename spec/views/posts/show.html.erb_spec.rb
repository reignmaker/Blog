require "spec_helper"

describe 'posts/show' do

  before(:each) do
    @user ||= build(:user)
    @blogs = [build(:blog), build(:blog, :name => 'Blog name')]
  end

  it 'displays one post' do
    assign(:post, create(:post))
    render
    rendered.should =~ /World/
    rendered.should =~ /there/
  end

  it 'displays action buttons if signed in' do
    assign(:post, create(:post))
    view.stub(:user_signed_in?).and_return(true)
    render
    rendered.should =~ /Edit/
    rendered.should =~ /Destroy/
  end

end