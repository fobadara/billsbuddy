class Group < ApplicationRecord
  has_many :bills
  has_many :users, through: :bills

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true, length: { maximum: 50 }
end
