require_relative '../genre'

RSpec.describe Genre do
  describe '#initialize' do
    it 'creates a genre with id and name' do
      genre = Genre.new(1, 'Fiction')
      
      expect(genre.id).to eq(1)
      expect(genre.name).to eq('Fiction')
    end
  end

  describe '#to_h' do
    it 'returns a hash representation' do
      genre = Genre.new(1, 'Fiction')
      
      expect(genre.to_h).to eq({ id: 1, name: 'Fiction' })
    end
  end

  describe '.from_h' do
    it 'creates a genre from hash' do
      hash = { 'id' => 1, 'name' => 'Fiction' }
      genre = Genre.from_h(hash)
      
      expect(genre.id).to eq(1)
      expect(genre.name).to eq('Fiction')
    end
  end
end