class Article < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  validates :content, presence: true
  extend FriendlyId
  friendly_id :slug_name, use: :slugged

  def slug_name
    title.gsub(/\s/, '-')
  end

  def should_generate_new_friendly_id?
    true
  end
end
