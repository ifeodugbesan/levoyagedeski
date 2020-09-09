class Tip < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  validates :content, presence: true
  validates :tip_type, presence: true
  has_many :upvotes, dependent: :destroy
  extend FriendlyId
  friendly_id :slug_title, use: :slugged

  include PgSearch
  pg_search_scope :search_by_title_and_content,
                  against: [:title],
                  associated_against: {
                    rich_text_content: [:body]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  def slug_title
    title.gsub(/\s/, '-')
  end

  def should_generate_new_friendly_id?
    true
  end
end
