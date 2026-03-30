class Picture < ApplicationRecord
  has_one_attached :parallax
  has_one_attached :heroimage
  has_one_attached :icon_telegram
  has_one_attached :icon_whatsapp
  has_one_attached :icon_max
  has_one_attached :icon_vk
  has_one_attached :icon_imo
end
