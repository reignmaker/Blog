class BlogsController < ApplicationController

  respond_to :html

  def index
    @posts = Post.recent(10)
  end

end