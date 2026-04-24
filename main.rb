# frozen_string_literal: true

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

# Main application class for managing books and labels
class CatalogApp
  attr_reader :books, :labels, :genres, :authors, :sources, :music_albums, :movies, :games

  BOOKS_FILE = 'books.json'
  LABELS_FILE = 'labels.json'
  GENRES_FILE = 'genres.json'
  AUTHORS_FILE = 'authors.json'
  SOURCES_FILE = 'sources.json'
  MUSIC_ALBUMS_FILE = 'musicalbums.json'
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
    load_genres
    load_authors
    load_sources
    load_labels
    load_books
    load_music_albums
    load_movies
    load_games
    link_books_to_labels
    puts 'Data loaded successfully!'
  end

  # Load book records from JSON file into memory
  def load_books
    return @books = [] unless File.exist?(BOOKS_FILE)

    begin
      data = JSON.parse(File.read(BOOKS_FILE))
      @books = data.map { |book_data| Book.from_h(book_data) }
    rescue JSON::ParserError
      puts 'Warning: Could not parse books.json'
      @books = []
    end
  end

  # Load label records from JSON file into memory
  def load_labels
    return @labels = [] unless File.exist?(LABELS_FILE)

    begin
      data = JSON.parse(File.read(LABELS_FILE))
      @labels = data.map { |label_data| Label.from_h(label_data) }
    rescue JSON::ParserError
      puts 'Warning: Could not parse labels.json'
      @labels = []
    end
  end

  # Load genre records from JSON file into memory
  def load_genres
    return @genres = [] unless File.exist?(GENRES_FILE)

    begin
      data = JSON.parse(File.read(GENRES_FILE))
      @genres = data.map { |genre_data| Genre.from_h(genre_data) }
    rescue JSON::ParserError
      puts 'Warning: Could not parse genres.json'
      @genres = []
    end
  end

  # Load author records from JSON file into memory
  def load_authors
    return @authors = [] unless File.exist?(AUTHORS_FILE)

    begin
      data = JSON.parse(File.read(AUTHORS_FILE))
      @authors = data.map { |author_data| Author.from_h(author_data) }
    rescue JSON::ParserError
      puts 'Warning: Could not parse authors.json'
      @authors = []
    end
  end

  # Load source records from JSON file into memory
  def load_sources
    return @sources = [] unless File.exist?(SOURCES_FILE)

    begin
      data = JSON.parse(File.read(SOURCES_FILE))
      @sources = data.map { |source_data| Source.from_h(source_data) }
    rescue JSON::ParserError
      puts 'Warning: Could not parse sources.json'
      @sources = []
    end
  end

  # Load music album records from JSON file into memory
  def load_music_albums
    return @music_albums = [] unless File.exist?(MUSIC_ALBUMS_FILE)

    begin
      data = JSON.parse(File.read(MUSIC_ALBUMS_FILE))
      @music_albums = data.map { |album_data| MusicAlbum.from_h(album_data) }
    rescue JSON::ParserError
      puts 'Warning: Could not parse musicalbums.json'
      @music_albums = []
    end
  end

  # Load movie records from JSON file into memory
  def load_movies
    return @movies = [] unless File.exist?(MOVIES_FILE)

    begin
      data = JSON.parse(File.read(MOVIES_FILE))
      @movies = data.map { |movie_data| Movie.from_h(movie_data) }
    rescue JSON::ParserError
      puts 'Warning: Could not parse movies.json'
      @movies = []
    end
  end

  # Load game records from JSON file into memory
  def load_games
    return @games = [] unless File.exist?(GAMES_FILE)

    begin
      data = JSON.parse(File.read(GAMES_FILE))
      @games = data.map { |game_data| Game.from_h(game_data) }
    rescue JSON::ParserError
      puts 'Warning: Could not parse games.json'
      @games = []
    end
  end

  # Link books to their labels using the book label_id field
  def link_books_to_labels
    @books.each do |book|
      next unless book.label_id

      label = @labels.find { |item| item.id == book.label_id }
      label&.add_item(book)
    end
  end

  # Persist book records to books.json
  def save_books
    File.write(BOOKS_FILE, JSON.pretty_generate(@books.map(&:to_h)))
  end

  # Persist label records to labels.json
  def save_labels
    File.write(LABELS_FILE, JSON.pretty_generate(@labels.map(&:to_h)))
  end

  # Persist genre records to genres.json
  def save_genres
    File.write(GENRES_FILE, JSON.pretty_generate(@genres.map(&:to_h)))
  end

  # Persist author records to authors.json
  def save_authors
    File.write(AUTHORS_FILE, JSON.pretty_generate(@authors.map(&:to_h)))
  end

  # Persist source records to sources.json
  def save_sources
    File.write(SOURCES_FILE, JSON.pretty_generate(@sources.map(&:to_h)))
  end

  # Persist music album records to musicalbums.json
  def save_music_albums
    File.write(MUSIC_ALBUMS_FILE, JSON.pretty_generate(@music_albums.map(&:to_h)))
  end

  # Persist movie records to movies.json
  def save_movies
    File.write(MOVIES_FILE, JSON.pretty_generate(@movies.map(&:to_h)))
  end

  # Persist game records to games.json
  def save_games
    File.write(GAMES_FILE, JSON.pretty_generate(@games.map(&:to_h)))
  end

  # Persist both books and labels together
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

  # Display every stored book
  def list_all_books
    if @books.empty?
      puts "\nNo books found"
      return
    end

    puts "\n#{'=' * 28}"
    puts 'ALL BOOKS'.center(28)
    puts '=' * 28
    @books.each { |book| puts book.display }
    puts '=' * 28
    puts "Total: #{@books.length} book(s)\n"
  end

  # Display every stored label
  def list_all_labels
    if @labels.empty?
      puts "\nNo labels found!"
      return
    end

    puts "\n#{'=' * 28}"
    puts 'ALL LABELS'.center(28)
    puts '=' * 28
    @labels.each { |label| puts label.display }
    puts '=' * 28
    puts "Total: #{@labels.length} label(s)\n"
  end

  # Display every stored genre
  def list_all_genres
    if @genres.empty?
      puts "\nNo genres found!"
      return
    end

    puts "\n#{'=' * 28}"
    puts 'ALL GENRES'.center(28)
    puts '=' * 28
    @genres.each { |genre| puts "ID: #{genre.id} | Name: #{genre.name}" }
    puts '=' * 28
    puts "Total: #{@genres.length} genre(s)\n"
  end

  # Display every stored author
  def list_all_authors
    if @authors.empty?
      puts "\nNo authors found!"
      return
    end

    puts "\n#{'=' * 28}"
    puts 'ALL AUTHORS'.center(28)
    puts '=' * 28
    @authors.each { |author| puts "ID: #{author.id} | Name: #{author.first_name} #{author.last_name}" }
    puts '=' * 28
    puts "Total: #{@authors.length} author(s)\n"
  end

  # Display every stored source
  def list_all_sources
    if @sources.empty?
      puts "\nNo sources found!"
      return
    end

    puts "\n#{'=' * 28}"
    puts 'ALL SOURCES'.center(28)
    puts '=' * 28
    @sources.each { |source| puts "ID: #{source.id} | Name: #{source.name}" }
    puts '=' * 28
    puts "Total: #{@sources.length} source(s)\n"
  end

  # Display every stored music album
  def list_all_music_albums
    if @music_albums.empty?
      puts "\nNo music albums found!"
      return
    end

    puts "\n#{'=' * 28}"
    puts 'ALL MUSIC ALBUMS'.center(28)
    puts '=' * 28
    @music_albums.each { |album| puts album.display }
    puts '=' * 28
    puts "Total: #{@music_albums.length} music album(s)\n"
  end

  # Display every stored movie
  def list_all_movies
    if @movies.empty?
      puts "\nNo movies found!"
      return
    end

    puts "\n#{'=' * 28}"
    puts 'ALL MOVIES'.center(28)
    puts '=' * 28
    @movies.each { |movie| puts movie.display }
    puts '=' * 28
    puts "Total: #{@movies.length} movie(s)\n"
  end

  # Display every stored game
  def list_all_games
    if @games.empty?
      puts "\nNo games found!"
      return
    end

    puts "\n#{'=' * 28}"
    puts 'ALL GAMES'.center(28)
    puts '=' * 28
    @games.each { |game| puts game.display }
    puts '=' * 28
    puts "Total: #{@games.length} game(s)\n"
  end

  # Generate a new book id based on the current collection
  def next_book_id
    @books.empty? ? 1 : @books.map(&:id).max + 1
  end

  # Generate a new label id based on the current collection
  def next_label_id
    @labels.empty? ? 1 : @labels.map(&:id).max + 1
  end

  # Generate a new genre id based on the current collection
  def next_genre_id
    @genres.empty? ? 1 : @genres.map(&:id).max + 1
  end

  # Generate a new author id based on the current collection
  def next_author_id
    @authors.empty? ? 1 : @authors.map(&:id).max + 1
  end

  # Generate a new source id based on the current collection
  def next_source_id
    @sources.empty? ? 1 : @sources.map(&:id).max + 1
  end

  # Generate a new music album id based on the current collection
  def next_music_album_id
    @music_albums.empty? ? 1 : @music_albums.map(&:id).max + 1
  end

  # Generate a new movie id based on the current collection
  def next_movie_id
    @movies.empty? ? 1 : @movies.map(&:id).max + 1
  end

  # Generate a new game id based on the current collection
  def next_game_id
    @games.empty? ? 1 : @games.map(&:id).max + 1
  end

  # Find a label object by ID
  def find_label_by_id(label_id)
    @labels.find { |label| label.id == label_id }
  end

  # Prompt user to select a label for a new book
  def select_label_for_book
    if @labels.empty?
      puts '\nNo labels exist yet. You can add a book without a label.'
      return nil
    end

    list_all_labels
    print 'Enter label ID to assign to this book (or press Enter for no label): '
    input = gets.chomp.strip
    return nil if input.empty?

    chosen_id = input.to_i
    find_label_by_id(chosen_id)
  end

  # Add a new book to the system and attach it to a label
  def add_book
    puts '\n- Add New Book -'

    print 'Enter book title: '
    title = gets.chomp

    print 'Enter author name: '
    author = gets.chomp

    print 'Enter publisher: '
    publisher = gets.chomp

    print 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    print 'Enter cover state (good/acceptable/damaged): '
    cover_state = gets.chomp

    label = select_label_for_book

    book = Book.new(next_book_id, title, author, publisher, publish_date, cover_state, label&.id)
    @books << book
    label&.add_item(book)

    save_all_data
    puts "Book '#{title}' added successfully with ID: #{book.id}\n"
  end

  # Add a new label to the system
  def add_label
    puts '\n- Add New Label -'

    print 'Enter label title: '
    title = gets.chomp

    print 'Enter label color (red/blue/green/yellow/purple): '
    color = gets.chomp

    label = Label.new(next_label_id, title, color)
    @labels << label

    save_labels
    puts "Label '#{title}' added successfully with ID: #{label.id}\n"
    label
  end

  # Add a new genre to the system
  def add_genre
    puts '\n- Add New Genre -'

    print 'Enter genre name: '
    name = gets.chomp

    genre = Genre.new(next_genre_id, name)
    @genres << genre

    save_genres
    puts "Genre '#{name}' added successfully with ID: #{genre.id}\n"
  end

  # Add a new author to the system
  def add_author
    puts '\n- Add New Author -'

    print 'Enter first name: '
    first_name = gets.chomp

    print 'Enter last name: '
    last_name = gets.chomp

    author = Author.new(next_author_id, first_name, last_name)
    @authors << author

    save_authors
    puts "Author '#{first_name} #{last_name}' added successfully with ID: #{author.id}\n"
  end

  # Add a new source to the system
  def add_source
    puts '\n- Add New Source -'

    print 'Enter source name: '
    name = gets.chomp

    source = Source.new(next_source_id, name)
    @sources << source

    save_sources
    puts "Source '#{name}' added successfully with ID: #{source.id}\n"
  end

  # Add a new music album to the system
  def add_music_album
    puts '\n- Add New Music Album -'

    print 'Enter album title: '
    title = gets.chomp

    print 'Enter artist name: '
    artist = gets.chomp

    print 'Enter genre ID: '
    genre_id = gets.chomp.to_i

    print 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    print 'Is it on Spotify? (y/n): '
    on_spotify = gets.chomp.downcase == 'y'

    album = MusicAlbum.new(next_music_album_id, title, artist, genre_id, publish_date, on_spotify)
    @music_albums << album

    save_music_albums
    puts "Music album '#{title}' added successfully with ID: #{album.id}\n"
  end

  # Add a new movie to the system
  def add_movie
    puts '\n- Add New Movie -'

    print 'Enter movie title: '
    title = gets.chomp

    print 'Enter director name: '
    director = gets.chomp

    print 'Enter genre ID: '
    genre_id = gets.chomp.to_i

    print 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    print 'Is it silent? (y/n): '
    silent = gets.chomp.downcase == 'y'

    movie = Movie.new(next_movie_id, title, director, genre_id, publish_date, silent)
    @movies << movie

    save_movies
    puts "Movie '#{title}' added successfully with ID: #{movie.id}\n"
  end

  # Add a new game to the system
  def add_game
    puts '\n- Add New Game -'

    print 'Enter game title: '
    title = gets.chomp

    print 'Enter author ID: '
    author_id = gets.chomp.to_i

    print 'Enter genre ID: '
    genre_id = gets.chomp.to_i

    print 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    print 'Is it multiplayer? (y/n): '
    multiplayer = gets.chomp.downcase == 'y'

    game = Game.new(next_game_id, title, author_id, genre_id, publish_date, multiplayer)
    @games << game

    save_games
    puts "Game '#{title}' added successfully with ID: #{game.id}\n"
  end

  # Archive a book if it is eligible
  def archive_book
    puts '\nEnter book ID to archive: '
    book_id = gets.chomp.to_i
    book = @books.find { |b| b.id == book_id }

    if book.nil?
      puts "Book with ID #{book_id} not found!\n"
      return
    end

    if book.archived
      puts "Book is already archived!\n"
      return
    end

    if book.move_to_archive
      save_books
      puts "Book '#{book.title}' has been archived!\n"
    else
      puts "Book cannot be archived. Check publish date and cover state.\n"
    end
  end

  # Archive a music album if it is eligible
  def archive_music_album
    puts '\nEnter music album ID to archive: '
    album_id = gets.chomp.to_i
    album = @music_albums.find { |a| a.id == album_id }

    if album.nil?
      puts "Music album with ID #{album_id} not found!\n"
      return
    end

    if album.archived
      puts "Music album is already archived!\n"
      return
    end

    if album.move_to_archive
      save_music_albums
      puts "Music album '#{album.title}' has been archived!\n"
    else
      puts "Music album cannot be archived. Check publish date and on Spotify status.\n"
    end
  end

  # Archive a movie if it is eligible
  def archive_movie
    puts '\nEnter movie ID to archive: '
    movie_id = gets.chomp.to_i
    movie = @movies.find { |m| m.id == movie_id }

    if movie.nil?
      puts "Movie with ID #{movie_id} not found!\n"
      return
    end

    if movie.archived
      puts "Movie is already archived!\n"
      return
    end

    if movie.move_to_archive
      save_movies
      puts "Movie '#{movie.title}' has been archived!\n"
    else
      puts "Movie cannot be archived. Check publish date and silent status.\n"
    end
  end

  # Archive a game if it is eligible
  def archive_game
    puts '\nEnter game ID to archive: '
    game_id = gets.chomp.to_i
    game = @games.find { |g| g.id == game_id }

    if game.nil?
      puts "Game with ID #{game_id} not found!\n"
      return
    end

    if game.archived
      puts "Game is already archived!\n"
      return
    end

    if game.move_to_archive
      save_games
      puts "Game '#{game.title}' has been archived!\n"
    else
      puts "Game cannot be archived. Check publish date and multiplayer status.\n"
    end
  end

  # Print the main application menu
  def display_menu
    puts "\n#{'=' * 20}"
    puts 'CATALOG MANAGEMENT SYSTEM'.center(20)
    puts '=' * 20
    puts 'List Items:'
    puts '1. List all books'
    puts '2. List all labels'
    puts '3. List all genres'
    puts '4. List all authors'
    puts '5. List all sources'
    puts '6. List all music albums'
    puts '7. List all movies'
    puts '8. List all games'
    puts 'Add Items:'
    puts '9. Add a book'
    puts '10. Add a label'
    puts '11. Add a genre'
    puts '12. Add an author'
    puts '13. Add a source'
    puts '14. Add a music album'
    puts '15. Add a movie'
    puts '16. Add a game'
    puts 'Archive Items:'
    puts '17. Archive a book'
    puts '18. Archive a music album'
    puts '19. Archive a movie'
    puts '20. Archive a game'
    puts '21. Exit'
    puts '=' * 20
    print 'Select an option (1 to 21): '
  end

  # Main application loop that processes user input
  def run
    loop do
      display_menu
      choice = gets.chomp.strip

      case choice
      when '1'
        list_all_books
      when '2'
        list_all_labels
      when '3'
        list_all_genres
      when '4'
        list_all_authors
      when '5'
        list_all_sources
      when '6'
        list_all_music_albums
      when '7'
        list_all_movies
      when '8'
        list_all_games
      when '9'
        add_book
      when '10'
        add_label
      when '11'
        add_genre
      when '12'
        add_author
      when '13'
        add_source
      when '14'
        add_music_album
      when '15'
        add_movie
      when '16'
        add_game
      when '17'
        archive_book
      when '18'
        archive_music_album
      when '19'
        archive_movie
      when '20'
        archive_game
      when '21'
        puts '\nThanks for using the Catalog Management System\n.'
        break
      else
        puts '\nInvalid option. Please try again.\n'
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  app = CatalogApp.new
  app.run
end
