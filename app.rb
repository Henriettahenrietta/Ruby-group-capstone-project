# frozen_string_literal: true

require_relative 'store_data'
require_relative 'load_data'

require_relative 'classes/book'
require_relative 'classes/music_album'
require_relative 'classes/movie'
require_relative 'classes/game'
require_relative 'classes/genre'
require_relative 'classes/label'
require_relative 'classes/author'

require_relative 'options/list_book'
require_relative 'options/list_label'
require_relative 'options/add_book'
require_relative 'options/list_genre'
require_relative 'options/list_music_albums'
require_relative 'options/add_musicalbum'
require_relative 'options/add_game'
require_relative 'options/list_game'
require_relative 'options/list_author'
require_relative 'options/add_genre'
require_relative 'options/add_label'
require_relative 'options/add_author'
require_relative 'options/add_movie'
require_relative 'options/list_movie'

class App
  include ListGames
  include ListAuthors
  include ListMovies
  include AddGame
  include AddMusicAlbum
  include ListMusicAlbums
  include ListGenre
  include AddBook
  include ListBooks
  include ListLabels
  include AddGenre
  include AddLabel
  include AddAuthor
  include AddMovie

  include StoreData
  include LoadData

  OPTIONS_HASH = {
    1 => :list_books,
    2 => :list_music_albums,
    3 => :list_movies,
    4 => :list_games,
    5 => :list_genres,
    6 => :list_labels,
    7 => :list_authors,
    8 => :add_book,
    9 => :add_music_album,
    10 => :add_movie,
    11 => :add_game,
    12 => :add_genre,
    13 => :add_label,
    14 => :add_author
  }.freeze

  attr_accessor :books, :music_albums, :movies, :games, :genres, :labels, :authors

  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []
    @genres = []
    @labels = []
    @authors = []

    load_all_files
  end

  def call_option(option)
    if option.zero?
      save_all_files
      puts 'Thank you for using our app!'
    else
      method(OPTIONS_HASH[option]).call
    end
  end
end
