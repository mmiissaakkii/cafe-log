class Admin::ReviewsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_review, only: [:show, :edit, :update, :destoroy]
  def index
    @reviews =Review.all
    @tags = Tag.all
  end

  def show
  end

  def edit
    if @review.customer != current_customer
      redirect_to :review_path
    end
  end

  def update
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render "edit"
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path, notice: "レビューを削除しました"
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end


end
