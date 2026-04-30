module ListGames
  def list_games
    puts "\nGAMES LIST:\n"
    return puts 'No games found' if @games.empty?

    @games.each_with_index do |game, index|
      puts game_details(game, index)
    end
  end

  private

  def game_details(game, index)
    "#{index + 1}) Last Played on #{game.last_played_at}, " \
      "Publish Date: #{game.publish_date}, " \
      "Multiplayer: #{yes_no(game.multiplayer)}, " \
      "Archived: #{game.archived}, " \
      "Genre: #{safe_name(game.genre, :name)}, " \
      "Label: #{safe_name(game.label, :title)}, " \
      "Author: #{author_name(game.author)}"
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
