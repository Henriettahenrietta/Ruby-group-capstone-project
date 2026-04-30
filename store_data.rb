require 'json'

module StoreData
  def save_games
    games_data = @games.map { |game| game_hash(game) }

    File.write('./storage/games.json', JSON.pretty_generate(games_data))
  end

  def game_hash(game)
    {
      multiplayer: game.multiplayer,
      last_played_at: game.last_played_at.to_s,
      publish_date: game.publish_date.to_s,
      archived: game.archived,
      label: item_label(game.label),
      genre: item_genre(game.genre),
      author: item_author(game.author)
    }
  end

  def item_label(label)
    return nil unless label

    { id: label.id, title: label.title, color: label.color }
  end

  def item_genre(genre)
    return nil unless genre

    { id: genre.id, name: genre.name }
  end

  def item_author(author)
    return nil unless author

    {
      id: author.id,
      first_name: author.first_name,
      last_name: author.last_name
    }
  end
end
