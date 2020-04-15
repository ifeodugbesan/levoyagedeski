class Resource < ApplicationRecord
  has_one_attached :photo
  validates :category, presence: true
end
