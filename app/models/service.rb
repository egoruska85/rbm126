class Service < ApplicationRecord
  has_many :subservices
  has_one_attached :image

  def name_title
    title.capitalize
  end
end
