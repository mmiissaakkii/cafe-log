class Public::ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    if @review.save
      redirect_to public_review_path(@review), notice: "レビューを作成しました！"
    end
  end


end