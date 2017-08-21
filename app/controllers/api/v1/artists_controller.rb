module Api
  module V1
    class ArtistsController < ApplicationController

      def index
        render json: Artist.all
      end

      def show
        if artist = Artist.find_by(id: params[:id])
          render :json => artist
        else
          head :not_found
        end
      end

    end
  end
end
