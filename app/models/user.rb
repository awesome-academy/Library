class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name:  Relationship.name,
                                  foreign_key: :follower_id,
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  Relationship.name,
                                   foreign_key: :followable_id,
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followable
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following_books, through: :active_relationships,
   source: :followable, source_type: "Book"
  has_many :following_authors, through: :active_relationships,
    source: :followable, source_type: "Author"
  has_many :favorites, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :requests, dependent: :destroy

  enum role: {user: 0, admin: 1}, _suffix: true
  enum gender: {male: 0, female: 1}
end
