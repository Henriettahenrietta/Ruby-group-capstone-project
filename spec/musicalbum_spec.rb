require 'date'
require_relative '../classes/musicalbum'

RSpec.describe MusicAlbum do
  describe '#initialize' do
    it 'creates a music album with all properties' do
      album = MusicAlbum.new('Artist', '2020-01-01', true)

      expect(album.artist).to eq('Artist')
      expect(album.publish_date).to eq(Date.parse('2020-01-01'))
      expect(album.on_spotify).to eq(true)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if old and on spotify' do
      publish_date = Date.today.prev_year(11).strftime('%Y-%m-%d')
      on_spotify = true

      album = MusicAlbum.new('Artist', publish_date, on_spotify)

      expect(album.can_be_archived?).to be true
    end

    it 'returns false if old but not on spotify' do
      publish_date = Date.today.prev_year(11).strftime('%Y-%m-%d')
      on_spotify = false

      album = MusicAlbum.new('Artist', publish_date, on_spotify)

      expect(album.can_be_archived?).to be false
    end

    it 'returns false if recent even if on spotify' do
      publish_date = Date.today.next_year.strftime('%Y-%m-%d')
      on_spotify = true

      album = MusicAlbum.new('Artist', publish_date, on_spotify)

      expect(album.can_be_archived?).to be false
    end
  end

  describe '#display' do
    it 'returns formatted string' do
      album = MusicAlbum.new('Artist', '2020-01-01', true)

      expect(album.display).to include('Artist')
    end
  end
end
