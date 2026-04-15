class Order < ApplicationRecord
  belongs_to :service
  has_many_attached :images
  has_many :messages, dependent: :destroy

  validates :name, presence: true, length: {minimum: 2}
  validates :phone, :presence => {:message => 'hello world, bad operation!'},
                    :numericality => true,
                    :length => { :minimum => 12, :maximum => 12 }
end
