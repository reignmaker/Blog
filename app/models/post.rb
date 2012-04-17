class Post < ActiveRecord::Base
  attr_accessible :body, :title, :blog_id
  belongs_to :blog
  validates_presence_of :title, :blog_id

  def self.recent(max_count = nil)
    scope = order('posts.updated_at DESC')
    scope = scope.limit(max_count) if max_count
    scope
  end

  def blog_name
    blog.name    
  end

end
