class Request < ApplicationRecord
  belongs_to :user
  has_many :request_details

  enum status: {pending: 0, approved: 1, cancel: 2, reject: 3}
end
