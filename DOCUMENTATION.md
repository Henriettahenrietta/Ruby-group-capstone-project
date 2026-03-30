# Ruby Book Management Console Application

A well-structured Ruby console application for managing books and labels using Object-Oriented Programming (OOP) principles with JSON data persistence.

## 📁 Project Structure

```
Ruby-group-capstone-project/
├── item.rb              # Base Item class with archiving functionality
├── book.rb              # Book class inheriting from Item
├── label.rb             # Label class for categorizing items
├── main.rb              # Main console application (entry point)
├── books.json           # JSON storage for books data
├── labels.json          # JSON storage for labels data
└── DOCUMENTATION.md     # This file (comprehensive guide)
```

## 🏗️ Class Architecture

### Item Class (Base Class)

- **Properties:**
  - `id` (Integer): Unique identifier
  - `publish_date` (String): Date of publication (format: YYYY-MM-DD)
  - `archived` (Boolean): Archive status
- **Methods:**
  - `can_be_archived?`: Checks if item meets archiving conditions (published at least 1 day ago)
  - `move_to_archive`: Moves item to archive if conditions are met
  - `to_h`: Converts item to hash for JSON serialization

### Book Class (Inherits from Item)

- **Additional Properties:**
  - `title` (String): Book title
  - `author` (String): Author name
  - `publisher` (String): Publisher name
  - `cover_state` (String): State of cover ("good", "acceptable", "damaged")
  - `label_id` (Integer): Associated label ID
- **Methods:**
  - `can_be_archived?` (overridden): Book can only be archived if published and has good/acceptable cover
  - `display`: Returns formatted book information
  - `to_h`: Converts book to hash
  - `from_h` (class method): Creates Book from hash (for JSON loading)

### Label Class

- **Properties:**
  - `id` (Integer): Unique identifier
  - `title` (String): Label name
  - `color` (String): Associated color
  - `items` (Array): List of associated items
- **Methods:**
  - `add_item(item)`: Adds item to label
  - `remove_item(item)`: Removes item from label
  - `item_count`: Returns number of associated items
  - `display`: Returns formatted label information
  - `to_h`: Converts label to hash
  - `from_h` (class method): Creates Label from hash

## 🎮 BookManagementApp Class

The main application controller that handles:

- Loading/saving JSON data
- User interface and menu
- CRUD operations for books and labels

### Key Methods:

- `load_data`: Loads books and labels from JSON files
- `save_books` / `save_labels`: Persists data to JSON
- `list_all_books`: Displays all books with formatting
- `list_all_labels`: Displays all labels with formatting
- `add_book`: Interactive book creation
- `add_label`: Interactive label creation
- `archive_book`: Archives a specific book
- `run`: Main event loop

## 💾 JSON Data Structure

### books.json

```json
[
  {
    "id": 1,
    "title": "Book Title",
    "author": "Author Name",
    "publisher": "Publisher Name",
    "publish_date": "2020-01-15",
    "cover_state": "good",
    "label_id": 1,
    "archived": false
  }
]
```

### labels.json

```json
[
  {
    "id": 1,
    "title": "Label Title",
    "color": "blue"
  }
]
```

## 🚀 How to Run

### Prerequisites

- Ruby 2.5 or higher installed

### Running the Application

```bash
ruby main.rb
```

### Menu Options

1. **List all books** - Displays all books in formatted table
2. **List all labels** - Displays all labels with item counts
3. **Add a book** - Interactive prompt to add new book
4. **Add a label** - Interactive prompt to add new label
5. **Archive a book** - Marks a book as archived (if conditions met)
6. **Exit** - Closes the application (data is auto-saved)

## 📋 Features

### Data Persistence

- All data automatically loads from JSON on startup
- All changes are immediately saved to JSON files
- Data survives application restarts

### Archiving Logic

- Items must be published at least 1 day before archiving
- Books can only be archived if cover state is "good" or "acceptable"
- Archived items remain in database but marked as inactive

### User-Friendly Interface

- Formatted output with visual separators
- Input validation for menu selections
- Clear error messages and confirmations
- ASCII art for visual appeal

### OOP Principles

- **Inheritance**: Book inherits from Item
- **Encapsulation**: Private data with accessor methods
- **Polymorphism**: Overridden `can_be_archived?` in Book
- **Separation of Concerns**: Each class has a single responsibility

## 🔄 Data Flow

```
Start Application
    ↓
Load JSON Files (books.json, labels.json)
    ↓
Initialize Collections
    ↓
Display Menu
    ↓
User Input
    ↓
Execute Action (List/Add/Archive)
    ↓
Update In-Memory Collections
    ↓
Save to JSON Files
    ↓
Return to Menu Loop
    ↓
Exit Function
```

## 📝 Example Usage

### Adding a Book

```
Select an option (1-6): 3
--- Add New Book ---
Enter book title: The Hobbit
Enter author name: J.R.R. Tolkien
Enter publisher: George Allen & Unwin
Enter publish date (YYYY-MM-DD): 2019-01-01
Enter cover state (good/acceptable/damaged): good
✓ Book 'The Hobbit' added successfully with ID: 3
```

### Listing Books

```
Select an option (1-6): 1
==========================================================================================
📚 ALL BOOKS
==========================================================================================
[ACTIVE] ID: 1 | The Great Gatsby by F. Scott Fitzgerald | Publisher: Scribner | Cover: good
[ACTIVE] ID: 2 | To Kill a Mockingbird by Harper Lee | Publisher: Lippincott | Cover: good
[ARCHIVED] ID: 3 | The Hobbit by J.R.R. Tolkien | Publisher: George Allen & Unwin | Cover: good
==========================================================================================
Total: 3 book(s)
```

## 🛠️ Technical Details

### Gems Used

- Standard Library: `json`, `date` (no external gems required!)

### Date Handling

- Dates stored as strings in format YYYY-MM-DD
- Parsing uses Ruby's built-in `Date.parse()`
- Archive eligibility calculated using date arithmetic

### Error Handling

- Graceful JSON parse error handling
- Input validation for menu selections
- File existence checks before reading

## 🎓 Learning Objectives Met

✅ Core Classes (Item, Book, Label)
✅ Class Methods & Constructors
✅ Inheritance (Book < Item)
✅ Schema & Data Storage (JSON)
✅ User Interface (Console Menu)
✅ Startup Actions (Data Loading)
✅ Item Class Properties (id, publish_date, archived)
✅ Visible Methods (display methods)
✅ Separation of Concerns (Separate files per class)

## 🤝 Contributing

This is a group capstone project. Follow these guidelines:

1. Keep code well-commented
2. Follow the established OOP structure
3. Test changes before committing
4. Update this documentation for new features

## 📄 License

See LICENSE file for details.

---

**Created**: March 2026  
**Version**: 1.0  
**Status**: Production Ready
