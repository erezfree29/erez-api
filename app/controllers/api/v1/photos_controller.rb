class Api::V1::PhotosController < ApplicationController
  def create
    # we create a photo using the name and the album_id and a new given name that will be passed via the params(post request)
    @photo = Photo.create(photo_params)
    if @photo.save
        render json: @photo 
    else
      render json: { error: 'unable to update Photo. '}, status: 400
    end        
  end

  def show
    # we find the photo using the photo id and album_id which will be passed via the params(get request)
    @photo = Photo.where(photo_params)
    render json: @photo
  end

  def update
    # we find the photo we want to update using the album_id and the id passed via the params
    @photo = Photo.where(album_id:params[:album_id],id:params[:id])
    if @photo
        # we update the name of the photo to the name passed via the params (put request)
        @photo.update(name:params[:name])
        render json: { message: 'photo successfully updated. '}, status: 200
    else
        render json: { error: 'unable to update Photo. '}, status: 400
    end    
  end

  def destroy
    # we find the photo using the photo id and album_id which will be passed via the params(delete request)
    @photo = Photo.where(photo_params)
    if @photo
        @photo.destroy
        render json: {message: 'photo successfully deleted. '}, status: 200
    else
        render json: { error: 'unable to delete photo. '}, status: 400  
    end    
  end    

  private

  def photo_params
    params.require(:photo).permit(:name, :id, :album_id)
  end 
end

# routes

# Prefix Verb   URI Pattern                                   Controller#Action
# api_v1_album_photos POST   /api/v1/albums/:album_id/photos(.:format)     api/v1/photos#create
#  api_v1_album_photo GET    /api/v1/albums/:album_id/photos/:id(.:format) api/v1/photos#show
#                     PATCH  /api/v1/albums/:album_id/photos/:id(.:format) api/v1/photos#update
#                     PUT    /api/v1/albums/:album_id/photos/:id(.:format) api/v1/photos#update
#                     DELETE /api/v1/albums/:album_id/photos/:id(.:format) api/v1/photos#destroy












