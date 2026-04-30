# frozen_string_literal: true

module ListMovies
  def list_movies
    puts "\nMOVIES LIST:\n"
    return puts 'No movies found' if @movies.empty?

    @movies.each_with_index do |movie, index|
      puts movie_details(movie, index)
    end
  end

  private

  def movie_details(movie, index)
    "#{index + 1}) Title: #{movie.title}, " \
      "Director: #{movie.director}, " \
      "Publish Date: #{movie.publish_date}, " \
      "Silent: #{yes_no(movie.silent)}, " \
      "Genre: #{safe_name(movie.genre, :name)}, " \
      "Label: #{safe_name(movie.label, :title)}, " \
      "Author: #{author_name(movie.author)}"
  end

  def yes_no(value)
    value ? 'Yes' : 'No'
  end

  def safe_name(object, field)
    object&.send(field) || 'Unknown'
  end

  def author_name(author)
    return 'Unknown' unless author

    "#{author.first_name} #{author.last_name}"
  end
end
