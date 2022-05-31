class Group < ApplicationRecord
  has_many :bills, foreign_key: 'group_id'

  belongs_to :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true, length: { maximum: 50 }
end
