class Public::CustomersController < ApplicationController
  def edit
    @customer = Customer.find(params[:id])
    if @customer != current_customer
      redirect_to :show
    end
  end

  def show
    #@customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:image, :name, :introduction)
  end
end
