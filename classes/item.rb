require 'date'

class Item
  attr_accessor :publish_date
  attr_reader :id, :archived, :label, :author, :genre

  def initialize(publish_date, archived: false)
    @publish_date = parse_publish_date(publish_date)
    @archived = archived
    @id = Random.rand(1...1000)
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.nil? || genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items << self unless author.nil? || author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items << self unless label.nil? || label.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def parse_publish_date(value)
    return value if value.is_a?(Date)
    return Date.parse(value) if value.is_a?(String)

    nil
  rescue Date::Error
    nil
  end

  def can_be_archived?
    return false if @publish_date.nil?

    (Date.today.year - @publish_date.year) > 10
  end
end
