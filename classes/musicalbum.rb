require 'date'
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :id, :artist, :on_spotify, :genre_id, :source_id, :label_id
  attr_reader :title

  def initialize(id, title, artist, genre_id, publish_date, on_spotify = false, source_id = nil, label_id = nil, archived = false)
    super(id, publish_date, archived)
    @title = title
    @artist = artist
    @genre_id = genre_id
    @on_spotify = on_spotify
    @source_id = source_id
    @label_id = label_id
  end

  def can_be_archived?
    publish_date_obj = Date.parse(@publish_date)
    years_since_publish = (Date.today - publish_date_obj).to_f / 365.25

    years_since_publish >= 10 && @on_spotify
  end

  def display
    status = @archived ? "[ARCHIVED]" : "[ACTIVE]"
    spotify = @on_spotify ? "Spotify" : "Not on Spotify"
    "#{status} ID: #{@id} | #{@title} by #{@artist} | #{spotify}"
  end

  def to_h
    super.merge({
      title: @title,
      artist: @artist,
      on_spotify: @on_spotify,
      genre_id: @genre_id,
      source_id: @source_id,
      label_id: @label_id
    })
  end

  def self.from_h(data)
    new(
      data['id'],
      data['title'],
      data['artist'],
      data['genre_id'],
      data['publish_date'],
      data['on_spotify'],
      data['source_id'],
      data['label_id'],
      data['archived'] || false
    )
  end
end