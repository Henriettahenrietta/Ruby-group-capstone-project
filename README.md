# Catalog of My Things

A comprehensive Ruby console application for managing a personal catalog of books, music albums, movies, and games using Object-Oriented Programming (OOP) principles with JSON data persistence and database support.

## Features

- **OOP Architecture**: Clean class hierarchy with inheritance and polymorphism
- **Data Persistence**: Automatic JSON storage and loading
- **Interactive Console**: User-friendly menu-driven interface
- **Archiving System**: Intelligent archiving with date and condition validation
- **Multiple Item Types**: Books, Music Albums, Movies, Games
- **Association Management**: Items can be associated with Labels, Genres, Authors, and Sources
- **Database Support**: SQL schema for future database implementation

## Architecture

### Core Classes

- **`Item`** - Base class with archiving functionality
- **`Book`** - Inherits from Item with book-specific properties
- **`MusicAlbum`** - Inherits from Item with Spotify integration
- **`Movie`** - Inherits from Item with silent mode support
- **`Game`** - Inherits from Item with multiplayer and last played tracking
- **`Label`** - Manages categorization and item associations
- **`Genre`** - Manages genre categorization
- **`Author`** - Manages author information
- **`Source`** - Manages item sources

### Key Relationships

- Book, MusicAlbum, Movie, Game inherit from Item
- Label, Genre, Author, Source have many Items (associations)
- add_item method implemented in all classes to establish bidirectional relationships

## Installation

### Prerequisites

- Ruby 2.5+ installed
- RSpec gem for testing (optional)

### Setup

```bash
# Clone repository
git clone https://github.com/Henriettahenrietta/Ruby-group-capstone-project.git
cd Ruby-group-capstone-project

# Install dependencies
bundle install
# or
gem install rspec
```

## Usage

### Running the Application

```bash
ruby main.rb
```

### Main Menu Options

1. **List all books** - Display all books with archive status
2. **List all music albums** - Display all music albums
3. **List all movies** - Display all movies
4. **List of games** - Display all games
5. **List all genres** - Display all genres
6. **List all labels** - Display all labels with item counts
7. **List all authors** - Display all authors
8. **List all sources** - Display all sources
9. **Add a book** - Create new book entry
10. **Add a music album** - Create new music album
11. **Add a movie** - Create new movie
12. **Add a game** - Create new game
13. **Add a genre** - Create new genre
14. **Add a label** - Create new label category
15. **Add an author** - Create new author
16. **Add a source** - Create new source
17. **Exit** - Close application

### Sample Data

- Pre-loaded with sample data for all item types
- Data automatically saved to JSON files

## Database

The project includes a `schema.sql` file with table structures analogical to the class hierarchy. Since SQL doesn't support inheritance, all properties from the parent Item class are included in each child class table.

## Project Structure

```
Ruby-group-capstone-project/
├── classes/
│   ├── item.rb              # Base Item class
│   ├── book.rb              # Book class (inherits from Item)
│   ├── musicalbum.rb        # MusicAlbum class (inherits from Item)
│   ├── movie.rb             # Movie class (inherits from Item)
│   ├── game.rb              # Game class (inherits from Item)
│   ├── label.rb             # Label class
│   ├── genre.rb             # Genre class
│   ├── author.rb            # Author class
│   └── source.rb            # Source class
├── main.rb                  # Console application entry point
├── schema.sql               # Database schema
├── books.json               # Book data storage
├── labels.json              # Label data storage
├── genres.json              # Genre data storage
├── authors.json             # Author data storage
├── sources.json             # Source data storage
├── music_albums.json        # Music album data storage
├── movies.json              # Movie data storage
├── games.json               # Game data storage
├── spec/                    # Test directory
├── .rspec                   # RSpec configuration
├── Gemfile                  # Ruby dependencies
└── README.md                # This file
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

**Ruby Version**: 2.5+  
**Status**: Production Ready
