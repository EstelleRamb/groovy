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

print "creating users..."
users = %w[yuhecny edgar concorde estelle]
users.each do |user|
  User.create!(
    email: "#{user}@gmail.com",
    password: "123456"
  )
end

discogs = Discogs::Wrapper.new("Groovy", user_token: ENV["DISCOGS_TOKEN"])

genres = ['rock', 'classical', 'jazz', 'pop', 'metal']
genres.map! do |genre|
  Genre.create!(name: genre)
end

artists = ["Mariah Carey", "Frank Sinatra", "Taylor Swift"]

artists.each do |artist|
  artist_id = discogs.search(artist, per_page: 1, type: :artist).results.first.id
  artist_data = discogs.get_artist(artist_id)
  artist = Artist.create!(
    name: artist_data.name,
    description: artist_data.profile
  )

  artist_releases = discogs.get_artist_releases(artist_id, per_page: 5).releases
  artist_releases.each do |artist_release|
    Vinyl.create!(
      title: artist_release.title,
      year: artist_release.year,
      photo_url: artist_release.thumb,
      artist: artist,
      genre: genres.sample
    )
  end
end


# user = User.create!(email: "concorde@gmail.com", password: "123456")
# artist = Artist.create!(name: "Wonder Woman 1984", description: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s")
# Collection.create!(name: "The Shawshank Redemption", user: user)
# genre = Genre.create!(name: "Titanic")
# Vinyl.create!(title: "Ocean's Eight", photo_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", year: 2001, artist:artist, genre:genre)
