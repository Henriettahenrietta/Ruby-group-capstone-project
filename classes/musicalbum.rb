require 'date'
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :id, :on_spotify, :genre_id, :author_id, :source_id
  attr_reader :title

  def initialize(id, title, publish_date, on_spotify, genre_id = nil, author_id = nil, source_id = nil, archived = false)
    super(id, publish_date, archived)
    @title = title
    @on_spotify = on_spotify
    @genre_id = genre_id
    @author_id = author_id
    @source_id = source_id
  end

  def can_be_archived?
    super && @on_spotify
  end

  def display
    status = @archived ? "[ARCHIVED]" : "[ACTIVE]"
    spotify = @on_spotify ? "Spotify" : "Not on Spotify"
    "#{status} ID: #{@id} | #{@title} | #{spotify}"
  end

  def to_h
    super.merge({
      title: @title,
      on_spotify: @on_spotify,
      genre_id: @genre_id,
      author_id: @author_id,
      source_id: @source_id
    })
  end

  def self.from_h(data)
    new(
      data['id'],
      data['title'],
      data['publish_date'],
      data['on_spotify'],
      data['genre_id'],
      data['author_id'],
      data['source_id'],
      data['archived'] || false
    )
  end
end