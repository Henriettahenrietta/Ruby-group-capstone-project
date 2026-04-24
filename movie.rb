# frozen_string_literal: true

require_relative 'item'

class Movie < Item
  attr_accessor :title, :director, :genre_id, :silent

  def initialize(id, title, director, genre_id, publish_date, silent = false, archived = false)
    super(id, publish_date, archived)
    @title = title
    @director = director
    @genre_id = genre_id
    @silent = silent
  end

  def can_be_archived?
    super && @silent
  end

  def display
    status = @archived ? '[ARCHIVED]' : '[ACTIVE]'
    "#{status} ID: #{@id} | #{@title} directed by #{@director} | Genre ID: #{@genre_id} | Silent: #{@silent}"
  end

  def to_h
    super.merge({
                  title: @title,
                  director: @director,
                  genre_id: @genre_id,
                  silent: @silent
                })
  end

  def self.from_h(data)
    new(
      data['id'],
      data['title'],
      data['director'],
      data['genre_id'],
      data['publish_date'],
      data['silent'] || false,
      data['archived'] || false
    )
  end
end
