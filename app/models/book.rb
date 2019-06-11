class Book < ApplicationRecord
  belongs_to :publisher
  belongs_to :category
  has_many :request_details
  has_many :relationships, as: :followed
  has_many :followers, through: :relationship, source: :follower
  has_many :favorites
  has_many :comments
  has_many :author_books
  has_many :authors, through: :author_books

  scope :newest, ->{order :created_at}
  accepts_nested_attributes_for :author_books
end
