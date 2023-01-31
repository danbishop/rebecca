# frozen_string_literal: true

SONGS = '/home/dan/Karaoke/'

songs = Dir.glob("#{SONGS}*.mp3")

songs.each do |song|
  song = File.basename song
  artist_title = song.split(' - ', 2)
  title = artist_title[1]
  title = title.gsub(' [Karaoke].mp3', '')
  title = title.gsub(' [karaoke].mp3', '')
  title = title.gsub('.mp3', '')
  p "Artist: #{artist_title[0]} Title: #{title}"
end

p "Total Songs: #{songs.count}"
