class Comment < ApplicationRecord
  belongs_to :review ,dependent: :destroy
  belongs_to :customer ,dependent: :destroy
end
