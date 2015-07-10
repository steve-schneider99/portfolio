class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:notice] = "Blog has been saved."
      redirect_to "/"
    else
      flash[:alert] = "Error creating blog - try again."
      render :new
    end
  end

  def show

  end

private

  def blog_params
    params.require(:blog).permit(:post, :category)
  end
end
