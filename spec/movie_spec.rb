require 'date'
require_relative '../classes/movie'

RSpec.describe Movie do
  describe '#initialize' do
    it 'creates movie from legacy positional args' do
      movie = Movie.new(1, 'Metropolis', '2010-01-01', true, 2, 3, 4, 5, false)

      expect(movie.id).to eq(1)
      expect(movie.title).to eq('Metropolis')
      expect(movie.publish_date).to eq(Date.parse('2010-01-01'))
      expect(movie.silent).to be(true)
      expect(movie.archived).to be(false)
    end

    it 'creates movie from options hash' do
      movie = Movie.new(7, 'Nosferatu', '2000-01-01', true, archived: true)

      expect(movie.id).to eq(7)
      expect(movie.archived).to be(true)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true when silent is true' do
      movie = Movie.new(1, 'Silent Film', Date.today.to_s, true)

      expect(movie.can_be_archived?).to be(true)
    end
  end

  describe '.from_h' do
    it 'builds movie from hash data' do
      data = {
        'id' => 9,
        'title' => 'City Lights',
        'publish_date' => '2012-03-01',
        'silent' => true,
        'genre_id' => 1,
        'author_id' => 2,
        'source_id' => 3,
        'label_id' => 4,
        'archived' => false
      }

      movie = Movie.from_h(data)

      expect(movie.id).to eq(9)
      expect(movie.title).to eq('City Lights')
      expect(movie.genre_id).to eq(1)
    end
  end
end