# frozen_string_literal: true

require './options/add_props'
require './classes/musicalbum'

module AddMusicAlbum
  include AddProps

  def add_music_album
    puts 'Enter publish date (yyyy-mm-dd):'

    loop do
      @publish_date = gets.chomp
      break if @publish_date =~ /^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/

      puts "Provide the date in format 'yyyy-mm-dd'"
    end

    puts 'Enter artist name:'
    @artist = gets.chomp

    @on_spotify = read_spotify_input
    album = MusicAlbum.new(@artist, @publish_date, @on_spotify)
    @music_albums << album

    choose_label(album)
    choose_genre(album)
    choose_author(album)

    puts "Album added successfully!\n"
  end
<<<<<<< HEAD
=======

  def read_spotify_input
    puts 'Available on Spotify? (Y/y/N/n):'

    loop do
      on_spotify = gets.chomp
      return on_spotify.downcase == 'y' if on_spotify =~ /^[YyNn]/

      puts 'Provide valid input (Y/y/N/n)'
    end
  end
>>>>>>> 66b720bbb0994a35d4bce1cbed70b0b079c6e9fc
end
