# frozen_string_literal: true

require_relative '../source'

RSpec.describe Source do
  describe '#initialize' do
    it 'creates a source with id and name' do
      source = Source.new(1, 'Online')

      expect(source.id).to eq(1)
      expect(source.name).to eq('Online')
    end
  end

  describe '#to_h' do
    it 'returns a hash representation' do
      source = Source.new(1, 'Online')

      expect(source.to_h).to eq({ id: 1, name: 'Online' })
    end
  end

  describe '.from_h' do
    it 'creates a source from hash' do
      hash = { 'id' => 1, 'name' => 'Online' }
      source = Source.from_h(hash)

      expect(source.id).to eq(1)
      expect(source.name).to eq('Online')
    end
  end
end
