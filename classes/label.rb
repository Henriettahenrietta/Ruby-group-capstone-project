class Label
  attr_accessor :id, :title, :color
  attr_reader :items

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    unless @items.include?(item)
      @items << item
      item.label = self
      true
    else
      false
    end
  end

  def remove_item(item)
    @items.delete(item) ? true : false
  end

  def item_count
    @items.length
  end

  def display
    "ID: #{@id} | Title: #{@title} | Color: #{@color} | Items: #{@items.length}"
  end

  def to_h
    {
      id: @id,
      title: @title,
      color: @color
    }
  end

  def self.from_h(data)
    new(data['id'], data['title'], data['color'])
  end
end
