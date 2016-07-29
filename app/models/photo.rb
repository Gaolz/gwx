# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ApplicationRecord
  validates :image, presence: true
  mount_uploader :image, PhotoUploader
end
