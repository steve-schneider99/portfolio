class CommentsController < ApplicationController
  def new
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.new
  end

  def show
    @comment = Comment.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.new(comment_params)
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
      params.require(:comment).permit(:comment, :user_email, :user_id, :blog_id)
    end

end
