class Group < ApplicationRecord
  belongs_to :user
  belongs_to :bill, optional: true

  has_many :group_bills, dependent: :delete_all
  has_many :bills, through: :group_bills
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 50 }
  validates :image, presence: true, length: { maximum: 50 }
  validate :image_type

  def image_type
    return unless !image.attached? && image.content_type.in?(%w[image/jpeg image/png image/jpg])

    errors.add(:image, 'must be a JPG, JPEG or PNG')
  end

  def total_amount
    bills.sum(:amount)
  end

  def recent_transactions
    bills.order(created_at: :desc)
  end
end
