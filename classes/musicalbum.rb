require 'date'
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :artist

  def initialize(artist, publish_date, on_spotify, archived: false)
    super(publish_date, archived: archived)
    @artist = artist
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def display
    status = archived ? '[ARCHIVED]' : '[ACTIVE]'
    spotify = @on_spotify ? 'Spotify' : 'No Spotify'
    "#{status} ID: #{id} | #{artist} | Album | #{spotify}"
  end
end
