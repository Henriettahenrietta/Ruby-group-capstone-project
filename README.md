# 🚀 Quick Start Guide

## Installation & Running

### 1. Prerequisites

- Ruby 2.5+ installed on your system
- No external gems required (uses Ruby standard library only)

### 2. Quick Start

```bash
# Navigate to project directory
cd Ruby-group-capstone-project

# Run the application
ruby main.rb
```

### 3. First Run

When you run the app for the first time, it will:

- ✓ Load pre-populated sample books from `books.json`
- ✓ Load pre-populated sample labels from `labels.json`
- ✓ Display the main menu

## Main Menu Options

```
1. List all books       → View all books with archive status
2. List all labels      → View all labels and item counts
3. Add a book          → Create a new book entry
4. Add a label         → Create a new label category
5. Archive a book      → Mark a book as archived
6. Exit                → Close the application
```

## 💡 Usage Examples

### View All Books

```
Select an option (1-6): 1
-> Displays formatted list of all books
```

### Add a New Book

```
Select an option (1-6): 3
-> Follow interactive prompts
-> Enter: Title, Author, Publisher, Date, Cover State
-> Book is automatically saved to books.json
```

### Archive a Book

```
Select an option (1-6): 5
-> Enter book ID to archive
-> Book must meet conditions: published 1+ days ago, good/acceptable cover
```

## 📊 Sample Data

### Pre-loaded Books:

1. **The Great Gatsby** - F. Scott Fitzgerald (Published: 2020-01-15)
2. **To Kill a Mockingbird** - Harper Lee (Published: 2021-06-20)

### Pre-loaded Labels:

1. **Classic Literature** (Blue)
2. **Fiction** (Red)
3. **Favorites** (Yellow)

## 🔍 File Organization

| File          | Purpose                         |
| ------------- | ------------------------------- |
| `item.rb`     | Base class for all items        |
| `book.rb`     | Book class with archiving logic |
| `label.rb`    | Label class for categorization  |
| `main.rb`     | Console app & user interface    |
| `books.json`  | Persisted book data             |
| `labels.json` | Persisted label data            |

## ✨ Key Features

✅ **Auto-Save**: Changes saved to JSON immediately
✅ **Data Persistence**: Data loads automatically on startup
✅ **Archive System**: Intelligent archiving with conditions
✅ **Interactive Menu**: Easy-to-use console interface
✅ **Formatted Output**: Clean, readable display
✅ **Error Handling**: Graceful error messages

## ❓ Troubleshooting

**Issue**: "Cannot parse JSON"

- **Solution**: Check that books.json and labels.json have valid JSON syntax

**Issue**: Command not found when running ruby

- **Solution**: Install Ruby or add it to PATH environment variable

**Issue**: Dates appear as invalid

- **Solution**: Use format YYYY-MM-DD when prompted for dates

## 📖 For More Details

See `DOCUMENTATION.md` for comprehensive class documentation and architecture details.

---

**Happy Book Managing!** 📚
