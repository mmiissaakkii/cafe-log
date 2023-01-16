class Public::CustomersController < ApplicationController


  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def favorite
    @favorites = Favorite.where(customer_id: @customer.id).pluck(:review_id)
    @favorite_reviews = Review.find(favorites)
  end


  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews
  end

  private

  def customer_params
    params.require(:customer).permit(:profile_image, :name)
  end

end
