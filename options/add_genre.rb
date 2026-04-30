# frozen_string_literal: true

require './classes/genre'

module AddGenre
  def add_genre
    print 'Genre name: '
    name = gets.chomp

    @genres << Genre.new(name)

    puts 'Genre created successfully'
  end
end