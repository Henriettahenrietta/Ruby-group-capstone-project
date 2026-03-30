# Label class for organizing and categorizing items
class Label
  attr_accessor :id, :title, :color
  attr_reader :items

  # Constructor for Label
  # @param id [Integer] Unique identifier
  # @param title [String] Title/name of the label
  # @param color [String] Color associated with the label (e.g., "red", "blue", "green")
  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = [] # Array to store items associated with this label
  end

  # Add an item to the label
  # @param item [Item] Item to add to the label
  # @return [Boolean] true if successfully added
  def add_item(item)
    unless @items.include?(item)
      @items << item
      true
    else
      false
    end
  end

  # Remove an item from the labels
  # @param item [Item] Item to remove from the label
  # @return [Boolean] true if successfully removed
  def remove_item(item)
    @items.delete(item) ? true : false
  end

  # Get count of items associated with this label
  # @return [Integer] Number of items
  def item_count
    @items.length
  end


  # @return [String] Formatted label information
  def display
    "ID: #{@id} | Title: #{@title} | Color: #{@color} | Items: #{@items.length}"
  end

  # @return [Hash] Label data as hash
  def to_h
    {
      id: @id,
      title: @title,
      color: @color
    }
  end

  # Create Label instance from hash (for loading from JSON)
  # @param data [Hash] Label data
  # @return [Label] New Label instance
  def self.from_h(data)
    new(data['id'], data['title'], data['color'])
  end
end
