# frozen_string_literal: true

module ListMovies
  def list_movies
    puts "\nMOVIES LIST:\n"
    if @movies.empty?
      puts 'No movies found'
    else
      @movies.each_with_index do |movie, i|
        genre_name = movie.genre&.name || 'Unknown'
        label_title = movie.label&.title || 'Unknown'
        author_name = if movie.author
                        "#{movie.author.first_name} #{movie.author.last_name}"
                      else
                        'Unknown'
                      end
        puts "#{i + 1}) Title: #{movie.title}, Director: #{movie.director}, " \
             "Publish Date: #{movie.publish_date}, Silent: #{movie.silent ? 'Yes' : 'No'}, " \
             "Genre: #{genre_name}, Label: #{label_title}, Author: #{author_name}"
      end
    end
  end
end