require 'csv'
require_relative 'album'
require 'pry'

albums = []

CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  track = row.to_hash
  album = albums.find { |a| a.id == track[:album_id] }

  # if the album hasn't been added to the albums array yet, add it
  if album.nil?
    album = Album.new(track[:album_id], track[:album_name], track[:artists], track[:duration_ms])
    albums << album
  end

  album.duration << track[:duration_ms]
  album.tracks << track[:title]
end

albums.each do |album|
  puts album.summary
end
