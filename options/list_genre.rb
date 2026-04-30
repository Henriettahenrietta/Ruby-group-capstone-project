# frozen_string_literal: true

module ListGenre
  def list_genre
    puts "\nGENRE LIST:\n"
    if @genres.empty?
      puts 'No genres available.'
    else
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}. ID: #{genre.id}, Name: #{genre.name}"
      end
    end
  end
end
