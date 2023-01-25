class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:show, :guest_sign_in]
  before_action :set_customer, only: [:edit, :update, :show, :destroy]


  def edit
  end

  def update
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def favorite
    review_ids = current_customer.favorites.map {|f| f.review_id }
    @reviews = Review.where(id: review_ids)

  end


  def show
    @reviews = @customer.reviews
  end

  def destroy
      @customer.destroy
      flash[:notice] = "ユーザーを削除しました。"
      redirect_to :root
  end

  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def customer_params
    params.require(:customer).permit(:profile_image, :name)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

end
