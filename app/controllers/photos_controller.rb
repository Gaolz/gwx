class PhotosController < ApplicationController
  protect_from_forgery with: :null_session, only: proc { |c| c.request.format.json? }
  def upload
    @photo = Photo.new
    @photo.image = params[:upload_file]
    msg = '上传成功'
    if @photo.save
      render json: { success: true, msg: msg, file_path: @photo.image.url }
    else
      render json: { success: false }
    end
  end
end
