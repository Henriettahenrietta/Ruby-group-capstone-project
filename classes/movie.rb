require 'date'
require_relative 'item'

class Movie < Item
  attr_accessor :id, :title, :silent, :genre_id, :author_id, :source_id, :label_id

  def initialize(id, title, publish_date, silent, *args, archived: false)
    options = args.last.is_a?(Hash) ? args.last : {}

    final_archived = if options.key?(:archived)
                       options[:archived]
                     else
                       archived
                     end

    super(publish_date, archived: final_archived)

    @id = id
    @title = title
    @silent = silent

    @genre_id = args[0]
    @author_id = args[1]
    @source_id = args[2]
    @label_id = args[3]
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
      data['genre_id'],
      data['author_id'],
      data['source_id'],
      data['label_id'],
      archived: data['archived'] || false
    )
  end
end