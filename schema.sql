-- Catalog Management System Database Schema

-- Items table (base table)
CREATE TABLE items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    publish_date DATE NOT NULL,
    archived BOOLEAN DEFAULT FALSE
);

-- Books table
CREATE TABLE books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publisher VARCHAR(255),
    cover_state VARCHAR(50),
    publish_date DATE NOT NULL,
    archived BOOLEAN DEFAULT FALSE,
    label_id INTEGER,
    FOREIGN KEY (label_id) REFERENCES labels(id)
);

-- Labels table
CREATE TABLE labels (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(255) NOT NULL,
    color VARCHAR(50)
);

-- Genres table
CREATE TABLE genres (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL
);

-- Authors table
CREATE TABLE authors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

-- Sources table
CREATE TABLE sources (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL
);

-- Music Albums table
CREATE TABLE music_albums (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(255) NOT NULL,
    artist VARCHAR(255) NOT NULL,
    genre_id INTEGER,
    publish_date DATE NOT NULL,
    archived BOOLEAN DEFAULT FALSE,
    on_spotify BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

-- Movies table
CREATE TABLE movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(255) NOT NULL,
    director VARCHAR(255) NOT NULL,
    genre_id INTEGER,
    publish_date DATE NOT NULL,
    archived BOOLEAN DEFAULT FALSE,
    silent BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

-- Games table
CREATE TABLE games (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(255) NOT NULL,
    author_id INTEGER,
    genre_id INTEGER,
    publish_date DATE NOT NULL,
    archived BOOLEAN DEFAULT FALSE,
    multiplayer BOOLEAN DEFAULT FALSE,
    last_played_at DATETIME,
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);