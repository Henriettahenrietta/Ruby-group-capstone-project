require 'date'
require './classes/game'
require './options/add_props'

module AddGame
  include AddProps

  def add_game
    puts 'Is the game multiplayer? (yes/no)'

    loop do
      @multiplayer_input = gets.chomp.downcase
      break if @multiplayer_input =~ /^(?:yes|no)$/

      puts 'Provide valid input (yes/no)'
    end

    multiplayer = @multiplayer_input == 'yes'

    puts 'When was the game last played? Provide in format \'yyyy-mm-dd\''
    @last_played_date = date_prompt(@last_played_date)
    return if @last_played_date.nil?

    puts 'When was the game published? Provide in format \'yyyy-mm-dd\''
    @publish_date = date_prompt(@publish_date)
    return if @publish_date.nil?

    game = Game.new(multiplayer, @last_played_date, @publish_date)
    @games.push(game)

    choose_label(game)
    choose_genre(game)
    choose_author(game)

    puts "Game added successfully!\n"
  end

  def date_prompt(date)
    loop do
      input = gets.chomp
      break if input =~ /^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/

      return nil if input == 'exit'

      puts "Provide the date in format 'yyyy-mm-dd' or type 'exit' to go to the main menu"
    end
    input
  end
end
