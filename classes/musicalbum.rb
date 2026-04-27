# classes/musicalbum.rb
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :title, :artist, :genre_id, :on_spotify

  def initialize(publish_date, on_spotify = false, id = rand(1..1000), archived: false)
    super(publish_date, id, archived:)

    @on_spotify = on_spotify
    @genre_id = nil
    @artist = nil
    @title = nil
  end

  def can_be_archived?
    super && on_spotify
  end
end
