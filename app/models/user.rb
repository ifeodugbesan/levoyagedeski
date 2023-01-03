class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :conversations, through: :messages, dependent: :destroy
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

  def full_name
    "#{first_name} #{last_name}"
  end

  def avatar_key
    avatar.attached? ? avatar.key : 'default-user_rt3abl'
  end

  def chats
    (Conversation.where(sender: self) + Conversation.where(recipient: self)).sort_by(&:updated_at)
  end

  def new_messages
    chats.map { |c| c.messages.where.not(user: self).where.not(read: true) }.flatten.reject(&:blank?)
  end

  def should_generate_new_friendly_id?
    true
  end
end
