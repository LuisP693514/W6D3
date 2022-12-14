# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(username: "bob1")
User.create(username: "bob2")
User.create(username: "bob3")
User.create(username: "bob4")

Artwork.create(title: "da vinci", image_url: "url.com")
Artwork.create(title: "vinci", image_url: "url4.com")
Artwork.create(title: "da vii", image_url: "url3.com")
Artwork.create(title: "dance", image_url: "ur2.com")

