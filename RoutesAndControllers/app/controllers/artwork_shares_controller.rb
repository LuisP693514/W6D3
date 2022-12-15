class ArtworkSharesController < ApplicationController
    def index
        # params[:user_id] => "1"
        if params.has_key?(:user_id)
            @artwork_shares = ArtworkShare.find_by(viewer_id: params[:user_id])
        else
            @artwork_shares = ArtworkShare.all
        end

        render json: @artwork_shares 
    end

    def create
        @artwork_shares = ArtworkShare.new(artwork_shares_param)

        if @artwork_shares.save
            render json: @artwork_shares
        else
            render json: @artwork_shares.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @artwork_share = ArtworkShare.find(params[:id])
        @artwork_share.destroy
        @artwork_shares = ArtworkShare.all
        render json: @artwork_shares
    end

    private

    def artwork_shares_param
        params.require(:artwork_shares).permit(:viewer_id, :artwork_id)
    end
end
