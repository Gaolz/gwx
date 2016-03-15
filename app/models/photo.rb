class Photo < ActiveRecord::Base
  belongs_to :post
  validates :image, presence: true
  mount_uploader :image, PhotoUploader
end
