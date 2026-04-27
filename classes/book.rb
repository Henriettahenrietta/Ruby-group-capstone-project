require 'date'

class Book
  attr_reader :publisher, :cover_state, :publish_date
  attr_accessor :archived

  def initialize(publisher, cover_state, publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def can_be_archived?
    Date.today.year - @publish_date.year > 10 || @cover_state.downcase == 'bad'
  end
end
