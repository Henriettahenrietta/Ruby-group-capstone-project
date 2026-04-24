# frozen_string_literal: true

require 'date'
require_relative 'item'

class Movie < Item
  attr_accessor :id, :title, :director, :genre_id, :silent, :source_id, :label_id

  def initialize(id, title, director, genre_id, publish_date, silent = false, source_id = nil, label_id = nil,
                 archived = false)
    super(id, publish_date, archived)
    @title = title
    @director = director
    @genre_id = genre_id
    @silent = silent
    @source_id = source_id
    @label_id = label_id
  end

  def can_be_archived?
    publish_date_obj = Date.parse(@publish_date)
    years_since_publish = (Date.today - publish_date_obj).to_f / 365.25

    years_since_publish >= 10 && @silent
  end

  def display
    status = @archived ? '[ARCHIVED]' : '[ACTIVE]'
    silent_text = @silent ? 'Silent' : 'Sound'
    "#{status} ID: #{@id} | #{@title} | #{silent_text}"
  end

  def to_h
    super.merge({
                  title: @title,
                  director: @director,
                  silent: @silent,
                  genre_id: @genre_id,
                  source_id: @source_id,
                  label_id: @label_id
                })
  end

  def self.from_h(data)
    new(
      data['id'],
      data['title'],
      data['director'],
      data['genre_id'],
      data['publish_date'],
      data['silent'],
      data['source_id'],
      data['label_id'],
      data['archived'] || false
    )
  end
end
