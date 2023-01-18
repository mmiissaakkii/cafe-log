class Public::SearchesController < ApplicationController

  def search
     @reviews = Review.looks(params[:search], params[:word])
  end
end