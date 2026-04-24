# frozen_string_literal: true

class Label
  attr_accessor :id, :title, :color
  attr_reader :items

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  # Associate an item with this label
  def add_item(item)
    return false if @items.include?(item)

    @items << item
    item.label = self
    true
  end

  # Remove an item from this label
  def remove_item(item)
    @items.delete(item) ? true : false
  end

  # Count of items attached to this label
  def item_count
    @items.length
  end

  # Format label details for console display
  def display
    "ID: #{@id} | Title: #{@title} | Color: #{@color} | Items: #{@items.length}"
  end

  # Convert label fields to a JSON-ready hash
  def to_h
    {
      id: @id,
      title: @title,
      color: @color
    }
  end

  # Build a Label from persisted JSON data
  def self.from_h(data)
    new(data['id'], data['title'], data['color'])
  end
end
