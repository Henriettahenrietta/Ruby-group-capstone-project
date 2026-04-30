# frozen_string_literal: true

require './app'

def menu
  puts "\n1 - List all books"
  puts '2 - List all music albums'
  puts '3 - List all movies'
  puts '4 - List all games'
  puts '5 - List all genres'
  puts '6 - List all labels'
  puts '7 - List all authors'
  puts '8 - Add a book'
  puts '9 - Add a music album'
  puts '10 - Add a movie'
  puts '11 - Add a game'
  puts '12 - Add a genre'
  puts '13 - Add a label'
  puts '14 - Add an author'
  puts '0 - Exit'
  print 'Choose an option: '
end

app = App.new

loop do
  menu
  option = gets.chomp.to_i
  app.call_option(option)
  break if option.zero?
end