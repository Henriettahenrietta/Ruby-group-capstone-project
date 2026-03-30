# Book class inheriting from Item with additional book-specific properties
require_relative 'item'

class Book < Item
  attr_accessor :title, :author, :publisher, :cover_state, :label_id

  # Here is my Constructor for Book
  # @param id [Integer] Unique identifier
  # @param title [String] Title of the book
  # @param author [String] Author of the book
  # @param publisher [String] Publisher of the book
  # @param publish_date [String] Date of publication (format: YYYY-MM-DD)
  # @param cover_state [String] State of the cover (e.g., "good", "bad", "damaged")
  # @param label_id [Integer] ID of associated label (optional)
  # @param archived [Boolean] Whether the book is archived (default: false)
  def initialize(id, title, author, publisher, publish_date, cover_state = 'good', label_id = nil, archived = false)
    super(id, publish_date, archived)
    @title = title
    @author = author
    @publisher = publisher
    @cover_state = cover_state
    @label_id = label_id
  end

  # Override can_be_archived? to add book-specific logic
  # A book can only be archived if it's published and has a good/acceptable cover state
  # @return [Boolean] true if book meets archiving conditions
  def can_be_archived?
    super && (@cover_state == 'good' || @cover_state == 'acceptable')
  end

  # Display book information in a formatted way
  # @return [String] Formatted book information
  def display
    status = @archived ? "[ARCHIVED]" : "[ACTIVE]"
    "#{status} ID: #{@id} | #{@title} by #{@author} | Publisher: #{@publisher} | Cover: #{@cover_state}"
  end

  # Convert book to hash for JSON serialization
  # @return [Hash] Book data as hash
  def to_h
    super.merge({
      title: @title,
      author: @author,
      publisher: @publisher,
      cover_state: @cover_state,
      label_id: @label_id
    })
  end

  # Create Book instance from hash (for loading from JSON)
  # @param data [Hash] Book data
  # @return [Book] New Book instance
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
