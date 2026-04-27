require 'date'

class Movie < Item
  attr_accessor :title, :director, :silent,
                :genre_id, :author_id, :source_id, :label_id

  def initialize(*args, archived: false)
    @id = args[0]
    @title = args[1]

    # Supports both spec constructor styles:
    # Movie.new(1, 'Metropolis', '2010-01-01', true, ...)
    # Movie.new(7, 'Nosferatu', '2000-01-01', true, archived: true)

    @publish_date = args[2]
    @silent = args[3] || false

    super(@publish_date, @id, archived:)

    @director = nil
    @genre_id = args[4]
    @author_id = args[5]
    @source_id = args[6]
    @label_id = args[7]
  end

  def can_be_archived?
    super || @silent
  end

  def self.from_h(hash)
    movie = new(
      hash['id'],
      hash['title'],
      hash['publish_date'],
      hash['silent'],
      hash['genre_id'],
      hash['author_id'],
      hash['source_id'],
      hash['label_id'],
      archived: hash['archived']
    )

    movie.director = hash['director']
    movie
  end
end
