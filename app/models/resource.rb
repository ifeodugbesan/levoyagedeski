class Resource < ApplicationRecord
  has_one_attached :photo
  validates :category, presence: true

  include PgSearch
  pg_search_scope :search_by_title_and_description,
                  against: [:title, :description, :category],
                  using: {
                    tsearch: { prefix: true }
                  }
end
