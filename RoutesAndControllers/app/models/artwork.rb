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
    validates :title, uniqueness {scope: :artist_id, message: "Can only have unique titles per artist."}


    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artworks,
        foreign_key: :artwork_id,
        class_name: :Artwork

    has_many :shared_viewers,
        through: :artworks,
        source: :viewer
end
