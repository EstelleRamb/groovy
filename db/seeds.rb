# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Collection.destroy_all
Vinyl.destroy_all
User.destroy_all
Artist.destroy_all
Genre.destroy_all
user = User.create!(email: "concorde@gmail.com", password: "123456")
artist = Artist.create!(name: "Wonder Woman 1984", description: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s")
Collection.create!(name: "The Shawshank Redemption", user: user)
genre = Genre.create!(name: "Titanic")
Vinyl.create!(title: "Ocean's Eight", photo_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", year: 2001, artist:artist, genre:genre)
