class Tip < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  validates :content, presence: true
  validates :tip_type, presence: true
  has_many :upvotes
end
