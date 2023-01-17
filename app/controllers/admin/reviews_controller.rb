class Admin::ReviewsController < ApplicationController
     before_action :authenticate_admin!
  def index
    @reviews =Review.all
    @tags = Tag.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
    if @review.customer != current_customer
      redirect_to :review_path
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path, notice: "レビューを削除しました"
  end

end
