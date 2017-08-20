require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'albums.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  #puts row.to_hash
  a = Album.new
  a.name = row['name']
  a.artist_id = row['artist']
  a.genre = row['genre']
  a.year = row['year']
  a.save
  puts "#{a.name}, #{a.genre}, #{a.year} saved"
end

puts "There are now #{Album.count} rows in the transactions table
end