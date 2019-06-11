class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books
  has_many :relationships, as: :followed
  has_many :followers, through: :relationship, source: :follower
  scope :newest, ->{order :created_at}
end
