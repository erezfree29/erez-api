class Api::V1::AlbumsController < ApplicationController
    def index
        @albums = Album.all
        render json: @albums
    end
    
    def create
        # we create and album using the name passed via the params
        @album = Album.create(album_params)
        if @album.save
            render json: @album
        else
            render json: { error: 'unable to create album. '}, status: 400
        end    
    end

    def show
        @album = Album.find(params[:id])
        render json: @album
    end    
    
    def update
        @album = Album.find(params[:id])
        if  @album
            @album.update(album_params)
            render json: { message: 'album successfully updated. '}, status: 200
        else
            render json: { error: 'unable to update album. '}, status: 400
        end        
    end
    
    def destroy
        @album = Album.find(params[:id])
         if  @album
            @album.destroy
            render json: {message: 'album successfully deleted. '}, status: 200
         else
            render json: { error: 'unable to delete album. '}, status: 400  
         end   
    end
    
    private

    def album_params
        params.require(:album).permit(:name)
    end    
end
