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
    authenticate_user!
    @post = Post.find(params[:id])
    @blogs = Blog.all
  end

  def new
    authenticate_user!
    @blogs = Blog.all
    @post = Post.new  
  end

  def create
    authenticate_user!
    @post = Post.new(params[:post])
    @post.save ? respond_with(@post) : render(:new)
  end

  def update
    authenticate_user!
    @post = Post.find(params[:id]) 
    @post.update_attributes(params[:post]) ? respond_with(@post) : render(:edit)
  end

  def destroy
    authenticate_user!
    Post.find(params[:id]).destroy
    redirect_to root_path
  end

end