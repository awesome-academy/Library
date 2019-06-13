class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User.name
  belongs_to :followed, polymorphic: true

  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
