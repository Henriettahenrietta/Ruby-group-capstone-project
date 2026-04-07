require_relative '../movie'
require 'date'

RSpec.describe Movie do
  describe 'inheritance' do
    it 'inherits from Item class' do
      movie = Movie.new(1, 'Movie', 'Director', 1, '2020-01-01')
      
      expect(movie).to be_an_instance_of(Movie)
      expect(movie).to be_a(Item)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if old and silent' do
      old_date = (Date.today - (365 * 11)).to_s
      movie = Movie.new(1, 'Movie', 'Director', 1, old_date, true)
      
      expect(movie.can_be_archived?).to be(true)
    end

    it 'returns false if old but not silent' do
      old_date = (Date.today - (365 * 11)).to_s
      movie = Movie.new(1, 'Movie', 'Director', 1, old_date, false)
      
      expect(movie.can_be_archived?).to be(false)
    end
  end
end