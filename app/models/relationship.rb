class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User.name
  belongs_to :followable, polymorphic: true

  validates :follower_id, presence: true
end
