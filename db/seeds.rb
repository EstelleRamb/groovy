puts "destroy exchanges..."
Exchange.update_all(offered_vinyl_id: nil)
Exchange.destroy_all
puts "done"
puts "destroy offered_vinyl..."
OfferedVinyl.destroy_all
puts "done"
puts "destroy collectionvinyl..."
CollectionsVinyl.destroy_all
puts "done"
puts "destroy collection..."
Collection.destroy_all
puts "done"
puts "destroy users_vinyl..."
UsersVinyl.destroy_all
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

yaml_filepath = "#{File.dirname(__FILE__)}/seeds.yaml"
seeds = YAML.load_file(yaml_filepath)

# p seeds

vinyls = []

seeds[:artists].each do |artist_seed|
  artist = Artist.create!(
    name: artist_seed[:name],
    description: artist_seed[:description]
  )

  artist_seed[:vinyls].each do |vinyl_seed|
    vinyls << Vinyl.create!(
      title: vinyl_seed[:title],
      year: vinyl_seed[:year],
      photo_url: vinyl_seed[:photo_url],
      artist: artist
    )
  end
end

seeds[:users].each do |user_seed|
  first_name = user_seed[:first_name]
  user = User.create!(
    first_name: first_name,
    last_name: user_seed[:last_name],
    address: user_seed[:address],
    email: "#{first_name}@gmail.com",
    password: "123456",
  )

  collections = []
  unless user_seed[:collections].nil?
    user_seed[:collections].each do |collection|
      collections << Collection.create!(
        user: user,
        name: collection[:name]
      )
    end
  end

  unless user_seed[:vinyls_mappings].nil?
    user_seed[:vinyls_mappings].each do |vinyl_mapping|
      album = vinyls.find { |vinyl| vinyl.title == vinyl_mapping[:title] }
      user_vinyl = UsersVinyl.create!(
        vinyl: album,
        user: user,
        offer_for_trade: vinyl_mapping[:offer_for_trade]
      )

      if vinyl_mapping[:collection]
        collection = collections.find { |collection| collection.name == vinyl_mapping[:collection] }
        CollectionsVinyl.create!(
          collection: collection,
          users_vinyl: user_vinyl
        )
      end
    end
  end
end



# print "creating users..."

# User.create!(first_name: 'yuhecny', email: 'yuhecny@gmail.com', password: '123456', address: '4436 belanger, Montréal')
# User.create!(first_name: 'edgar', email: 'edgar@gmail.com', password: '123456', address: '5330 papineau, Montréal')
# User.create!(first_name: 'concorde', email: 'concorde@gmail.com', password: '123456', address: '2302 provencher, Montréal')
# User.create!(first_name: 'estelle', email: 'estelle@gmail.com', password: '123456', address: '3690 belair, Montréal')
# User.create!(first_name: 'michelle', email: 'michelle@gmail.com', password: '123456', address: '5378 boulevard saint laurent, Montréal')

# chatroom = Chatroom.create(name: "general")

# puts '--------------------------------'
# puts "Chatroom #{chatroom.name} created"
# puts '--------------------------------'

# discogs = Discogs::Wrapper.new("Groovy", user_token: ENV["DISCOGS_TOKEN"])

# genres = ['rock', 'classical', 'jazz', 'pop', 'metal']
# genres.map! do |genre|
#   Genre.create!(name: genre)
# end

# artists = ["Mariah Carey", "Snoop Dog", "Grand Invincible", "Ouska", "Doja Cat", "Xzibit", "Michael Jackson", "Prince", "Indochine", "Claude François", "Johnny Halliday", "Queen", "Pink Floyd", "AC/DC"]

# artists.each do |artist|
#   artist_results = artist_id = discogs.search(artist, per_page: 1, type: :artist).results
#   if artist_results.nil?
#     puts "API returned nil for search(#{artist_id})"
#   elsif artist_results.empty?
#     puts "No artist found for #{artist}"
#   else
#     artist_id = artist_results.first.id
#     puts "artist_id for #{artist} is #{artist_id}"
#     artist_data = discogs.get_artist(artist_id)
#     artist = Artist.create!(
#       name: artist_data.name,
#       description: artist_data.profile
#     )

#     artist_releases = discogs.get_artist_releases(artist_id, per_page: 5).releases
#     if artist_releases.nil?
#       puts "API returned nil for get_artist_releases(#{artist_id})"
#     else
#       artist_releases.each do |artist_release|
#         Vinyl.create!(
#           title: artist_release.title,
#           year: artist_release.year,
#           photo_url: artist_release.thumb,
#           artist: artist,
#           genre: genres.sample
#         )
#       end
#     end
#   end
# end

# # user = User.create!(email: "concorde@gmail.com", password: "123456")
# # artist = Artist.create!(name: "Wonder Woman 1984", description: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s")
# # genre = Genre.create!(name: "Titanic")
# # my_vinyl = Vinyl.create!(title: "Ocean's Eight", photo_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", year: 2001, artist:artist, genre:genre)

# michelle = User.find_by(email: "michelle@gmail.com")
# my_collection = Collection.create!(name: "The Shawshank Redemption", user: michelle)

# michelle_users_vinyls = [
#   UsersVinyl.create!(vinyl: Vinyl.find_by(title: "Special Sampler"), user: michelle, offer_for_trade: true),
#   UsersVinyl.create!(vinyl: Vinyl.find_by(title: "Narm/90"), user: michelle, offer_for_trade: true),
#   UsersVinyl.create!(vinyl: Vinyl.find_by(title: "I Don't Wanna Cry"), user: michelle, offer_for_trade: true)
# ]
# michelle_users_vinyls.each do |users_vinyl|
#   CollectionsVinyl.create!(collection: my_collection, users_vinyl: users_vinyl)
# end

# concorde = User.find_by(email: "concorde@gmail.com")
# my_collection1 = Collection.create!(name: "POP", user: concorde)

# concorde_users_vinyls = [
#   UsersVinyl.create!(vinyl: Vinyl.find_by(title: "Doggystyle"), user: concorde, offer_for_trade: true),
#   UsersVinyl.create!(vinyl: Vinyl.find_by(title: "Deep Cover"), user: concorde, offer_for_trade: true),
#   UsersVinyl.create!(vinyl: Vinyl.find_by(title: "At The Speed Of Life"), user: concorde, offer_for_trade: true)
# ]

# concorde_users_vinyls.each do |users_vinyl|
#   CollectionsVinyl.create!(collection: my_collection1, users_vinyl: users_vinyl)
# end
# # my_collection1 = Collection.create!(name: "Christophe Bartell", user: User.find_by(email: "edgar@gmail.com"))
# # CollectionVinyl.create!(vinyl: Vinyl.find_by(title: "Step By Step / Vision Of Love"), collection: my_collection1, offer_for_trade: true)
