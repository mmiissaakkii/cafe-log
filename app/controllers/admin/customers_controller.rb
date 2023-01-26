class Admin::CustomersController < ApplicationController
     before_action :authenticate_admin!
     before_action :set_customer, only: [:edit, :update, :show]

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @reviews = @customer.reviews
  end

  def edit
  end

  def update
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

private

  def customer_params
    params.require(:customer).permit(:profile_image, :name)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

end
