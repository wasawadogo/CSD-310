DROP USER IF EXISTS 'whatabook_user'@'localhost';
CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';
GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';
ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

INSERT INTO store(locale)
    VALUES('2580 Dodge st Omaha NE 68114');


INSERT INTO book(book_name, author, details)
    VALUES('A promissed land', 'Barack Obama', 'The first book of the former US president');

INSERT INTO book(book_name, author)
    VALUES('Whereabouts', 'Jhumpa Lahiri');

INSERT INTO book(book_name, author)
    VALUES('The India Story', 'Bimal Jalal');

INSERT INTO book(book_name, author)
    VALUES('Hear Yourself', 'Prem Rawat');

INSERT INTO book(book_name, author)
    VALUES('Treasure Island', 'Robert Louis Stevenson');

INSERT INTO book(book_name, author)
    VALUES("A Christmas carol", 'Charles Dickens');

INSERT INTO book(book_name, author)
    VALUES('The Adventure Of Tom Sawyer', 'Mark Twain');

INSERT INTO book(book_name, author)
    VALUES('Dracula', 'Bram Stoker');

INSERT INTO book(book_name, author)
    VALUES('Little Women', 'Louisa May Alcott');

 
INSERT INTO user(first_name, last_name) 
    VALUES('Wendyam', 'Sawadogo');

INSERT INTO user(first_name, last_name)
    VALUES('Auguste', 'Wilson');

INSERT INTO user(first_name, last_name)
    VALUES('John', 'Parker');


INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Wndyam'), 
        (SELECT book_id FROM book WHERE book_name = 'A promissed land')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Auguste'),
        (SELECT book_id FROM book WHERE book_name = 'Dracula')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'John'),
        (SELECT book_id FROM book WHERE book_name = 'Little Women')
    );