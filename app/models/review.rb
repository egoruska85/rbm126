class Review < ApplicationRecord
  validates :author, :message, :email, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Сортировка: новые отзывы всегда сверху
  default_scope { order(created_at: :desc) }
end
