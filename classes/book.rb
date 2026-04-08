require_relative 'item'

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

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def display
    status = @archived ? "[ARCHIVED]" : "[ACTIVE]"
    "#{status} ID: #{@id} | #{@title} by #{@author} | Publisher: #{@publisher} | Cover: #{@cover_state}"
  end

  def to_h
    super.merge({
      title: @title,
      author: @author,
      publisher: @publisher,
      cover_state: @cover_state,
      label_id: @label_id
    })
  end

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
