require_relative 'item'

class Game < Item
  attr_accessor :title, :author_id, :genre_id, :multiplayer, :last_played_at

  def initialize(id, title, author_id, genre_id, publish_date, multiplayer = false, last_played_at = nil, archived = false)
    super(id, publish_date, archived)
    @title = title
    @author_id = author_id
    @genre_id = genre_id
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && !@multiplayer
  end

  def display
    status = @archived ? '[ARCHIVED]' : '[ACTIVE]'
    "#{status} ID: #{@id} | #{@title} | Author ID: #{@author_id} | Genre ID: #{@genre_id} | Multiplayer: #{@multiplayer}"
  end

  def to_h
    super.merge({
      title: @title,
      author_id: @author_id,
      genre_id: @genre_id,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at
    })
  end

  def self.from_h(data)
    new(
      data['id'],
      data['title'],
      data['author_id'],
      data['genre_id'],
      data['publish_date'],
      data['multiplayer'] || false,
      data['last_played_at'],
      data['archived'] || false
    )
  end
end