class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :username, uniqueness: true
  belongs_to :batch
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :project_members, dependent: :destroy
  has_many :careers, through: :project_members
  has_many :messages, dependent: :destroy
  has_many :conversations, through: :messages
  has_one_attached :avatar

  def full_name
    first_name + " " + last_name
  end

  def avatar_key
    avatar.attached? ? avatar.key : 'default-user_rt3abl'
  end

  def chats
    (Conversation.where(sender: self) + Conversation.where(recipient: self)).sort_by(&:updated_at)
  end
end
