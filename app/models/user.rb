class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessor :remember_token

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
  has_secure_password

  enum role: {user: 0, admin: 1}, _suffix: true
  enum gender: {male: 0, female: 1}

  validates :name, presence: true,
    length: {maximum: Settings.maximum_name_length}
  validates :email, presence: true,
    length: {maximum: Settings.maximum_email_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.minimum_password_length}, allow_nil: true
  validates :address, presence: true,
    length: {maximum: Settings.maximum_address_length}

  before_save :downcase_email

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end
  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send("#{attribute}_digest")
    return false unless digest
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute :remember_digest, nil
  end

  private

  def downcase_email
    email.downcase!
  end
end
