require_relative 'item'

# Book class represents a book item and inherits archiving behavior from Item
class Book < Item
  attr_accessor :title, :author, :publisher, :cover_state, :label_id

  def initialize(id, title, author, publisher, publish_date, cover_state = 'good', label_id = nil, archived = false)
    super(id, publish_date, archived)
    @title = title
    @author = author
    @publisher = publisher
    @cover_state = cover_state
    @label_id = label_id
  end

  # A book can be archived if the publish date is old enough or the cover is bad
  def can_be_archived?
    super || @cover_state == "bad"
  end

  # Format book details for console display
  def display
    status = @archived ? '[ARCHIVED]' : '[ACTIVE]'
    label_text = @label_id ? "Label ID: #{@label_id}" : 'No label'
    "#{status} ID: #{@id} | #{@title} by #{@author} | Publisher: #{@publisher} | Cover: #{@cover_state} | #{label_text}"
  end

  # Prepare book attributes for JSON serialization
  def to_h
    super.merge(
      title: @title,
      author: @author,
      publisher: @publisher,
      cover_state: @cover_state,
      label_id: @label_id
    )
  end

  # Create a Book instance from a JSON hash
  def self.from_h(data)
    new(
      data['id'],
      data['title'],
      data['author'],
      data['publisher'],
      data['publish_date'],
      data['cover_state'] || 'good',
      data['label_id'],
      data['archived'] || false
    )
  end
end
