-- Create database schema for Catalog of My Things

-- Genres table
CREATE TABLE genres (
  id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Authors table
CREATE TABLE authors (
  id INT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL
);

-- Sources table
CREATE TABLE sources (
  id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Labels table
CREATE TABLE labels (
  id INT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  color VARCHAR(50) NOT NULL
);

-- Books table (includes all Item properties)
CREATE TABLE books (
  id INT PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  author VARCHAR(200) NOT NULL,
  publisher VARCHAR(200),
  publish_date DATE NOT NULL,
  archived BOOLEAN DEFAULT FALSE,
  cover_state VARCHAR(50),
  label_id INT,
  genre_id INT,
  author_id INT,
  source_id INT,
  FOREIGN KEY (label_id) REFERENCES labels(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (source_id) REFERENCES sources(id)
);

-- Music Albums table (includes all Item properties)
CREATE TABLE music_albums (
  id INT PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN DEFAULT FALSE,
  on_spotify BOOLEAN DEFAULT FALSE,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (source_id) REFERENCES sources(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

-- Movies table (includes all Item properties)
CREATE TABLE movies (
  id INT PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN DEFAULT FALSE,
  silent BOOLEAN DEFAULT FALSE,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (source_id) REFERENCES sources(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

-- Games table (includes all Item properties)
CREATE TABLE games (
  id INT PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN DEFAULT FALSE,
  multiplayer BOOLEAN DEFAULT FALSE,
  last_played_at DATE,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (source_id) REFERENCES sources(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);
