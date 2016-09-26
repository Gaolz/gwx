# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# photos
class PhotosController < ApplicationController
  protect_from_forgery with: :null_session, only: proc { request.format.json? }
  def upload
    @photo = Photo.new
    @photo.image = params[:upload_file]
    if @photo.save
      render json: { success: true, msg:  'upload successful', file_path: @photo.image.url }
    else
      render json: { success: false }
    end
  end
end
