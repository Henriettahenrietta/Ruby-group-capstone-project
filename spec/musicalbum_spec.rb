require_relative '../classes/musicalbum'
require 'date'

RSpec.describe MusicAlbum do
  describe 'inheritance' do
    it 'inherits from Item class' do
      album = MusicAlbum.new(1, 'Album', 'Artist', 1, '2020-01-01')
      
      expect(album).to be_an_instance_of(MusicAlbum)
      expect(album).to be_a(Item)
    end
  end

  describe '#initialize' do
    it 'creates a music album with all properties' do
      album = MusicAlbum.new(1, 'Album', 'Artist', 1, '2020-01-01', true, false)
      
      expect(album.id).to eq(1)
      expect(album.title).to eq('Album')
      expect(album.artist).to eq('Artist')
      expect(album.genre_id).to eq(1)
      expect(album.publish_date).to eq('2020-01-01')
      expect(album.on_spotify).to be(true)
      expect(album.archived).to be(false)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if old and on spotify' do
      old_date = (Date.today - (365 * 11)).to_s
      album = MusicAlbum.new(1, 'Album', 'Artist', 1, old_date, true)
      
      expect(album.can_be_archived?).to be(true)
    end

    it 'returns false if old but not on spotify' do
      old_date = (Date.today - (365 * 11)).to_s
      album = MusicAlbum.new(1, 'Album', 'Artist', 1, old_date, false)
      
      expect(album.can_be_archived?).to be(false)
    end

    it 'returns false if recent even if on spotify' do
      recent_date = (Date.today - 365).to_s
      album = MusicAlbum.new(1, 'Album', 'Artist', 1, recent_date, true)
      
      expect(album.can_be_archived?).to be(false)
    end
  end

  describe '#display' do
    it 'returns formatted string' do
      album = MusicAlbum.new(1, 'Album', 'Artist', 1, '2020-01-01', true, false)
      
      expect(album.display).to include('[ACTIVE]')
      expect(album.display).to include('Album')
      expect(album.display).to include('Artist')
    end
  end
end