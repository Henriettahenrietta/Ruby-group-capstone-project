module ListGames
  def list_games
    puts "\nGAMES LIST:\n"
    if @games.empty?
      puts 'No games found'
    else
      @games.each_with_index do |game, i|
        last_played_date = game.last_played_at
        genre_name = game.genre&.name || 'Unknown'
        label_title = game.label&.title || 'Unknown'
        author_name = if game.author
                        "#{game.author.first_name} #{game.author.last_name}"
                      else
                        'Unknown'
                      end
        puts "#{i + 1}) Last Played on #{last_played_date}, Publish Date: #{game.publish_date}, " \
             "Multiplayer: #{game.multiplayer ? 'Yes' : 'No'}, Archived: #{game.archived}, " \
             "Genre: #{genre_name}, Label: #{label_title}, Author: #{author_name}"
      end
    end
  end
end
