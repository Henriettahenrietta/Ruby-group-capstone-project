# classes/movie.rb
require_relative 'item'

class Movie < Item
  attr_accessor :title, :director, :silent,
                :genre_id, :author_id, :source_id, :label_id

  def initialize(*args, silent: false, archived: false, **kwargs)
    id = args[0]
    title = args[1]
    publish_date = args[2]
    silent = args[3] || silent
    genre_id = args[4]
    author_id = args[5]
    source_id = args[6]
    label_id = args[7]
    archived = args[8] || archived

    super(publish_date, id:, archived:)

    @title = title
    @silent = silent
    @genre_id = genre_id
    @author_id = author_id
    @source_id = source_id
    @label_id = label_id
    @director = kwargs[:director]
  end

  def can_be_archived?
    super || @silent
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
      archived: data['archived'],
      director: data['director']
    )
  end
end
