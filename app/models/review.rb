class Review < ApplicationRecord
  belongs_to :custmer
  has_one_attached :image
  has_many :review_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(customer)
    favorites.exists?(custmer_id: custmer.id)
  end
end
