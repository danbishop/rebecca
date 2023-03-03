#!/usr/bin/ruby
# frozen_string_literal: true

require 'vlc-client'

vlc = VLC::Client.new('127.0.0.1', 9999)

vlc.connect

vlc.play('/home/dan/Karaoke/Abba - Mama Mia [Karaoke].mp3')
