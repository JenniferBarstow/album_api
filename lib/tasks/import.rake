require 'csv'

namespace :db do

  desc "Import Albums from csv"
  task load_albums: :environment do  

    csv_text = File.read('db/albums.csv', headers: true, encoding: 'iso-8859-1:utf-8')
    csv = CSV.parse(csv_text, :headers => true)
    length = csv.length
    csv.each_with_index do |row, i|
      puts "Processing row #{i} of #{length} for row: #{row.inspect}"
      artist = Artist.find_or_create_by(name: row['artist'])
      puts "Found or created artist #{artist.id} with name #{artist.name}"
      puts "Creating album with name #{row['name']}"
      album = Album.new(
        name: row['album'],
        artist: row['artist_id'],
        genre: row['genre'],
        year: row['year']
      )
      puts "Built album #{album.inspect}"
      artist.albums << album
      result = artist.save
      puts "Added album to artists's albums. Result was #{result}. Artist now has the following albums:"
      puts "#{artist.albums.inspect}"
    end
  end
end

