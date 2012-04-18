require 'spec_helper'

describe Post do
  
  before do
    @blog = Blog.first || Blog.create(:name => 'First one')
  end
  
  it { should validate_presence_of :title}
  it { should belong_to :blog }

  it 'should create Post record' do
    post = Post.new(:title => 'Hello World!', :body => 'Hello there!', :blog_id => @blog.id)
    post.save.should be_true
  end

  it 'should return 10 records' do
    posts = Post.recent(10)
    posts.count.should == 10
  end

end
