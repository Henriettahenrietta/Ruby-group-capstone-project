require 'date'

class Item
  DAYS_FOR_ARCHIVE = 365 * 10

  attr_accessor :date, :publish_date, :id
  attr_reader :archived, :label, :author, :genre

  def initialize(publish_date, archived: false, id: Random.rand(1...1000))
    @id = id
    @publish_date = if publish_date.is_a?(String)
      begin
        Date.parse(publish_date)
      rescue Date::Error
        nil
      end
    else
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

  def move_to_archive!
    if can_be_archived? && !@archived
      @archived = true
      true
    else
      false
    end
  end

  alias archive move_to_archive!
  alias archive! move_to_archive!

  def can_be_archived?
    return false if @publish_date.nil?

    (Date.today - @publish_date).to_i > DAYS_FOR_ARCHIVE
  end

  def to_h
    {
      id: @id,
      publish_date: @publish_date.to_s,
      archived: @archived
    }
  end
end
