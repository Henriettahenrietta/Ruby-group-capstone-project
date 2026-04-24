# frozen_string_literal: true

require_relative 'item'

class MusicAlbum < Item
  attr_accessor :title, :artist, :genre_id, :on_spotify

  def initialize(id, title, artist, genre_id, publish_date, on_spotify = false, archived = false)
    super(id, publish_date, archived)
    @title = title
    @artist = artist
    @genre_id = genre_id
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def display
    status = @archived ? '[ARCHIVED]' : '[ACTIVE]'
    "#{status} ID: #{@id} | #{@title} by #{@artist} | Genre ID: #{@genre_id} | On Spotify: #{@on_spotify}"
  end

  def to_h
    super.merge({
                  title: @title,
                  artist: @artist,
                  genre_id: @genre_id,
                  on_spotify: @on_spotify
                })
  end

  def self.from_h(data)
    new(
      data['id'],
      data['title'],
      data['artist'],
      data['genre_id'],
      data['publish_date'],
      data['on_spotify'] || false,
      data['archived'] || false
    )
  end
end
