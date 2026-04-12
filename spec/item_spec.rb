require_relative '../classes/item'
require 'date'

RSpec.describe Item do
  describe '#initialize' do
    context 'with valid parameters' do
      it 'creates an item with id, publish_date, and archived status' do
        item = Item.new(1, '2020-01-15')
        
        expect(item.id).to eq(1)
        expect(item.publish_date).to eq(Date.parse('2020-01-15'))
        expect(item.archived).to eq(false)
      end

      it 'sets archived to true when explicitly provided' do
        item = Item.new(2, '2019-05-10', archived: true)
        
        expect(item.archived).to eq(true)
      end

      it 'defaults archived to false when not provided' do
        item = Item.new(3, '2021-12-25')
        
        expect(item.archived).to be(false)
      end
    end

    context 'with edge cases' do
      it 'accepts different date formats' do
        item = Item.new(4, '2015-01-01')
        
        expect(item.publish_date).to eq(Date.parse('2015-01-01'))
      end
    end
  end

  describe '#can_be_archived?' do
    context 'when item is published more than 1 day ago' do
      it 'returns true for items published in the past' do
        old_date = (Date.today - 365*15).to_s # 15 years ago
        item = Item.new(1, old_date)
        
        expect(item.can_be_archived?).to be(true)
      end

      it 'returns true for items published years ago' do
        very_old_date = (Date.today - 365*25).to_s # 25 years ago
        item = Item.new(1, very_old_date)
        
        expect(item.can_be_archived?).to be(true)
      end
    end

    context 'when item is published recently' do
      it 'returns false for items published today' do
        today = Date.today.to_s
        item = Item.new(1, today)
        
        expect(item.can_be_archived?).to be(false)
      end

      it 'returns false for items published yesterday' do
        yesterday = (Date.today - 1).to_s
        item = Item.new(1, yesterday)
        
        expect(item.can_be_archived?).to be(false)
        
        item2 = Item.new(2, (Date.today - 365*11).to_s)
        expect(item2.can_be_archived?).to be(true)
      end

      it 'returns true for items published exactly 1 day ago' do
        one_day_ago = '2015-01-01'
        item = Item.new(1, one_day_ago)
        
        # Days since publish should be >= 1
        expect(item.can_be_archived?).to be(true)
      end
    end
  end

  describe '#move_to_archive!' do
    context 'when item can be archived' do
      it 'changes archived status to true' do
        old_date = '2010-01-01'
        item = Item.new(1, old_date, archived: false)
        
        item.move_to_archive!
        
        expect(item.archived).to be(true)
      end

      it 'returns true when successfully archived' do
        old_date = '2010-01-01'
        item = Item.new(1, old_date)
        
        result = item.move_to_archive!
        
        expect(result).to be(true)
      end
    end

    context 'when item cannot be archived' do
      it 'returns false if item is already archived' do
        old_date = '2010-01-01'
        item = Item.new(1, old_date, archived: true)
        
        result = item.move_to_archive!
        
        expect(result).to be(false)
      end

      it 'returns false if publish date is too recent' do
        recent_date = Date.today.to_s
        item = Item.new(1, recent_date)
        
        result = item.move_to_archive!
        
        expect(result).to be(false)
      end

      it 'does not change archived status if cannot be archived' do
        recent_date = Date.today.to_s
        item = Item.new(1, recent_date, archived: false)
        
        item.move_to_archive!
        
        expect(item.archived).to be(false)
      end
    end

    context 'edge cases' do
      it 'returns false when called twice on the same item' do
        old_date = '2010-01-01'
        item = Item.new(1, old_date)
        
        first_call = item.move_to_archive!
        second_call = item.move_to_archive!
        
        expect(first_call).to be(true)
        expect(second_call).to be(false)
      end
    end
  end

  describe '#to_h' do
    it 'converts item to hash with all properties' do
      item = Item.new(5, '2020-06-15', archived: false)
      
      hash = item.to_h
      
      expect(hash).to be_a(Hash)
      expect(hash[:id]).to eq(5)
      expect(hash[:publish_date]).to eq('2020-06-15')
      expect(hash[:archived]).to be(false)
    end

    it 'includes archived status in hash' do
      item = Item.new(1, '2019-01-01', archived: true)
      hash = item.to_h
      
      expect(hash[:archived]).to be(true)
    end

    it 'returns a hash with all necessary keys' do
      item = Item.new(10, '2021-03-10')
      hash = item.to_h
      
      expect(hash.keys).to include(:id, :publish_date, :archived)
    end
  end
end
