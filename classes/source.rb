require_relative 'item'

class Source
  attr_accessor :id, :name, :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
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
