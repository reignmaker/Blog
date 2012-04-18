require "spec_helper"

describe 'posts/index' do

  it 'displays all the posts' do
    assign(:posts, [create(:post, :title => 'Welcome!'), create(:post)])
    render
    rendered.should =~ /Welcome/
    rendered.should =~ /Hello/
  end

end

describe 'posts/show' do

  it 'displays one post' do
    assign(:post, create(:post))
    render
    rendered.should =~ /World/
    rendered.should =~ /there/
  end

end