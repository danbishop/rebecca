#!/usr/bin/ruby
# frozen_string_literal: true

SONGS = '/home/dan/ktest/'

songs = Dir.glob("#{SONGS}*.mp3")

song_db = []

songs.each do |song|
  song = File.basename song
  artist_title = song.split(' - ', 2)
  title = artist_title[1]
  # Ignore part of filename inside []
  title = title.gsub(/ \[.*?\].mp3/, '')
  title = title.gsub('.mp3', '')
  p "Artist: #{artist_title[0]} Title: #{title}"
  song_db.push({ artist: artist_title[0], title: title, path: song })
end

p song_db.count
