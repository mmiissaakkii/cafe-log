class Public::SearchesController < ApplicationController
   before_action :authenticate_user!

  def search
    @range = params[:range]
    @reviews = Review.looks(params[:search], params[:word])
  end
end
