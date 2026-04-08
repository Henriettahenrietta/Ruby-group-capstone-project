require_relative '../classes/game'
require 'date'

RSpec.describe Game do
  describe 'inheritance' do
    it 'inherits from Item class' do
      game = Game.new(1, 'Game', 1, 1, '2020-01-01')
      
      expect(game).to be_an_instance_of(Game)
      expect(game).to be_a(Item)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if old and not multiplayer' do
      old_date = (Date.today - (365 * 11)).to_s
      game = Game.new(1, 'Game', 1, 1, old_date, false)
      
      expect(game.can_be_archived?).to be(true)
    end

    it 'returns false if old but multiplayer' do
      old_date = (Date.today - (365 * 11)).to_s
      game = Game.new(1, 'Game', 1, 1, old_date, true)
      
      expect(game.can_be_archived?).to be(false)
    end
  end
end