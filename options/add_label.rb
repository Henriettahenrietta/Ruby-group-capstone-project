# frozen_string_literal: true

require './classes/label'

module AddLabel
  def add_label
    print 'Label title: '
    title = gets.chomp

    print 'Color: '
    color = gets.chomp

    @labels << Label.new(title, color)

    puts 'Label created successfully'
  end
end