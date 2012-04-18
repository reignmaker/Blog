class BlogsController < ApplicationController

  respond_to :html

  def index
    @blogs = Blog.joins(:posts)
  end

  def show
    @blogs = Blog.all
    @blog = Blog.find(params[:id])
    @posts = @blog.posts
  end

  def new
    authenticate_user!
    @blogs = Blog.all
    @blog = Blog.new  
  end

  def edit
    authenticate_user!
    @blogs = Blog.all
    @blog = Blog.find(params[:id])
  end

  def create
    authenticate_user!
    @blog = Blog.new(params[:post])
    @bog.save ? respond_with(@blog) : render(:new)
  end

  def update
    authenticate_user!
    @blog = Blog.find(params[:id])
    @blog.update_attributes(params[:blog]) ? respond_with(@blog) : render(:edit)
  end

  def destroy
    authenticate_user!
    Blog.find(params[:id]).destroy
    redirect blogs_path
  end

end