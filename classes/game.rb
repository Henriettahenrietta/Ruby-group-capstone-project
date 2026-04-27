# classes/game.rb
require_relative 'item'

class Game < Item
  attr_accessor :title, :author_id, :genre_id, :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date, id = rand(1..1000), archived: false)
    super(publish_date, id, archived:)

    @multiplayer = multiplayer
    @last_played_at = last_played_at

    @title = nil
    @author_id = nil
    @genre_id = nil
  end

  def can_be_archived?
    super && older_than_2_years?
  end

  private

  def older_than_2_years?
    return false unless @last_played_at

    Date.parse(@last_played_at) < Date.today << 24
  end
end
