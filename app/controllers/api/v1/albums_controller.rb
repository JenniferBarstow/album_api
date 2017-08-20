module Api
  module V1
    class AlbumsController < ApplicationController

      def index
        albums = Album.all
        render json: albums
      end

      def show
        if album = Album.find_by(id: params[:id])
          render json: album
        else
          head :not_found
        end
      end

      def create
        render json: Album.create(album_params)
      end

      def update
        if album = Album.find_by(id: params[:id])
          render json: album.update(album_params)
        else
          head :not_found
        end
      end

      def destroy
        if album = Album.find_by(id: params[:id])
          render json: album.destroy
        else
          head :not_found
        end
      end

      private

      def album_params
        params.require(:album).permit(:name, :genre, :year, :artist_id)
      end

    end
  end
end