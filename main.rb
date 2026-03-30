#!/usr/bin/env ruby

require 'json'
require 'date'
require_relative 'item'
require_relative 'book'
require_relative 'label'

# Main application class for managing books and labels
class BookManagementApp
  attr_reader :books, :labels

  BOOKS_FILE = 'books.json'
  LABELS_FILE = 'labels.json'

  def initialize
    @books = []
    @labels = []
    load_data
  end

  # Load data from JSON files
  def load_data
    load_books
    load_labels
    puts "✓ Data loaded successfully!"
  end

  # Load books from JSON file
  def load_books
    if File.exist?(BOOKS_FILE)
      begin
        data = JSON.parse(File.read(BOOKS_FILE))
        @books = data.map { |book_data| Book.from_h(book_data) }
      rescue JSON::ParserError
        puts "Warning: Could not parse books.json"
        @books = []
      end
    else
      @books = []
    end
  end

  # Load labels from JSON file
  def load_labels
    if File.exist?(LABELS_FILE)
      begin
        data = JSON.parse(File.read(LABELS_FILE))
        @labels = data.map { |label_data| Label.from_h(label_data) }
      rescue JSON::ParserError
        puts "Warning: Could not parse labels.json"
        @labels = []
      end
    else
      @labels = []
    end
  end

  # Save books to JSON file
  def save_books
    File.write(BOOKS_FILE, JSON.pretty_generate(@books.map(&:to_h)))
  end

  # Save labels to JSON file
  def save_labels
    File.write(LABELS_FILE, JSON.pretty_generate(@labels.map(&:to_h)))
  end

  # Save all data
  def save_all_data
    save_books
    save_labels
  end

  # List all books
  def list_all_books
    if @books.empty?
      puts "\n📚 No books found!"
    else
      puts "\n" + "=" * 90
      puts "📚 ALL BOOKS".center(90)
      puts "=" * 90
      @books.each { |book| puts book.display }
      puts "=" * 90
      puts "Total: #{@books.length} book(s)\n"
    end
  end

  # List all labels
  def list_all_labels
    if @labels.empty?
      puts "\n🏷️ No labels found!"
    else
      puts "\n" + "=" * 90
      puts "🏷️  ALL LABELS".center(90)
      puts "=" * 90
      @labels.each { |label| puts label.display }
      puts "=" * 90
      puts "Total: #{@labels.length} label(s)\n"
    end
  end

  # Add a new book
  def add_book
    puts "\n--- Add New Book ---"
    
    # Get book details from user
    print "Enter book title: "
    title = gets.chomp
    
    print "Enter author name: "
    author = gets.chomp
    
    print "Enter publisher: "
    publisher = gets.chomp
    
    print "Enter publish date (YYYY-MM-DD): "
    publish_date = gets.chomp
    
    print "Enter cover state (good/acceptable/damaged): "
    cover_state = gets.chomp
    
    # Generate new ID
    new_id = @books.empty? ? 1 : @books.map(&:id).max + 1
    
    # Create and add book
    book = Book.new(new_id, title, author, publisher, publish_date, cover_state)
    @books << book
    
    save_books
    puts "✓ Book '#{title}' added successfully with ID: #{new_id}\n"
  end

  # Add a new label
  def add_label
    puts "\n--- Add New Label ---"
    
    print "Enter label title: "
    title = gets.chomp
    
    print "Enter label color (red/blue/green/yellow/purple): "
    color = gets.chomp
    
    # Generate new ID
    new_id = @labels.empty? ? 1 : @labels.map(&:id).max + 1
    
    # Create and add label
    label = Label.new(new_id, title, color)
    @labels << label
    
    save_labels
    puts "✓ Label '#{title}' added successfully with ID: #{new_id}\n"
  end

  # Archive a book
  def archive_book
    puts "\nEnter book ID to archive: "
    book_id = gets.chomp.to_i
    
    book = @books.find { |b| b.id == book_id }
    
    if book.nil?
      puts "✗ Book with ID #{book_id} not found!\n"
    elsif book.archived
      puts "✗ Book is already archived!\n"
    elsif book.move_to_archive
      save_books
      puts "✓ Book '#{book.title}' has been archived!\n"
    else
      puts "✗ Book cannot be archived. Check publish date and cover state.\n"
    end
  end

  # Display the main menu
  def display_menu
    puts "\n" + "=" * 50
    puts "📖 BOOK MANAGEMENT SYSTEM".center(50)
    puts "=" * 50
    puts "1. List all books"
    puts "2. List all labels"
    puts "3. Add a book"
    puts "4. Add a label"
    puts "5. Archive a book"
    puts "6. Exit"
    puts "=" * 50
    print "Select an option (1-6): "
  end

  # Run the main application loop
  def run
    loop do
      display_menu
      choice = gets.chomp.strip
      
      case choice
      when '1'
        list_all_books
      when '2'
        list_all_labels
      when '3'
        add_book
      when '4'
        add_label
      when '5'
        archive_book
      when '6'
        puts "\n✓ Thank you for using the Book Management System. Goodbye!"
        break
      else
        puts "\n✗ Invalid option. Please try again.\n"
      end
    end
  end
end

# Program entry point
if __FILE__ == $PROGRAM_NAME
  app = BookManagementApp.new
  app.run
end
