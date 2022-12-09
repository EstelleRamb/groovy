# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "destroy offered_vinyl..."
OfferedVinyl.destroy_all
puts "done"
puts "destroy exchanges..."
Exchange.destroy_all
puts "done"
puts "destroy collectionvinyl..."
CollectionVinyl.destroy_all
puts "done"
puts "destroy collection..."
Collection.destroy_all
puts "done"
puts "destroy vinyl..."
Vinyl.destroy_all
puts "done"
puts "destroy Message..."
Message.destroy_all
puts "done"
puts "destroy user..."
User.destroy_all
puts "done"
puts "destroy artist..."
Artist.destroy_all
puts "done"
puts "destroy genre..."
Genre.destroy_all
puts "all done"

print "creating users..."
users = %w[yuhecny edgar concorde estelle michelle]
users.each do |user|
  User.create!(
    email: "#{user}@gmail.com",
    first_name: "Michelle",
    password: "123456",
    address: "5333 casgrain"
  )
end

discogs = Discogs::Wrapper.new("Groovy", user_token: ENV["DISCOGS_TOKEN"])

genres = ['rock', 'classical', 'jazz', 'pop', 'metal']
genres.map! do |genre|
  Genre.create!(name: genre)
end

artists = ["Mariah Carey", "Snoop Dog", "Grand Invincible", "Ouska", "Doja Cat", "Xzibit", "Michael Jackson", "Prince", "Indochine", "Claude François", "Johnny Halliday", "Queen", "Pink Floyd", "AC/DC"]

artists.each do |artist|
  artist_results = artist_id = discogs.search(artist, per_page: 1, type: :artist).results
  if artist_results.nil?
    puts "API returned nil for search(#{artist_id})"
  elsif artist_results.empty?
    puts "No artist found for #{artist}"
  else
    artist_id = artist_results.first.id
    puts "artist_if for #{artist} is #{artist_id}"
    artist_data = discogs.get_artist(artist_id)
    artist = Artist.create!(
      name: artist_data.name,
      description: artist_data.profile
    )

    artist_releases = discogs.get_artist_releases(artist_id, per_page: 5).releases
    if artist_releases.nil?
      puts "API returned nil for get_artist_releases(#{artist_id})"
    else
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
  end
end

# user = User.create!(email: "concorde@gmail.com", password: "123456")
# artist = Artist.create!(name: "Wonder Woman 1984", description: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s")
# genre = Genre.create!(name: "Titanic")
# my_vinyl = Vinyl.create!(title: "Ocean's Eight", photo_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", year: 2001, artist:artist, genre:genre)

my_collection = Collection.create!(name: "The Shawshank Redemption", user: User.find_by(email: "michelle@gmail.com"))
CollectionVinyl.create!(vinyl: Vinyl.find_by(title: "Special Sampler"), collection: my_collection, offer_for_trade: true)
CollectionVinyl.create!(vinyl: Vinyl.find_by(title: "Narm/90"), collection: my_collection, offer_for_trade: true )
CollectionVinyl.create!(vinyl: Vinyl.find_by(title: "I Don't Wanna Cry"), collection: my_collection, offer_for_trade: true)

# my_collection1 = Collection.create!(name: "Christophe Bartell", user: User.find_by(email: "edgar@gmail.com"))
# CollectionVinyl.create!(vinyl: Vinyl.find_by(title: "Step By Step / Vision Of Love"), collection: my_collection1, offer_for_trade: true)
