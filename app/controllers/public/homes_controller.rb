class Public::HomesController < ApplicationController
  def top
    @tags = Tag.all
    @reviews = Review.find(Favorite.group(:review_id).order('count(review_id) desc').limit(3).pluck(:review_id))
  end
end
