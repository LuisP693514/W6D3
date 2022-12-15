# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :image_url, presence: true, uniqueness: true
    validates :artist_id, :title, presence:true
    validates :title, uniqueness: {scope: :artist_id, message: "Can only have unique titles per artist."}
    
    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artworks_shared,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :artworks,
        source: :viewer

    def self.artwork_for_user_id(user_id)
        Artwork.left_outer_joins(:artworks_shared)
        .where("(artworks.artist_id = #{user_id}) OR (artwork_shares.viewer_id = #{user_id})")
        .distinct
    end
end
