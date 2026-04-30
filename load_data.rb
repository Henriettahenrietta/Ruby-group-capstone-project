# frozen_string_literal: true

require 'json'

module LoadData
  def load_all_files
    load_authors
    load_games
    load_albums
    load_genres
    load_books
    load_labels
  end

  def assign_associations(obj, data)
    obj.label = @labels.find { |l| l.id == data['label']['id'] } if data['label'] && data['label']['id']
    obj.genre = @genres.find { |g| g.id == data['genre']['id'] } if data['genre'] && data['genre']['id']
    obj.author = @authors.find { |a| a.id == data['author']['id'] } if data['author'] && data['author']['id']
  end

  def load_authors
    return unless File.exist?('./storage/authors.json')

    authors_json = JSON.parse(File.read('./storage/authors.json'))
    @authors = authors_json.map do |author|
      # Use the fetch method to handle missing or nil values
      first_name = author.fetch('first_name', '')
      last_name = author.fetch('last_name', '')
      id = author.fetch('id', nil)

      Author.new(first_name, last_name, id)
    end
  end

  def load_games
    return unless File.exist?('./storage/games.json')

    games_json = JSON.parse(File.read('./storage/games.json'))
    @games = games_json.map do |game|
      game_obj = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'],
                          archived: game['archived'])
      assign_associations(game_obj, game)

      game_obj
    end
  end

  def load_albums
    return unless File.exist?('./storage/musicalbum.json')

    musicalbums_loaded = JSON.parse(File.read('./storage/musicalbum.json'))
    @music_albums = musicalbums_loaded.map do |album|
      album_obj = MusicAlbum.new(
        publish_date: album['publish_date'],
        on_spotify: album['on_spotify'] || false,
        archived: album['archived'] || false
      )
      assign_associations(album_obj, album)

      album_obj
    end
  end

  def load_genres
    return unless File.exist?('./storage/genres.json')

    genres_loaded = JSON.parse(File.read('./storage/genres.json'))
    @genres = genres_loaded.map do |genre|
      Genre.new(genre['name'], genre['id'])
    end
  end

  def load_books
    return unless File.exist?('./storage/books.json')

    books_json = JSON.parse(File.read('./storage/books.json'))
    @books = books_json.map do |book|
      book_obj = Book.new(book['publisher'], book['cover_state'], book['publish_date'])
      assign_associations(book_obj, book)
      book_obj
    end
  end

  def load_labels
    return unless File.exist?('./storage/labels.json')

    labels_json = JSON.parse(File.read('./storage/labels.json'))
    @labels = labels_json.map do |label|
      Label.new(label['title'], label['color'], label['id'])
    end
  end
end
