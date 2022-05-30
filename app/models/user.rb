class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bills
  has_many :groups, through: :bills

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { minimum: 6, maximum: 50 }
end
