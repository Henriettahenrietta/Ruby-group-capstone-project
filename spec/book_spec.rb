require_relative '../book'
require_relative '../item'
require 'date'

RSpec.describe Book do
  describe 'inheritance' do
    it 'inherits from Item class' do
      book = Book.new(1, 'The Hobbit', 'J.R.R. Tolkien', 'Allen & Unwin', '2015-01-01')
      
      expect(book).to be_an_instance_of(Book)
      expect(book).to be_a(Item)
    end

    it 'has all Item properties' do
      book = Book.new(1, 'The Hobbit', 'J.R.R. Tolkien', 'Allen & Unwin', '2015-01-01')
      
      expect(book).to respond_to(:id)
      expect(book).to respond_to(:publish_date)
      expect(book).to respond_to(:archived)
    end
  end

  describe '#initialize' do
    context 'with all parameters' do
      it 'creates a book with all properties' do
        book = Book.new(
          1,
          'The Great Gatsby',
          'F. Scott Fitzgerald',
          'Scribner',
          '2020-01-15',
          'good',
          5,
          false
        )
        
        expect(book.id).to eq(1)
        expect(book.title).to eq('The Great Gatsby')
        expect(book.author).to eq('F. Scott Fitzgerald')
        expect(book.publisher).to eq('Scribner')
        expect(book.publish_date).to eq('2020-01-15')
        expect(book.cover_state).to eq('good')
        expect(book.label_id).to eq(5)
        expect(book.archived).to be(false)
      end
    end

    context 'with minimal parameters' do
      it 'creates a book with default cover_state' do
        book = Book.new(2, 'To Kill a Mockingbird', 'Harper Lee', 'Lippincott', '2021-06-20')
        
        expect(book.cover_state).to eq('good')
      end

      it 'creates a book with default label_id as nil' do
        book = Book.new(3, '1984', 'George Orwell', 'Secker & Warburg', '2019-05-10')
        
        expect(book.label_id).to be_nil
      end

      it 'creates a book with default archived status as false' do
        book = Book.new(4, 'Brave New World', 'Aldous Huxley', 'Chatto & Windus', '2018-03-01')
        
        expect(book.archived).to be(false)
      end
    end

    context 'with different cover states' do
      it 'accepts "good" as cover state' do
        book = Book.new(1, 'Test Book', 'Author', 'Publisher', '2020-01-01', 'good')
        expect(book.cover_state).to eq('good')
      end

      it 'accepts "acceptable" as cover state' do
        book = Book.new(1, 'Test Book', 'Author', 'Publisher', '2020-01-01', 'acceptable')
        expect(book.cover_state).to eq('acceptable')
      end

      it 'accepts "damaged" as cover state' do
        book = Book.new(1, 'Test Book', 'Author', 'Publisher', '2020-01-01', 'damaged')
        expect(book.cover_state).to eq('damaged')
      end

      it 'accepts "bad" as cover state' do
        book = Book.new(1, 'Test Book', 'Author', 'Publisher', '2020-01-01', 'bad')
        expect(book.cover_state).to eq('bad')
      end
    end
  end

  describe '#can_be_archived?' do
    context 'when conditions are met' do
      it 'returns true if item is old (>10 years) regardless of cover' do
        old_date = (Date.today - (365 * 11)).to_s # 11 years ago
        book = Book.new(1, 'Old Book', 'Author', 'Publisher', old_date, 'damaged')
        
        expect(book.can_be_archived?).to be(true)
      end

      it 'returns true if cover is bad regardless of age' do
        recent_date = (Date.today - 365).to_s # 1 year ago
        book = Book.new(1, 'Recent Book', 'Author', 'Publisher', recent_date, 'bad')
        
        expect(book.can_be_archived?).to be(true)
      end

      it 'returns true if item is very old and cover is bad' do
        very_old_date = '2000-01-01'
        book = Book.new(1, 'Very Old Book', 'Author', 'Publisher', very_old_date, 'bad')
        
        expect(book.can_be_archived?).to be(true)
      end
    end

    context 'when conditions are not met' do
      it 'returns false if book is recent and cover is good' do
        recent_date = (Date.today - 365).to_s # 1 year ago
        book = Book.new(1, 'Recent Book', 'Author', 'Publisher', recent_date, 'good')
        
        expect(book.can_be_archived?).to be(false)
      end

      it 'returns false if book is recent and cover is acceptable' do
        recent_date = (Date.today - (365 * 5)).to_s # 5 years ago
        book = Book.new(1, 'Recent Book', 'Author', 'Publisher', recent_date, 'acceptable')
        
        expect(book.can_be_archived?).to be(false)
      end

      it 'returns false if book is 9 years old and cover is good' do
        nine_years_ago = (Date.today - (365 * 9)).to_s
        book = Book.new(1, 'Nine Year Book', 'Author', 'Publisher', nine_years_ago, 'good')
        
        expect(book.can_be_archived?).to be(false)
        
        expect(book.can_be_archived?).to be(false)
      end
    end

    context 'override behavior' do
      it 'overrides parent can_be_archived? to allow archiving bad covers even if recent' do
        recent_date = (Date.today - 365).to_s # 1 year ago
        item = Item.new(1, recent_date)
        book = Book.new(1, 'Book', 'Author', 'Pub', recent_date, 'bad')
        
        expect(item.can_be_archived?).to be(false)
        expect(book.can_be_archived?).to be(true)
      end
    end
  end

  describe '#display' do
    it 'returns formatted string for active book' do
      book = Book.new(1, 'The Hobbit', 'J.R.R. Tolkien', 'Allen & Unwin', '2015-01-01', 'good', nil, false)
      
      display = book.display
      
      expect(display).to include('[ACTIVE]')
      expect(display).to include('1')
      expect(display).to include('The Hobbit')
      expect(display).to include('J.R.R. Tolkien')
      expect(display).to include('Allen & Unwin')
      expect(display).to include('good')
    end

    it 'returns formatted string for archived book' do
      book = Book.new(2, '1984', 'George Orwell', 'Secker & Warburg', '2020-01-01', 'good', nil, true)
      
      display = book.display
      
      expect(display).to include('[ARCHIVED]')
      expect(display).to include('1984')
      expect(display).to include('George Orwell')
    end

    it 'includes all book information in display' do
      book = Book.new(5, 'Pride and Prejudice', 'Jane Austen', 'T. Egerton', '2019-06-15', 'acceptable')
      
      display = book.display
      
      expect(display).to include('ID: 5')
      expect(display).to include('Pride and Prejudice')
      expect(display).to include('by Jane Austen')
      expect(display).to include('Publisher: T. Egerton')
      expect(display).to include('Cover: acceptable')
    end
  end

  describe '#to_h' do
    it 'converts book to hash with all properties' do
      book = Book.new(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', '2020-01-15', 'good', 5, false)
      
      hash = book.to_h
      
      expect(hash).to be_a(Hash)
      expect(hash[:id]).to eq(1)
      expect(hash[:title]).to eq('The Great Gatsby')
      expect(hash[:author]).to eq('F. Scott Fitzgerald')
      expect(hash[:publisher]).to eq('Scribner')
      expect(hash[:publish_date]).to eq('2020-01-15')
      expect(hash[:cover_state]).to eq('good')
      expect(hash[:label_id]).to eq(5)
      expect(hash[:archived]).to be(false)
    end

    it 'includes inherited Item properties in hash' do
      book = Book.new(2, 'Test', 'Author', 'Pub', '2020-01-01', 'good', nil, true)
      
      hash = book.to_h
      
      expect(hash.keys).to include(:id, :publish_date, :archived)
    end

    it 'includes book-specific properties in hash' do
      book = Book.new(3, 'Test Book', 'Author', 'Publisher', '2020-01-01')
      
      hash = book.to_h
      
      expect(hash.keys).to include(:title, :author, :publisher, :cover_state, :label_id)
    end

    it 'preserves nil values for optional properties' do
      book = Book.new(1, 'Test', 'Author', 'Pub', '2020-01-01', 'good', nil)
      
      hash = book.to_h
      
      expect(hash[:label_id]).to be_nil
    end
  end

  describe '.from_h' do
    it 'creates Book instance from hash' do
      data = {
        'id' => 1,
        'title' => 'The Hobbit',
        'author' => 'J.R.R. Tolkien',
        'publisher' => 'Allen & Unwin',
        'publish_date' => '2015-01-01',
        'cover_state' => 'good',
        'label_id' => 2,
        'archived' => false
      }
      
      book = Book.from_h(data)
      
      expect(book.id).to eq(1)
      expect(book.title).to eq('The Hobbit')
      expect(book.author).to eq('J.R.R. Tolkien')
      expect(book.publisher).to eq('Allen & Unwin')
      expect(book.publish_date).to eq('2015-01-01')
      expect(book.cover_state).to eq('good')
      expect(book.label_id).to eq(2)
      expect(book.archived).to be(false)
    end

    it 'sets default cover_state if missing' do
      data = {
        'id' => 1,
        'title' => 'Test',
        'author' => 'Author',
        'publisher' => 'Pub',
        'publish_date' => '2020-01-01'
      }
      
      book = Book.from_h(data)
      
      expect(book.cover_state).to eq('good')
    end

    it 'sets nil label_id if missing' do
      data = {
        'id' => 1,
        'title' => 'Test',
        'author' => 'Author',
        'publisher' => 'Pub',
        'publish_date' => '2020-01-01',
        'cover_state' => 'good'
      }
      
      book = Book.from_h(data)
      
      expect(book.label_id).to be_nil
    end

    it 'sets archived to false if missing' do
      data = {
        'id' => 1,
        'title' => 'Test',
        'author' => 'Author',
        'publisher' => 'Pub',
        'publish_date' => '2020-01-01'
      }
      
      book = Book.from_h(data)
      
      expect(book.archived).to be(false)
    end
  end
end
