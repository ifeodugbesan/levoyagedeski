class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :first_name, presence: :true
  validates :last_name, presence: :true
  # validates :username, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar
  extend FriendlyId
  friendly_id :user_username, use: :slugged
  include PgSearch
  pg_search_scope :search_by_name,
                  against: [:first_name, :last_name, :username],
                  using: {
                    tsearch: { prefix: true }
                  }

  def user_username
    username.present? ? username : "#{first_name}-#{last_name}"
  end

  def initials
    "#{first_name.first.upcase}#{last_name.first.upcase}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def should_generate_new_friendly_id?
    true
  end
end
