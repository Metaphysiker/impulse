class CommentsController < ApplicationController

  def create_comment
    @comment = Comment.create(comment_params)
  end

  def create_comment_for_support_request
    @comment = Comment.create(comment_params)
  end

  def delete_comment

  end

  def comment_function
    @message = Message.find(params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end
end
