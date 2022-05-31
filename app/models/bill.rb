class Bill < ApplicationRecord
  # belongs_to :group
  belongs_to :author, class_name: 'user'

  # has_many :groups, foreign_key: 'bill_id'

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
