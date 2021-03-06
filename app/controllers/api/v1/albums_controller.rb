# frozen_string_literal: true

module Api
  module V1
    class AlbumsController < ApplicationController
      append_view_path "#{Rails.root}/app/views/api/v1/albums" # you have to specify your views location as well
      def index
        @albums = Album.all.includes(:photos)
      end

      def create
        # we create an album using the name passed via the params(post request)
        @album = Album.create(album_params)
        if @album.save
          render json: @album
        else
          render json: { error: 'unable to create album. ' }, status: 400
        end
      end

      def show
        # we find the album using the album id passed via the params(get request)
        @album = Album.find(album_params)
        render json: @album
      end

      def update
        # we find the album using the album id passed via the params
        @album = Album.find(album_params)
        if @album
          # we update the name of the album to the name passed via the params (put request)
          @album.update(name: params[:name])
          render json: { message: 'album successfully updated. ' }, status: 200
        else
          render json: { error: 'unable to update album. ' }, status: 400
        end
      end

      def destroy
        # we find the album using the album id passed via the params
        @album = Album.find(album_params)
        if @album
          @album.destroy
          render json: { message: 'album successfully deleted. ' }, status: 200
        else
          render json: { error: 'unable to delete album. ' }, status: 400
        end
      end

      private

      def album_params
        params.permit(:id, :name)
      end
    end
  end
end

