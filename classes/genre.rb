# frozen_string_literal: true

require_relative 'item'

class Genre
  attr_accessor :id, :name, :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def display
    "ID: #{@id} | Name: #{@name} | Items: #{@items.length}"
  end

  def to_h
    {
      id: @id,
      name: @name
    }
  end

  def self.from_h(data)
    new(data['id'], data['name'])
  end
end
