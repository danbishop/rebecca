#!/usr/bin/ruby
# frozen_string_literal: true

require 'sinatra'
require 'vlc-client'

# Make available to all ips
set :bind, '0.0.0.0'

puts "Run vlc --extraintf rc --rc-host=127.0.0.1:9999"

VLC = VLC::Client.new('127.0.0.1', 9999)

VLC.connect

SONGS = '/home/dan/Karaoke/'

songs = Dir.glob("#{SONGS}*.mp3")

song_db = []

songs.each do |song|
  song = File.basename song
  artist_title = song.split(' - ', 2)
  title = artist_title[1]
  title = title.gsub(/ \[.*?\].mp3/, '')
  # title = title.gsub(' [Karaoke].mp3', '')
  # title = title.gsub(' [karaoke].mp3', '')
  title = title.gsub('.mp3', '')
  p "Artist: #{artist_title[0]} Title: #{title}"
  song_db.push({ artist: artist_title[0], title: title, path: song })
end

set :song_db, song_db

get '/' do
  @song_db = song_db
  erb :index
end

get '/play/:id' do
  id = params[:id].to_i
  puts id
  VLC.play("/home/dan/Karaoke/#{song_db[id][:path]}")
end
