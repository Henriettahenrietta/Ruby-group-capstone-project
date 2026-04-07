require_relative '../author'

RSpec.describe Author do
  describe '#initialize' do
    it 'creates an author with id, first_name, last_name' do
      author = Author.new(1, 'John', 'Doe')
      
      expect(author.id).to eq(1)
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
    end
  end

  describe '#to_h' do
    it 'returns a hash representation' do
      author = Author.new(1, 'John', 'Doe')
      
      expect(author.to_h).to eq({ id: 1, first_name: 'John', last_name: 'Doe' })
    end
  end

  describe '.from_h' do
    it 'creates an author from hash' do
      hash = { 'id' => 1, 'first_name' => 'John', 'last_name' => 'Doe' }
      author = Author.from_h(hash)
      
      expect(author.id).to eq(1)
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
    end
  end
end