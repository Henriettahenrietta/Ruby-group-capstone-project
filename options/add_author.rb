# frozen_string_literal: true

require './classes/author'

module AddAuthor
  def add_author
    print 'First name: '
    first_name = gets.chomp

    print 'Last name: '
    last_name = gets.chomp

    @authors << Author.new(first_name, last_name)

    puts 'Author created successfully'
  end
end
