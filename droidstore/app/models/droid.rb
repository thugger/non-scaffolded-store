class Droid < ActiveRecord::Base
  validates :droid_name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  mount_uploader :image, ProductImageUploader
  belongs_to :droid_class
end
