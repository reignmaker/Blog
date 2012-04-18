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
    @blogs = Blog.all
    @blog = Blog.new  
  end

  def edit
    @blogs = Blog.all
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(params[:post])
    @bog.save ? respond_with(@blog) : render(:new)
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update_attributes(params[:blog]) ? respond_with(@blog) : render(:edit)
  end

  def destroy
    Blog.find(params[:id]).destroy
    redirect blogs_path
  end

end