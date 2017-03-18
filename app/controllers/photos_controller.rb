class PhotosController < ApplicationController

  def destroy
    @photo = Photo.find(params[:id])
    item = @photo.item
    @photo.destroy
    @photos = Photo.where(item_id: item.id)

    respond_to :js
  end

end
