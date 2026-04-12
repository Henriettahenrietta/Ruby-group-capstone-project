require 'date'

class Item
  attr_accessor :date, :publish_date, :id
  attr_reader :archived, :label, :author, :genre

  def initialize(id = Random.rand(1...1000), publish_date, archived: false)
    @id = id
    @publish_date = begin
      (Date.parse(publish_date) if publish_date.is_a?(String))
    rescue Date::Error
      nil
    end

    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.nil? || genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.nil? || author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.nil? || label.items.include?(self)
  end

  def move_to_archive
    if can_be_archived? && !@archived
      @archived = true
      true
    else
      false
    end
  end

  def can_be_archived?
    (Date.today - @publish_date).to_i > 3650
  end

  def to_h
    {
      id: @id,
      publish_date: @publish_date.to_s,
      archived: @archived
    }
  end

  private
end
