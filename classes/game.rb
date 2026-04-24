# frozen_string_literal: true

require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :id, :title, :author_id, :genre_id, :multiplayer, :last_played_at, :source_id, :label_id

  def initialize(id, title, author_id, genre_id, publish_date, multiplayer = false, last_played_at = nil,
                 source_id = nil, label_id = nil, archived = false)
    super(id, publish_date, archived)
    @title = title
    @author_id = author_id
    @genre_id = genre_id
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @source_id = source_id
    @label_id = label_id
  end

  def can_be_archived?
    publish_date_obj = Date.parse(@publish_date)
    years_since_publish = (Date.today - publish_date_obj).to_f / 365.25

    years_since_publish >= 10 && !@multiplayer
  end

  def display
    status = @archived ? '[ARCHIVED]' : '[ACTIVE]'
    mode = @multiplayer ? 'Multiplayer' : 'Single Player'
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
      data['author_id'],
      data['genre_id'],
      data['publish_date'],
      data['multiplayer'],
      data['last_played_at'],
      data['source_id'],
      data['label_id'],
      data['archived'] || false
    )
  end
end
