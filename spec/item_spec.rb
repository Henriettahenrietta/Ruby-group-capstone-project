require 'date'
require_relative '../classes/item'

RSpec.describe Item do
  describe '#initialize' do
    it 'parses publish_date string into Date' do
      item = Item.new('2020-01-15')

      expect(item.publish_date).to eq(Date.parse('2020-01-15'))
      expect(item.archived).to be(false)
      expect(item.id).to be_a(Integer)
    end

    it 'sets archived to true when passed as keyword argument' do
      item = Item.new('2019-05-10', archived: true)

      expect(item.archived).to be(true)
    end

    it 'sets publish_date to nil for invalid date string' do
      item = Item.new('invalid-date')

      expect(item.publish_date).to be_nil
    end
  end

  describe '#move_to_archive' do
    it 'archives item older than 10 years' do
      old_date = (Date.today << (12 * 11)).to_s
      item = Item.new(old_date)

      item.move_to_archive

      expect(item.archived).to be(true)
    end

    it 'does not archive recent item' do
      recent_date = Date.today.to_s
      item = Item.new(recent_date)

      item.move_to_archive

      expect(item.archived).to be(false)
    end
  end

  describe 'private #can_be_archived?' do
    it 'returns true for items older than 10 years' do
      old_date = (Date.today << (12 * 11)).to_s
      item = Item.new(old_date)

      expect(item.send(:can_be_archived?)).to be(true)
    end

    it 'returns false for recent items' do
      item = Item.new(Date.today.to_s)

      expect(item.send(:can_be_archived?)).to be(false)
    end
  end
end