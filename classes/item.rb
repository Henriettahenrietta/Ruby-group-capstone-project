# classes/item.rb
require 'date'

class Item
  attr_accessor :genre, :author, :label, :source, :archived
  attr_reader :id, :publish_date

  def initialize(publish_date, id = rand(1..1000), archived: false)
    @id = id
    @publish_date = parse_date(publish_date)
    @archived = archived

    @genre = nil
    @author = nil
    @label = nil
    @source = nil
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    return false unless @publish_date

    @publish_date < Date.today << 120 # 10 years
  end

  def parse_date(date)
    return date if date.is_a?(Date)
    return Date.parse(date) if date.is_a?(String)

    nil
  rescue ArgumentError
    nil
  end
end
