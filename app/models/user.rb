class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups
  has_many :bills

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { minimum: 6, maximum: 50 }
  validates :password, presence: true, length: { minimum: 6, maximum: 20 },
                       format: {
                         with: /\A(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()])/,
                         message: 'must contain at least one letter, one number, and one special character'
                       }

  def is?(requested_role)
    role == requested_role.to_s
  end
end
