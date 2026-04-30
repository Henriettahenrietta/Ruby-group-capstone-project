# frozen_string_literal: true

require './classes/movie'
require './options/add_props'

module AddMovie
  include AddProps

  def add_movie
    print 'Title: '
    title = gets.chomp

    print 'Director: '
    director = gets.chomp

    print 'Publish date (yyyy-mm-dd): '
    publish_date = gets.chomp

    print 'Silent? [Y/N]: '
    silent = gets.chomp.downcase == 'y'

    movie = Movie.new(nil, title, director, publish_date, silent:)
    @movies << movie

    choose_label(movie)
    choose_genre(movie)
    choose_author(movie)

    puts 'Movie created successfully'
  end
end
