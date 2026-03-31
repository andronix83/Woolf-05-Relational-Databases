USE LibraryManagement;

-- Insert mock data into authors
INSERT INTO authors (author_name) VALUES 
('George Orwell'), 
('J.K. Rowling'), 
('Isaac Asimov'), 
('Agatha Christie');

-- Insert mock data into genres
INSERT INTO genres (genre_name) VALUES 
('Science Fiction'), 
('Fantasy'), 
('Mystery'), 
('Dystopian');

-- Insert mock data into books
INSERT INTO books (title, publication_year, author_id, genre_id) VALUES 
('1984', 1949, 1, 4),
('Harry Potter and the Sorcerers Stone', 1997, 2, 2),
('Foundation', 1951, 3, 1),
('Murder on the Orient Express', 1934, 4, 3),
('Animal Farm', 1945, 1, 4);

-- Insert mock data into users
INSERT INTO users (username, email) VALUES 
('john_doe', 'john@example.com'),
('jane_smith', 'jane@example.com'),
('alice_jones', 'alice@example.com');

-- Insert mock data into borrowed_books
INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES 
(1, 1, '2023-10-01', '2023-10-15'),
(2, 2, '2023-10-05', '2023-10-20'),
(4, 3, '2023-10-10', NULL), -- NULL indicates the book is not yet returned
(5, 1, '2023-10-12', '2023-10-26');