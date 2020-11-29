class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :like
  has_many :post
  has_many :comment

  email_format = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, format: { with: email_format }
  validates :password, length: { in: 8..32 }
end
