# frozen_string_literal: true

require './store_data'
require './load_data'

require './classes/book'
require './classes/music_album'
require './classes/movie'
require './classes/game'
require './classes/genre'
require './classes/label'
require './classes/author'

require './options/list_book'
require './options/list_label'
require './options/add_book'
require './options/list_genre'
require './options/list_music_albums'
require './options/add_musicalbum'
require './options/add_game'
require './options/list_game'
require './options/list_author'
require './options/add_genre'
require './options/add_label'
require './options/add_author'
require './options/add_movie'
require './options/list_movie'

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
