class Bill < ApplicationRecord
  belongs_to :user

  has_many :group_bills, dependent: :destroy
  has_many :groups, through: :group_bills

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :category, presence: true
end
