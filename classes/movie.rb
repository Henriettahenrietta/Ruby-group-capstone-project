require 'date'
require_relative 'item'

class Movie < Item
  attr_accessor :id, :title, :silent, :genre_id, :author_id, :source_id, :label_id

  def initialize(id, title, publish_date, silent, *extra, archived: false)
    super(publish_date, archived:)

    @id = id
    @title = title
    @silent = silent

    @genre_id = extra[0]
    @author_id = extra[1]
    @source_id = extra[2]
    @label_id = extra[3]
  end

  def can_be_archived?
    super || @silent
  end

  def display
    status = @archived ? '[ARCHIVED]' : '[ACTIVE]'
    silent_text = @silent ? 'Silent' : 'Sound'
    "#{status} ID: #{@id} | #{@title} | #{silent_text}"
  end

  def to_h
    super.merge(
      id: @id,
      title: @title,
      silent: @silent,
      genre_id: @genre_id,
      author_id: @author_id,
      source_id: @source_id,
      label_id: @label_id
    )
  end

  def self.from_h(data)
    new(
      data['id'] || data[:id],
      data['title'] || data[:title],
      data['publish_date'] || data[:publish_date],
      data['silent'] || data[:silent],
      data['genre_id'] || data[:genre_id],
      data['author_id'] || data[:author_id],
      data['source_id'] || data[:source_id],
      data['label_id'] || data[:label_id],
      archived: data['archived'] || false
    )
  end
end
