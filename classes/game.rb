require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :id, :title, :multiplayer, :last_played_at, :genre_id, :author_id, :source_id, :label_id

  def initialize(id, title, publish_date, multiplayer, last_played_at, genre_id = nil, author_id = nil, source_id = nil, label_id = nil, archived = false)
    super(id, publish_date, archived)
    @title = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @genre_id = genre_id
    @author_id = author_id
    @source_id = source_id
    @label_id = label_id
  end

  def can_be_archived?
    return false if @last_played_at.nil? || @last_played_at.empty?
    
    last_played = Date.parse(@last_played_at)
    years_since_played = (Date.today - last_played).to_i / 365
    
    super && years_since_played >= 2
  end

  def display
    status = @archived ? "[ARCHIVED]" : "[ACTIVE]"
    mode = @multiplayer ? "Multiplayer" : "Single Player"
    "#{status} ID: #{@id} | #{@title} | #{mode}"
  end

  def to_h
    super.merge({
      title: @title,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      genre_id: @genre_id,
      author_id: @author_id,
      source_id: @source_id,
      label_id: @label_id
    })
  end

  def self.from_h(data)
    new(
      data['id'],
      data['title'],
      data['publish_date'],
      data['multiplayer'],
      data['last_played_at'],
      data['genre_id'],
      data['author_id'],
      data['source_id'],
      data['label_id'],
      data['archived'] || false
    )
  end
end
