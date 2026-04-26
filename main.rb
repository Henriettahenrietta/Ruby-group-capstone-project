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

class CatalogApp
  def initialize
    @books = []
    @labels = []
    @genres = []
    @authors = []
    @sources = []
    @music_albums = []
    @movies = []
    @games = []
  end

  # -----------------------------
  # SCREEN HELPERS
  # -----------------------------
  def clear_screen
    system('cls') || system('clear')
  end

  def pause
    puts "\nPress Enter to continue..."
    gets
  end

  # -----------------------------
  # LIST METHODS
  # -----------------------------
  def list_all_books
    clear_screen
    puts '--- BOOKS ---'
    if @books.empty?
      puts 'No books found.'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1}. Publisher: #{book.publisher} | Cover: #{book.cover_state} | Date: #{book.publish_date}"
      end
    end
    pause
  end

  def list_all_labels
    clear_screen
    puts '--- LABELS ---'
    if @labels.empty?
      puts 'No labels found.'
    else
      @labels.each_with_index do |label, index|
        puts "#{index + 1}. #{label.title} (#{label.color})"
      end
    end
    pause
  end

  def list_all_genres
    clear_screen
    puts '--- GENRES ---'
    if @genres.empty?
      puts 'No genres found.'
    else
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}. #{genre.name}"
      end
    end
    pause
  end

  def list_all_authors
    clear_screen
    puts '--- AUTHORS ---'
    if @authors.empty?
      puts 'No authors found.'
    else
      @authors.each_with_index do |author, index|
        puts "#{index + 1}. #{author.first_name} #{author.last_name}"
      end
    end
    pause
  end

  def list_all_sources
    clear_screen
    puts '--- SOURCES ---'
    if @sources.empty?
      puts 'No sources found.'
    else
      @sources.each_with_index do |source, index|
        puts "#{index + 1}. #{source.name}"
      end
    end
    pause
  end

  def list_all_music_albums
    clear_screen
    puts '--- MUSIC ALBUMS ---'
    if @music_albums.empty?
      puts 'No music albums found.'
    else
      @music_albums.each_with_index do |album, index|
        puts "#{index + 1}. On Spotify: #{album.on_spotify} | Date: #{album.publish_date}"
      end
    end
    pause
  end

  def list_all_movies
    clear_screen
    puts '--- MOVIES ---'
    if @movies.empty?
      puts 'No movies found.'
    else
      @movies.each_with_index do |movie, index|
        puts "#{index + 1}. Silent: #{movie.silent} | Date: #{movie.publish_date}"
      end
    end
    pause
  end

  def list_all_games
    clear_screen
    puts '--- GAMES ---'
    if @games.empty?
      puts 'No games found.'
    else
      @games.each_with_index do |game, index|
        puts "#{index + 1}. Multiplayer: #{game.multiplayer} | Last Played: #{game.last_played_at}"
      end
    end
    pause
  end

  # -----------------------------
  # ADD METHODS
  # -----------------------------
  def add_book
    clear_screen
    puts '--- ADD BOOK ---'

    print 'Publisher: '
    publisher = gets.chomp

    print 'Cover state: '
    cover_state = gets.chomp

    print 'Publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    @books << Book.new(publisher, cover_state, publish_date)

    puts "\nBook added successfully!"
    pause
  end

  def add_label
    clear_screen
    puts '--- ADD LABEL ---'

    print 'Title: '
    title = gets.chomp

    print 'Color: '
    color = gets.chomp

    @labels << Label.new(title, color)

    puts "\nLabel added successfully!"
    pause
  end

  def add_genre
    clear_screen
    puts '--- ADD GENRE ---'

    print 'Genre name: '
    name = gets.chomp

    @genres << Genre.new(name)

    puts "\nGenre added successfully!"
    pause
  end

  def add_author
    clear_screen
    puts '--- ADD AUTHOR ---'

    print 'First name: '
    first_name = gets.chomp

    print 'Last name: '
    last_name = gets.chomp

    @authors << Author.new(first_name, last_name)

    puts "\nAuthor added successfully!"
    pause
  end

  def add_source
    clear_screen
    puts '--- ADD SOURCE ---'

    print 'Source name: '
    name = gets.chomp

    @sources << Source.new(name)

    puts "\nSource added successfully!"
    pause
  end

  def add_music_album
    clear_screen
    puts '--- ADD MUSIC ALBUM ---'

    print 'On Spotify? (true/false): '
    on_spotify = gets.chomp.downcase == 'true'

    print 'Publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    @music_albums << MusicAlbum.new(on_spotify, publish_date)

    puts "\nMusic album added successfully!"
    pause
  end

  def add_movie
    clear_screen
    puts '--- ADD MOVIE ---'

    print 'Silent? (true/false): '
    silent = gets.chomp.downcase == 'true'

    print 'Publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    @movies << Movie.new(silent, publish_date)

    puts "\nMovie added successfully!"
    pause
  end

  def add_game
    clear_screen
    puts '--- ADD GAME ---'

    print 'Multiplayer? (true/false): '
    multiplayer = gets.chomp.downcase == 'true'

    print 'Last played at (YYYY-MM-DD): '
    last_played_at = gets.chomp

    print 'Publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    @games << Game.new(multiplayer, last_played_at, publish_date)

    puts "\nGame added successfully!"
    pause
  end

  # -----------------------------
  # MENU
  # -----------------------------
  def menu
    clear_screen

    puts '===================================='
    puts '        CATALOG OF MY THINGS        '
    puts '===================================='
    puts '1  - List all books'
    puts '2  - List all labels'
    puts '3  - List all genres'
    puts '4  - List all authors'
    puts '5  - List all sources'
    puts '6  - List all music albums'
    puts '7  - List all movies'
    puts '8  - List all games'
    puts '9  - Add a book'
    puts '10 - Add a label'
    puts '11 - Add a genre'
    puts '12 - Add an author'
    puts '13 - Add a source'
    puts '14 - Add a music album'
    puts '15 - Add a movie'
    puts '16 - Add a game'
    puts '17 - Exit'
    puts '===================================='
    print 'Choose option: '
  end

  def run
    loop do
      menu
      option = gets.chomp.to_i

      case option
      when 1 then list_all_books
      when 2 then list_all_labels
      when 3 then list_all_genres
      when 4 then list_all_authors
      when 5 then list_all_sources
      when 6 then list_all_music_albums
      when 7 then list_all_movies
      when 8 then list_all_games
      when 9 then add_book
      when 10 then add_label
      when 11 then add_genre
      when 12 then add_author
      when 13 then add_source
      when 14 then add_music_album
      when 15 then add_movie
      when 16 then add_game
      when 17
        clear_screen
        puts 'Thank you for using Catalog App!'
        break
      else
        puts "\nInvalid option!"
        pause
      end
    end
  end
end

app = CatalogApp.new
app.run