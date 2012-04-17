class PostsController < ApplicationController

  #respond_to :html

  def index
    @posts = Post.includes(:blog).recent(15)
  end

  def show
    @post = Post.find(params[:id])
  end

end