# classes/game.rb
require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date, id: rand(1..1000), archived: false)
    super(publish_date, id:, archived:)

    @multiplayer = multiplayer
    @last_played_at = parse_date(last_played_at)
  end

  def can_be_archived?
    return false if archived
    return false if @last_played_at.nil?

    older_than_2_years = @last_played_at < (Date.today << 24)

    super && older_than_2_years
  end

  private

  def parse_date(date)
    return nil if date.nil?
    return date if date.is_a?(Date)
    return Date.parse(date) if date.is_a?(String)

    nil
  rescue ArgumentError
    nil
  end
end
