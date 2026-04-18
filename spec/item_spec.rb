require_relative '../classes/item'
require 'date'

RSpec.describe Item do
  describe '#initialize' do
    context 'with valid parameters' do
      it 'creates an item with id, publish_date, and archived status' do
        item = Item.new('2020-01-15', archived: false, id: 1)

        expect(item.id).to eq(1)
        expect(item.publish_date).to eq(Date.parse('2020-01-15'))
        expect(item.archived).to eq(false)
      end

      it 'sets archived to true when explicitly provided' do
        item = Item.new('2019-05-10', archived: true, id: 2)

        expect(item.archived).to eq(true)
      end

      it 'defaults archived to false when not provided' do
        item = Item.new('2021-12-25', id: 3)

        expect(item.archived).to be(false)
      end
    end

    context 'with edge cases' do
      it 'accepts different date formats' do
        item = Item.new('2015-01-01', id: 4)

        expect(item.publish_date).to eq(Date.parse('2015-01-01'))
      end
    end
  end

  describe '#can_be_archived?' do
    context 'when item is published more than 1 day ago' do
      it 'returns true for items published in the past' do
        old_date = (Date.today - (365 * 15)).to_s # 15 years ago
        item = Item.new(old_date, id: 1)

        expect(item.can_be_archived?).to be(true)
      end

      it 'returns true for items published years ago' do
        very_old_date = (Date.today - (365 * 25)).to_s # 25 years ago
        item = Item.new(very_old_date, id: 1)

        expect(item.can_be_archived?).to be(true)
      end
    end

    context 'when item is published recently' do
      it 'returns false for items published today' do
        today = Date.today.to_s
        item = Item.new(today, id: 1)

        expect(item.can_be_archived?).to be(false)
      end

      it 'returns false for items published yesterday' do
        yesterday = (Date.today - 1).to_s
        item = Item.new(yesterday, id: 1)

        expect(item.can_be_archived?).to be(false)

        item2 = Item.new((Date.today - (365 * 11)).to_s, id: 2)
        expect(item2.can_be_archived?).to be(true)
      end

      it 'returns false for items published exactly 1 day ago' do
        one_day_ago = (Date.today - 1).to_s
        item = Item.new(one_day_ago, id: 1)

        # Days since publish should be >= 1
        expect(item.can_be_archived?).to be(false)
      end
    end
  end

  describe '#archive!' do
    context 'when item can be archived' do
      it 'changes archived status to true' do
        old_date = '2010-01-01'
        item = Item.new(old_date, archived: false, id: 1)

        item.archive!

        expect(item.archived).to be(true)
      end

      it 'returns true when successfully archived' do
        old_date = '2010-01-01'
        item = Item.new(old_date, id: 1)

        result = item.archive!

        expect(result).to be(true)
      end
    end

    context 'when item cannot be archived' do
      it 'returns false if item is already archived' do
        old_date = '2010-01-01'
        item = Item.new(old_date, archived: true, id: 1)

        result = item.archive!

        expect(result).to be(false)
      end

      it 'returns false if publish date is too recent' do
        recent_date = Date.today.to_s
        item = Item.new(recent_date, id: 1)

        result = item.archive!

        expect(result).to be(false)
      end

      it 'does not change archived status if cannot be archived' do
        recent_date = Date.today.to_s
        item = Item.new(recent_date, archived: false, id: 1)

        item.archive!

        expect(item.archived).to be(false)
      end
    end

    context 'edge cases' do
      it 'returns false when called twice on the same item' do
        old_date = '2010-01-01'
        item = Item.new(old_date, id: 1)

        first_call = item.archive!
        second_call = item.archive!

        expect(first_call).to be(true)
        expect(second_call).to be(false)
      end
    end
  end

  describe '#to_h' do
    it 'converts item to hash with all properties' do
      item = Item.new('2020-06-15', archived: false, id: 5)

      hash = item.to_h

      expect(hash).to be_a(Hash)
      expect(hash[:id]).to eq(5)
      expect(hash[:publish_date]).to eq('2020-06-15')
      expect(hash[:archived]).to be(false)
    end

    it 'includes archived status in hash' do
      item = Item.new('2019-01-01', archived: true, id: 1)
      hash = item.to_h

      expect(hash[:archived]).to be(true)
    end

    it 'returns a hash with all necessary keys' do
      item = Item.new('2021-03-10', id: 10)
      hash = item.to_h

      expect(hash.keys).to include(:id, :publish_date, :archived)
    end
  end
end
