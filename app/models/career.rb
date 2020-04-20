class Career < ApplicationRecord
  belongs_to :user
  has_many :project_members, dependent: :destroy
  has_many :users, through: :project_members
  has_one_attached :image
end
