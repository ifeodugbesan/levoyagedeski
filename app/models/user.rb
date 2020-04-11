class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :username, uniqueness: true
  has_many :posts
  has_many :comments
  has_many :likes
  has_one_attached :avatar
  belongs_to :batch

  def full_name
    first_name + " " + last_name
  end
end
