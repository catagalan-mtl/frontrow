class Review < ApplicationRecord
  has_many_attached :photos

  belongs_to :attendance

  validates :rating, presence: true
  validates :content, presence: true
end
