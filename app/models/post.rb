class Post < ApplicationRecord
  has_many :like
  has_many :comment
  belongs_to :user
  validates :content, presence: true, length: {in: 1..140}
end
