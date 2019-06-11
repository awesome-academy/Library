class RequestDetail < ApplicationRecord
  belongs_to :book
  belongs_to :request

  enum status: {pending: 0, approved: 1, cancel: 2, reject: 3}
end
