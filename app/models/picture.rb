class Picture < ApplicationRecord
  has_one_attached :parallax
  has_one_attached :heroimage
end
