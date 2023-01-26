class Admin::CommentsController < ApplicationController
  def destroy
    @review = Review.find(params[:review_id])
    Comment.find_by(review_id: params[:review_id],id: params[:id]).destroy
    redirect_to admin_review_path(@review)
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
