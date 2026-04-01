#!/usr/bin/env ruby

require 'json'
require 'date'
require_relative 'classes/item'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'classes/genre'
require_relative 'classes/author'
require_relative 'classes/source'
require_relative 'classes/musicalbum'
require_relative 'classes/movie'
require_relative 'classes/game'

class CatalogApp
  attr_reader :books, :labels, :genres, :authors, :sources, :music_albums, :movies, :games

  BOOKS_FILE = 'books.json'
  LABELS_FILE = 'labels.json'
  GENRES_FILE = 'genres.json'
  AUTHORS_FILE = 'authors.json'
  SOURCES_FILE = 'sources.json'
  MUSIC_ALBUMS_FILE = 'music_albums.json'
  MOVIES_FILE = 'movies.json'
  GAMES_FILE = 'games.json'

  def initialize
    @books = []
    @labels = []
    @genres = []
    @authors = []
    @sources = []
    @music_albums = []
    @movies = []
    @games = []
    load_data
  end

  def load_data
    load_books
    load_labels
    load_genres
    load_authors
    load_sources
    load_music_albums
    load_movies
    load_games
    puts " Data loaded successfully!"
  end

  def load_books
    if File.exist?(BOOKS_FILE)
      begin
        data = JSON.parse(File.read(BOOKS_FILE))
        @books = data.map { |book_data| Book.from_h(book_data) }
      rescue JSON::ParserError
        puts "Warning: Could not parse books.json"
        @books = []
      end
    else
      @books = []
    end
  end

  def load_labels
    if File.exist?(LABELS_FILE)
      begin
        data = JSON.parse(File.read(LABELS_FILE))
        @labels = data.map { |label_data| Label.from_h(label_data) }
      rescue JSON::ParserError
        puts "Warning: Could not parse labels.json"
        @labels = []
      end
    else
      @labels = []
    end
  end

  def load_genres
    if File.exist?(GENRES_FILE)
      begin
        data = JSON.parse(File.read(GENRES_FILE))
        @genres = data.map { |genre_data| Genre.from_h(genre_data) }
      rescue JSON::ParserError
        puts "Warning: Could not parse genres.json"
        @genres = []
      end
    else
      @genres = []
    end
  end

  def load_authors
    if File.exist?(AUTHORS_FILE)
      begin
        data = JSON.parse(File.read(AUTHORS_FILE))
        @authors = data.map { |author_data| Author.from_h(author_data) }
      rescue JSON::ParserError
        puts "Warning: Could not parse authors.json"
        @authors = []
      end
    else
      @authors = []
    end
  end

  def load_sources
    if File.exist?(SOURCES_FILE)
      begin
        data = JSON.parse(File.read(SOURCES_FILE))
        @sources = data.map { |source_data| Source.from_h(source_data) }
      rescue JSON::ParserError
        puts "Warning: Could not parse sources.json"
        @sources = []
      end
    else
      @sources = []
    end
  end

  def load_music_albums
    if File.exist?(MUSIC_ALBUMS_FILE)
      begin
        data = JSON.parse(File.read(MUSIC_ALBUMS_FILE))
        @music_albums = data.map { |album_data| MusicAlbum.from_h(album_data) }
      rescue JSON::ParserError
        puts "Warning: Could not parse music_albums.json"
        @music_albums = []
      end
    else
      @music_albums = []
    end
  end

  def load_movies
    if File.exist?(MOVIES_FILE)
      begin
        data = JSON.parse(File.read(MOVIES_FILE))
        @movies = data.map { |movie_data| Movie.from_h(movie_data) }
      rescue JSON::ParserError
        puts "Warning: Could not parse movies.json"
        @movies = []
      end
    else
      @movies = []
    end
  end

  def load_games
    if File.exist?(GAMES_FILE)
      begin
        data = JSON.parse(File.read(GAMES_FILE))
        @games = data.map { |game_data| Game.from_h(game_data) }
      rescue JSON::ParserError
        puts "Warning: Could not parse games.json"
        @games = []
      end
    else
      @games = []
    end
  end

  def save_books
    File.write(BOOKS_FILE, JSON.pretty_generate(@books.map(&:to_h)))
  end

  def save_labels
    File.write(LABELS_FILE, JSON.pretty_generate(@labels.map(&:to_h)))
  end

  def save_genres
    File.write(GENRES_FILE, JSON.pretty_generate(@genres.map(&:to_h)))
  end

  def save_authors
    File.write(AUTHORS_FILE, JSON.pretty_generate(@authors.map(&:to_h)))
  end

  def save_sources
    File.write(SOURCES_FILE, JSON.pretty_generate(@sources.map(&:to_h)))
  end

  def save_music_albums
    File.write(MUSIC_ALBUMS_FILE, JSON.pretty_generate(@music_albums.map(&:to_h)))
  end

  def save_movies
    File.write(MOVIES_FILE, JSON.pretty_generate(@movies.map(&:to_h)))
  end

  def save_games
    File.write(GAMES_FILE, JSON.pretty_generate(@games.map(&:to_h)))
  end

  def save_all_data
    save_books
    save_labels
    save_genres
    save_authors
    save_sources
    save_music_albums
    save_movies
    save_games
  end

  def list_all_books
    if @books.empty?
      puts "\nNo books found"
    else
      puts "\n" + "=" * 40
      puts "ALL BOOKS".center(40)
      puts "=" * 40
      @books.each { |book| puts book.display }
      puts "=" * 40
      puts "Total: #{@books.length} book(s)\n"
    end
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts "\nNo music albums found"
    else
      puts "\n" + "=" * 40
      puts "ALL MUSIC ALBUMS".center(40)
      puts "=" * 40
      @music_albums.each { |album| puts album.display }
      puts "=" * 40
      puts "Total: #{@music_albums.length} album(s)\n"
    end
  end

  def list_all_movies
    if @movies.empty?
      puts "\nNo movies found"
    else
      puts "\n" + "=" * 40
      puts "ALL MOVIES".center(40)
      puts "=" * 40
      @movies.each { |movie| puts movie.display }
      puts "=" * 40
      puts "Total: #{@movies.length} movie(s)\n"
    end
  end

  def list_all_games
    if @games.empty?
      puts "\nNo games found"
    else
      puts "\n" + "=" * 40
      puts "ALL GAMES".center(40)
      puts "=" * 40
      @games.each { |game| puts game.display }
      puts "=" * 40
      puts "Total: #{@games.length} game(s)\n"
    end
  end

  def list_all_genres
    if @genres.empty?
      puts "\nNo genres found"
    else
      puts "\n" + "=" * 40
      puts "ALL GENRES".center(40)
      puts "=" * 40
      @genres.each { |genre| puts genre.display }
      puts "=" * 40
      puts "Total: #{@genres.length} genre(s)\n"
    end
  end

  def list_all_labels
    if @labels.empty?
      puts "\nNo labels found!"
    else
      puts "\n" + "=" * 40
      puts "ALL LABELS".center(40)
      puts "=" * 40
      @labels.each { |label| puts label.display }
      puts "=" * 40
      puts "Total: #{@labels.length} label(s)\n"
    end
  end

  def list_all_authors
    if @authors.empty?
      puts "\nNo authors found"
    else
      puts "\n" + "=" * 40
      puts "ALL AUTHORS".center(40)
      puts "=" * 40
      @authors.each { |author| puts author.display }
      puts "=" * 40
      puts "Total: #{@authors.length} author(s)\n"
    end
  end

  def list_all_sources
    if @sources.empty?
      puts "\nNo sources found"
    else
      puts "\n" + "=" * 40
      puts "ALL SOURCES".center(40)
      puts "=" * 40
      @sources.each { |source| puts source.display }
      puts "=" * 40
      puts "Total: #{@sources.length} source(s)\n"
    end
  end

  def add_book
    puts "\n-Add New Book-"
    
    print "Enter book title: "
    title = gets.chomp
    
    print "Enter author name: "
    author = gets.chomp
    
    print "Enter publisher: "
    publisher = gets.chomp
    
    print "Enter publish date (YYYY-MM-DD): "
    publish_date = gets.chomp
    
    print "Enter cover state (good/acceptable/bad): "
    cover_state = gets.chomp
    
    new_id = @books.empty? ? 1 : @books.map(&:id).max + 1
    
    book = Book.new(new_id, title, author, publisher, publish_date, cover_state)
    @books << book
    
    save_books
    puts "Book '#{title}' added successfully with ID: #{new_id}\n"
  end

  def add_music_album
    puts "\n-Add New Music Album-"
    
    print "Enter album title: "
    title = gets.chomp
    
    print "Enter publish date (YYYY-MM-DD): "
    publish_date = gets.chomp
    
    print "Is it on Spotify? (true/false): "
    on_spotify = gets.chomp.downcase == 'true'
    
    new_id = @music_albums.empty? ? 1 : @music_albums.map(&:id).max + 1
    
    album = MusicAlbum.new(new_id, title, publish_date, on_spotify)
    @music_albums << album
    
    save_music_albums
    puts "Music album '#{title}' added successfully with ID: #{new_id}\n"
  end

  def add_movie
    puts "\n-Add New Movie-"
    
    print "Enter movie title: "
    title = gets.chomp
    
    print "Enter publish date (YYYY-MM-DD): "
    publish_date = gets.chomp
    
    print "Is it silent? (true/false): "
    silent = gets.chomp.downcase == 'true'
    
    new_id = @movies.empty? ? 1 : @movies.map(&:id).max + 1
    
    movie = Movie.new(new_id, title, publish_date, silent)
    @movies << movie
    
    save_movies
    puts "Movie '#{title}' added successfully with ID: #{new_id}\n"
  end

  def add_game
    puts "\n-Add New Game-"
    
    print "Enter game title: "
    title = gets.chomp
    
    print "Enter publish date (YYYY-MM-DD): "
    publish_date = gets.chomp
    
    print "Is it multiplayer? (true/false): "
    multiplayer = gets.chomp.downcase == 'true'
    
    print "Enter last played date (YYYY-MM-DD): "
    last_played_at = gets.chomp
    
    new_id = @games.empty? ? 1 : @games.map(&:id).max + 1
    
    game = Game.new(new_id, title, publish_date, multiplayer, last_played_at)
    @games << game
    
    save_games
    puts "Game '#{title}' added successfully with ID: #{new_id}\n"
  end

  def add_label
    puts "\n-Add New Label-"
    
    print "Enter label title: "
    title = gets.chomp
    
    print "Enter label color (red/blue/green/yellow/purple): "
    color = gets.chomp
    
    new_id = @labels.empty? ? 1 : @labels.map(&:id).max + 1
    
    label = Label.new(new_id, title, color)
    @labels << label
    
    save_labels
    puts " Label '#{title}' added successfully with ID: #{new_id}\n"
  end

  def add_genre
    puts "\n-Add New Genre-"
    
    print "Enter genre name: "
    name = gets.chomp
    
    new_id = @genres.empty? ? 1 : @genres.map(&:id).max + 1
    
    genre = Genre.new(new_id, name)
    @genres << genre
    
    save_genres
    puts " Genre '#{name}' added successfully with ID: #{new_id}\n"
  end

  def add_author
    puts "\n-Add New Author-"
    
    print "Enter first name: "
    first_name = gets.chomp
    
    print "Enter last name: "
    last_name = gets.chomp
    
    new_id = @authors.empty? ? 1 : @authors.map(&:id).max + 1
    
    author = Author.new(new_id, first_name, last_name)
    @authors << author
    
    save_authors
    puts " Author '#{first_name} #{last_name}' added successfully with ID: #{new_id}\n"
  end

  def add_source
    puts "\n-Add New Source-"
    
    print "Enter source name: "
    name = gets.chomp
    
    new_id = @sources.empty? ? 1 : @sources.map(&:id).max + 1
    
    source = Source.new(new_id, name)
    @sources << source
    
    save_sources
    puts " Source '#{name}' added successfully with ID: #{new_id}\n"
  end

  def archive_book
    puts "\nEnter book ID to archive: "
    book_id = gets.chomp.to_i
    
    book = @books.find { |b| b.id == book_id }
    
    if book.nil?
      puts " Book with ID #{book_id} not found!\n"
    elsif book.archived
      puts " Book is already archived!\n"
    elsif book.move_to_archive
      save_books
      puts " Book '#{book.title}' has been archived!\n"
    else
      puts " Book cannot be archived. Check publish date and cover state.\n"
    end
  end

  def display_menu
    puts "\n" + "=" * 40
    puts "CATALOG OF MY THINGS".center(40)
    puts "=" * 40
    puts "1. List all books"
    puts "2. List all music albums"
    puts "3. List all movies"
    puts "4. List of games"
    puts "5. List all genres"
    puts "6. List all labels"
    puts "7. List all authors"
    puts "8. List all sources"
    puts "9. Add a book"
    puts "10. Add a music album"
    puts "11. Add a movie"
    puts "12. Add a game"
    puts "13. Add a genre"
    puts "14. Add a label"
    puts "15. Add an author"
    puts "16. Add a source"
    puts "17. Exit"
    puts "=" * 40
    print "Select an option (1 to 17): "
  end

  def run
    loop do
      display_menu
      choice = gets.chomp.strip
      
      case choice
      when '1'
        list_all_books
      when '2'
        list_all_music_albums
      when '3'
        list_all_movies
      when '4'
        list_all_games
      when '5'
        list_all_genres
      when '6'
        list_all_labels
      when '7'
        list_all_authors
      when '8'
        list_all_sources
      when '9'
        add_book
      when '10'
        add_music_album
      when '11'
        add_movie
      when '12'
        add_game
      when '13'
        add_genre
      when '14'
        add_label
      when '15'
        add_author
      when '16'
        add_source
      when '17'
        puts "\n Thanks for using the Catalog of My Things!"
        break
      else
        puts "\n Invalid option. Please try again.\n"
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  app = CatalogApp.new
  app.run
end
