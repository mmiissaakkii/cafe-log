class Review < ApplicationRecord
  belongs_to :customer
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  has_many :review_tags,dependent: :destroy
  has_many :tags,through: :review_tags
  has_many :comments, dependent: :destroy

  #検索機能
  def self.looks(search, word)
    @review = Review.where("store_name LIKE?","%#{word}%")
  end

#いいね機能
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

end
