class Book < ApplicationRecord
  belongs_to :publisher
  belongs_to :category
  has_many :request_details
  has_many :passive_relationships, as: :followable
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :favorites
  has_many :comments, as: :commentable
  has_many :author_books
  has_many :authors, through: :author_books

  delegate :name, to: :category, prefix: :category
  scope :newest, ->{order :created_at}
  accepts_nested_attributes_for :author_books
end
