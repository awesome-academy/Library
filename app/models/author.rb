class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books
  has_many :passive_relationships, as: :followable
  has_many :followers, through: :passive_relationships, source: :follower
  scope :newest, ->{order :created_at}
end
