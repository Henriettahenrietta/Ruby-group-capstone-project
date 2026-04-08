require_relative '../classes/label'
require_relative '../classes/item'
require_relative '../classes/book'

RSpec.describe Label do
  describe '#initialize' do
    context 'with valid parameters' do
      it 'creates a label with id, title, and color' do
        label = Label.new(1, 'Fiction', 'red')
        
        expect(label.id).to eq(1)
        expect(label.title).to eq('Fiction')
        expect(label.color).to eq('red')
      end

      it 'initializes with empty items array' do
        label = Label.new(1, 'Classics', 'blue')
        
        expect(label.items).to be_an(Array)
        expect(label.items).to be_empty
      end

      it 'creates multiple labels with different colors' do
        label1 = Label.new(1, 'Adventure', 'green')
        label2 = Label.new(2, 'Mystery', 'purple')
        label3 = Label.new(3, 'Romance', 'pink')
        
        expect(label1.color).to eq('green')
        expect(label2.color).to eq('purple')
        expect(label3.color).to eq('pink')
      end
    end

    context 'with different color values' do
      it 'accepts red as color' do
        label = Label.new(1, 'Test', 'red')
        expect(label.color).to eq('red')
      end

      it 'accepts blue as color' do
        label = Label.new(2, 'Test', 'blue')
        expect(label.color).to eq('blue')
      end

      it 'accepts green as color' do
        label = Label.new(3, 'Test', 'green')
        expect(label.color).to eq('green')
      end

      it 'accepts custom color strings' do
        label = Label.new(4, 'Test', 'custom_color')
        expect(label.color).to eq('custom_color')
      end
    end
  end

  describe '#add_item' do
    context 'when adding a valid item' do
      it 'adds an item to the label' do
        label = Label.new(1, 'Fiction', 'red')
        item = Item.new(1, '2020-01-01')
        
        result = label.add_item(item)
        
        expect(label.items).to include(item)
      end

      it 'returns true when successfully adding an item' do
        label = Label.new(1, 'Fiction', 'red')
        item = Item.new(1, '2020-01-01')
        
        result = label.add_item(item)
        
        expect(result).to be(true)
      end

      it 'adds multiple items to the label' do
        label = Label.new(1, 'Fiction', 'red')
        item1 = Item.new(1, '2020-01-01')
        item2 = Item.new(2, '2019-05-10')
        
        label.add_item(item1)
        label.add_item(item2)
        
        expect(label.items.length).to eq(2)
        expect(label.items).to include(item1, item2)
      end

      it 'can add books to a label' do
        label = Label.new(1, 'Classics', 'blue')
        book = Book.new(1, 'The Hobbit', 'J.R.R. Tolkien', 'Allen & Unwin', '2015-01-01')
        
        result = label.add_item(book)
        
        expect(result).to be(true)
        expect(label.items).to include(book)
      end
    end

    context 'when adding duplicate items' do
      it 'returns false when trying to add the same item twice' do
        label = Label.new(1, 'Fiction', 'red')
        item = Item.new(1, '2020-01-01')
        
        label.add_item(item)
        result = label.add_item(item)
        
        expect(result).to be(false)
      end

      it 'does not add duplicate item to items array' do
        label = Label.new(1, 'Fiction', 'red')
        item = Item.new(1, '2020-01-01')
        
        label.add_item(item)
        label.add_item(item)
        
        expect(label.items.length).to eq(1)
      end

      it 'prevents duplicates by object reference' do
        label = Label.new(1, 'Fiction', 'red')
        item = Item.new(1, '2020-01-01')
        
        label.add_item(item)
        duplicate = item
        result = label.add_item(duplicate)
        
        expect(result).to be(false)
        expect(label.items.count(item)).to eq(1)
      end
    end
  end

  describe '#remove_item' do
    context 'when removing an existing item' do
      it 'removes an item from the label' do
        label = Label.new(1, 'Fiction', 'red')
        item = Item.new(1, '2020-01-01')
        
        label.add_item(item)
        result = label.remove_item(item)
        
        expect(label.items).not_to include(item)
      end

      it 'returns true when successfully removing an item' do
        label = Label.new(1, 'Fiction', 'red')
        item = Item.new(1, '2020-01-01')
        
        label.add_item(item)
        result = label.remove_item(item)
        
        expect(result).to be(true)
      end

      it 'removes correct item when multiple items exist' do
        label = Label.new(1, 'Fiction', 'red')
        item1 = Item.new(1, '2020-01-01')
        item2 = Item.new(2, '2019-05-10')
        item3 = Item.new(3, '2018-03-15')
        
        label.add_item(item1)
        label.add_item(item2)
        label.add_item(item3)
        
        label.remove_item(item2)
        
        expect(label.items).to include(item1, item3)
        expect(label.items).not_to include(item2)
      end
    end

    context 'when trying to remove non-existent item' do
      it 'returns false when item is not in label' do
        label = Label.new(1, 'Fiction', 'red')
        item1 = Item.new(1, '2020-01-01')
        item2 = Item.new(2, '2019-05-10')
        
        label.add_item(item1)
        result = label.remove_item(item2)
        
        expect(result).to be(false)
      end

      it 'does not modify items when removing non-existent item' do
        label = Label.new(1, 'Fiction', 'red')
        item1 = Item.new(1, '2020-01-01')
        item2 = Item.new(2, '2019-05-10')
        
        label.add_item(item1)
        label.remove_item(item2)
        
        expect(label.items.length).to eq(1)
        expect(label.items).to include(item1)
      end

      it 'returns false when removing from empty label' do
        label = Label.new(1, 'Fiction', 'red')
        item = Item.new(1, '2020-01-01')
        
        result = label.remove_item(item)
        
        expect(result).to be(false)
      end
    end
  end

  describe '#item_count' do
    it 'returns 0 for empty label' do
      label = Label.new(1, 'Fiction', 'red')
      
      expect(label.item_count).to eq(0)
    end

    it 'returns correct count after adding items' do
      label = Label.new(1, 'Fiction', 'red')
      item1 = Item.new(1, '2020-01-01')
      item2 = Item.new(2, '2019-05-10')
      item3 = Item.new(3, '2018-03-15')
      
      label.add_item(item1)
      label.add_item(item2)
      label.add_item(item3)
      
      expect(label.item_count).to eq(3)
    end

    it 'decreases count after removing an item' do
      label = Label.new(1, 'Fiction', 'red')
      item1 = Item.new(1, '2020-01-01')
      item2 = Item.new(2, '2019-05-10')
      
      label.add_item(item1)
      label.add_item(item2)
      expect(label.item_count).to eq(2)
      
      label.remove_item(item1)
      expect(label.item_count).to eq(1)
    end

    it 'reflects accurate count with book items' do
      label = Label.new(1, 'Classics', 'blue')
      book1 = Book.new(1, 'Book1', 'Author1', 'Pub1', '2020-01-01')
      book2 = Book.new(2, 'Book2', 'Author2', 'Pub2', '2019-01-01')
      
      label.add_item(book1)
      label.add_item(book2)
      
      expect(label.item_count).to eq(2)
    end
  end

  describe '#display' do
    it 'returns formatted string with label information' do
      label = Label.new(1, 'Fiction', 'red')
      
      display = label.display
      
      expect(display).to include('ID: 1')
      expect(display).to include('Title: Fiction')
      expect(display).to include('Color: red')
      expect(display).to include('Items: 0')
    end

    it 'includes item count in display' do
      label = Label.new(2, 'Classics', 'blue')
      item1 = Item.new(1, '2020-01-01')
      item2 = Item.new(2, '2019-05-10')
      
      label.add_item(item1)
      label.add_item(item2)
      
      display = label.display
      
      expect(display).to include('Items: 2')
    end

    it 'displays all label properties' do
      label = Label.new(5, 'Mystery', 'purple')
      
      display = label.display
      
      expect(display).to include('5')
      expect(display).to include('Mystery')
      expect(display).to include('purple')
    end

    it 'updates item count in display after changes' do
      label = Label.new(1, 'Adventure', 'green')
      item = Item.new(1, '2020-01-01')
      
      display1 = label.display
      expect(display1).to include('Items: 0')
      
      label.add_item(item)
      display2 = label.display
      expect(display2).to include('Items: 1')
    end
  end

  describe '#to_h' do
    it 'converts label to hash with all properties' do
      label = Label.new(1, 'Fiction', 'red')
      
      hash = label.to_h
      
      expect(hash).to be_a(Hash)
      expect(hash[:id]).to eq(1)
      expect(hash[:title]).to eq('Fiction')
      expect(hash[:color]).to eq('red')
    end

    it 'includes all necessary keys in hash' do
      label = Label.new(2, 'Classics', 'blue')
      
      hash = label.to_h
      
      expect(hash.keys).to include(:id, :title, :color)
    end

    it 'does not include items array in hash' do
      label = Label.new(1, 'Fiction', 'red')
      item = Item.new(1, '2020-01-01')
      label.add_item(item)
      
      hash = label.to_h
      
      expect(hash.keys).not_to include(:items)
    end

    it 'hash values match label properties' do
      label = Label.new(5, 'Mystery', 'purple')
      
      hash = label.to_h
      
      expect(hash[:id]).to eq(label.id)
      expect(hash[:title]).to eq(label.title)
      expect(hash[:color]).to eq(label.color)
    end
  end

  describe '.from_h' do
    it 'creates Label instance from hash' do
      data = {
        'id' => 1,
        'title' => 'Fiction',
        'color' => 'red'
      }
      
      label = Label.from_h(data)
      
      expect(label.id).to eq(1)
      expect(label.title).to eq('Fiction')
      expect(label.color).to eq('red')
    end

    it 'creates label with empty items array' do
      data = {
        'id' => 2,
        'title' => 'Classics',
        'color' => 'blue'
      }
      
      label = Label.from_h(data)
      
      expect(label.items).to be_empty
    end

    it 'creates multiple labels from hashes' do
      data1 = { 'id' => 1, 'title' => 'Fiction', 'color' => 'red' }
      data2 = { 'id' => 2, 'title' => 'Classics', 'color' => 'blue' }
      
      label1 = Label.from_h(data1)
      label2 = Label.from_h(data2)
      
      expect(label1.title).to eq('Fiction')
      expect(label2.title).to eq('Classics')
    end
  end
end
