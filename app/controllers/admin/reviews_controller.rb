class Admin::ReviewsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_review, only: [:show, :edit, :update, :destroy]
  def index
    @reviews =Review.page(params[:page])
    @tags = Tag.all
  end

  def show
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to admin_review_path(@review)
    else
      render "edit"
    end
  end

  def destroy
    @review.destroy
    redirect_to admin_reviews_path, notice: "レビューを削除しました"
  end

  def search_tag
    @review_tags = ReviewTag.where(tag_id: params[:id])
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:body, :store_name, :longitude, :latitude, :image, :price, :address, tag_ids: [])
  end


end
