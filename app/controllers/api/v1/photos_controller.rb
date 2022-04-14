# frozen_string_literal: true

module Api
  module V1
    class PhotosController < ApplicationController
      def create
        # we create a photo using the name and the album_id and a new given name that will be passed via the params(post request)
        @photo = Photo.create(photo_params)
        if @photo.save
          render json: @photo
        else
          render json: { error: 'unable to update Photo. ' }, status: 400
        end
      end

      def show
        # we find the photo using the photo id and album_id which will be passed via the params(get request)
        @photo = Photo.where(photo_params)
        render json: @photo
      end

      def update
        # we find the photo we want to update using the album_id and the id passed via the params
        @photo = Photo.where(photo_params)
        if @photo
          # we update the name of the photo to the name passed via the params (put request)
          @photo.update(name: params[:name])
          render json: { message: 'photo successfully updated. ' }, status: 200
        else
          render json: { error: 'unable to update Photo. ' }, status: 400
        end
      end

      def destroy
        # we find the photo using the photo id and album_id which will be passed via the params(delete request)
        @photo = Photo.where(photo_params)
        if @photo
          @photo.destroy
          render json: { message: 'photo successfully deleted. ' }, status: 200
        else
          render json: { error: 'unable to delete photo. ' }, status: 400
        end
      end

      private

      def photo_params
        params.require(:photo).permit(:name, :id, :album_id)
      end
    end
  end
end

