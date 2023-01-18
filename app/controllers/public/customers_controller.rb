class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:show]
  before_action :set_customer, only: [:edit, :update, :show]


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

  private

  def customer_params
    params.require(:customer).permit(:profile_image, :name)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

end
