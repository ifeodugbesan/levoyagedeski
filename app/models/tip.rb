class Tip < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  validates :content, presence: true
  validates :tip_type, presence: true
  has_many :upvotes, dependent: :destroy

  include PgSearch
  pg_search_scope :search_by_title_and_content,
                  against: [:title],
                  associated_against: {
                    rich_text_content: [:body]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
