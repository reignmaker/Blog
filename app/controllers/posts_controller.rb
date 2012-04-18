class PostsController < ApplicationController

  respond_to :html

  def index
    @posts = Post.includes(:blog).recent(15)
    @blogs = Blog.all
  end

  def show
    @post = Post.find(params[:id])
    @blogs = Blog.all
  end

  def edit
    @post = Post.find(params[:id])
    @blogs = Blog.all
  end

  def new
    @blogs = Blog.all
    @post = Post.new  
  end

  def create
    @post = Post.new(params[:post])
    @post.save ? respond_with(@post) : render(:new)
  end

  def update
    @post = Post.find(params[:id]) 
    @post.update_attributes(params[:post]) ? respond_with(@post) : render(:edit)
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to root_path
  end

end