# frozen_string_literal: true

require_relative 'item'

class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(id, first_name, last_name)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def display
    "ID: #{@id} | #{@first_name} #{@last_name} | Items: #{@items.length}"
  end

  def to_h
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name
    }
  end

  def self.from_h(data)
    new(data['id'], data['first_name'], data['last_name'])
  end
end
