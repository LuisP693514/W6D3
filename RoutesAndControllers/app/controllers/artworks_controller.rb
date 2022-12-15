class ArtworksController < ApplicationController
    def index 
        # render plain: "I'm in the index action!"
        @artwork = Artwork.all 
        render json: @artwork
    end

    def create
        @artwork = Artwork.new(artwork_param)
        # artwork.save!
        # render json: artwork

        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @artwork = Artwork.find(params[:id])

        render json: @artwork
    end

    def update 
        @artwork = Artwork.find(params[:id])

        if @artwork.update(artwork_param)
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy 
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        @artworks = Artwork.all
        render json: @artworks
    end
    
    private

    def artwork_param
        params.require(:artworks).permit(:title, :image_url, :artist_id)
    end
end