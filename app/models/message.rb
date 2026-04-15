class Message < ApplicationRecord
  broadcasts_to ->(message) { "messages" }
  validates :body, presence: true, length: {minimum: 1}

  belongs_to :user
  belongs_to :order
end
