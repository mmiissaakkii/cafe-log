class Review < ApplicationRecord
  belongs_to :customer
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  has_many :review_tags,dependent: :destroy
  has_many :tags,through: :review_tags

  #検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @review = Review.where("store_name LIKE?","#{word}")
    elsif search == "forward_match"
      @review = Review.where("store_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @review = Review.where("store_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @review = Review.where("store_name LIKE?","%#{word}%")
    else
      @review = Review.all
    end
  end

#いいね機能
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
