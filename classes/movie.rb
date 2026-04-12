require 'date'
require_relative 'item'

class Movie < Item
  attr_accessor :id, :title, :silent, :genre_id, :author_id, :source_id, :label_id

  def initialize(id, title, publish_date, silent, genre_id: nil, author_id: nil, source_id: nil, label_id: nil, archived: false)
    super(publish_date, archived: archived, id: id)
    @title = title
    @silent = silent
    @genre_id = genre_id
    @author_id = author_id
    @source_id = source_id
    @label_id = label_id
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
      data['id'],
      data['title'],
      data['publish_date'],
      data['silent'],
      genre_id: data['genre_id'],
      author_id: data['author_id'],
      source_id: data['source_id'],
      label_id: data['label_id'],
      archived: data['archived'] || false
    )
  end
end
