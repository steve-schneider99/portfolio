class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
    if current_user == nil || current_user.email != "steve.schneider99@gmail.com"
      flash[:alert] = "Not authorized! Please sign in!"
      redirect_to skills_path
    end
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
    @blog = Blog.find(params[:id])
    @comments = @blog.comments
    @comment = Comment.new
  end

  def edit
    @blog = blog.find(params[:id])
    if current_user == nil || current_user.email != "steve.schneider99@gmail.com"
      flash[:alert] = "Not authorized! Please sign in!"
      redirect_to skills_path
    end
  end

private

  def blog_params
    params.require(:blog).permit(:post, :category, :timestamp)
  end
end
