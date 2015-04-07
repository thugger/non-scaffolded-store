class Droid < ActiveRecord::Base
  validates :droid_name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  mount_uploader :image, ProductImageUploader
end
