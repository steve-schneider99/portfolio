class CommentsController < ApplicationController
  def new
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.new
    if current_user == nil
      flash[:alert] = "Please login to post a comment!"
      redirect_to blog_path(@blog)
    else
    end
  end

  def show
    @comment = Comment.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "comment has been posted."
      redirect_to blog_path(@blog)
    else
      flash[:alert] = "Error posting comment - try again."
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :user_email, :user_id, :blog_id, :timestamp)
    end

end
