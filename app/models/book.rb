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
  delegate :name, to: :publisher, prefix: :publisher

  scope :newest, ->{order :created_at}
  scope :name_like, ->(name){where "name LIKE ?", "%#{name}%" if name.present?}
  accepts_nested_attributes_for :author_books

  def writers
    authors.map(&:name).join(", ")
  end
end
