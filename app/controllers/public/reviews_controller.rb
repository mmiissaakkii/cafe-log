class Public::ReviewsController < ApplicationController

  def index
    @reviews = Review.page(params[:page]).reverse_order
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
    if @review.customer != current_customer
      redirect_to :show
    end
  end

#レビュー変更後アップデート
  def update
    @review = Review.find(params[:id])
    if @review.update(review.params)
      redirect_to :show, notice: "レビューを編集しました"
    else
      render :edit
    end
  end

  def new
    @review = Review.new
  end

#レビューの保存
  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    if @review.save
      redirect_to public_review_path(@review), notice: "レビューを作成しました！"
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path, notice: "レビューを削除しました"
  end

#レビューのストロングパラメータ
  private

  def review_params
    params.require(:review).permit(:body, :store_name, :image, :proce, :address)
  end

end