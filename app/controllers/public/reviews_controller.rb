class Public::ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destoroy]
  before_action :authenticate_customer!, except: [:index, :show, :search_tag]


  def index
    @reviews = Review.all
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

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    if @review.save!
      redirect_to review_path(@review), notice: "レビューを作成しました！"
    else
      render :new
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path, notice: "レビューを削除しました"
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