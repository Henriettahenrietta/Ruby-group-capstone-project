require 'date'
require_relative 'item'

class Movie < Item
  attr_accessor :silent
  attr_reader :id, :title, :genre_id, :author_id, :source_id, :label_id

  def initialize(id:, title:, publish_date:, silent:, **options)
    super(publish_date, archived: options[:archived] || false)

    @id = id
    @title = title
    @silent = silent
    @genre_id = options[:genre_id]
    @author_id = options[:author_id]
    @source_id = options[:source_id]
    @label_id = options[:label_id]
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
    {
      id: @id,
      title: @title,
      publish_date: @publish_date,
      silent: @silent,
      genre_id: @genre_id,
      author_id: @author_id,
      source_id: @source_id,
      label_id: @label_id,
      archived: @archived
    }
  end

  def self.from_h(data)
    new(
      id: data['id'],
      title: data['title'],
      publish_date: data['publish_date'],
      silent: data['silent'],
      genre_id: data['genre_id'],
      author_id: data['author_id'],
      source_id: data['source_id'],
      label_id: data['label_id'],
      archived: data['archived'] || false
    )
  end
end
