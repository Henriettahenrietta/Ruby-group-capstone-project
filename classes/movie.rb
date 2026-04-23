require 'date'
require_relative 'item'

class Movie < Item
  attr_accessor :id, :title, :silent, :genre_id, :author_id, :source_id, :label_id

  def initialize(id, title, publish_date, silent, *args)
    options = args.last.is_a?(Hash) ? args.pop : {}

    archived = options[:archived] || args[4] || false

    super(publish_date, archived:)

    @id = id
    @title = title
    @silent = silent

    @genre_id = options[:genre_id] || args[0]
    @author_id = options[:author_id] || args[1]
    @source_id = options[:source_id] || args[2]
    @label_id = options[:label_id] || args[3]
  end

  def can_be_archived?
    super || @silent
  end

  def display
    status = @archived ? '[ARCHIVED]' : '[ACTIVE]'
    "#{status} ID: #{@id} | #{@title}"
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
      {
        genre_id: data['genre_id'] || data[:genre_id],
        author_id: data['author_id'] || data[:author_id],
        source_id: data['source_id'] || data[:source_id],
        label_id: data['label_id'] || data[:label_id],
        archived: data['archived'] || false
      }
    )
  end
end