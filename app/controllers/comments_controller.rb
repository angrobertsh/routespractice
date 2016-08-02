class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if comment.destroy
      render json: comment
    else
      render text: "you can't delete this comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:person_id, :person_type, :body, :author_id)
  end

end
