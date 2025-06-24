
USE LibraryDB;

CREATE TABLE Author (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

INSERT INTO Author (Name) VALUES
('J.K. Rowling'),
('George R.R. Martin'),
('J.R.R. Tolkien'),
('Dan Brown');
SELECT * FROM Author;

CREATE TABLE Book (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Genre VARCHAR(50),
    PublishedYear YEAR
);

INSERT INTO Book (Title, Genre, PublishedYear) VALUES
('Harry Potter and the Philosopher\s Stone', 'Fantasy', 1997),
('A Game of Thrones', 'Fantasy', 1996),
('The Hobbit', 'Fantasy', 1937),
('The Da Vinci Code', 'Thriller', 2003);
SELECT * FROM Book;

CREATE TABLE Member (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    JoinDate DATE
);

INSERT INTO Member (Name, Email, JoinDate) VALUES
('Alice Johnson', 'alice@example.com', '2023-01-15'),
('Bob Smith', 'bob@example.com', '2023-02-20'),
('Charlie Brown', 'charlie@example.com', '2023-03-05');
SELECT * FROM Member;

CREATE TABLE Loan (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);
INSERT INTO Loan (BookID, MemberID, LoanDate, ReturnDate) VALUES
(1, 1, '2024-05-01', '2024-05-15'),
(2, 1, '2024-06-01', NULL),
(3, 2, '2024-06-10', '2024-06-20'),
(4, 3, '2024-06-18', NULL);
SELECT * FROM Loan;

CREATE TABLE BookAuthor (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);
INSERT INTO BookAuthor (BookID, AuthorID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);
Select * from BookAuthor;