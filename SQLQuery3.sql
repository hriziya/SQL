CREATE DATABASE db_Library
Go

USE db_Library

/* LIBRARY BRANCH TABLE */
CREATE TABLE tbl_library_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(50) NOT NULL
);
select * from tbl_library_branch
INSERT INTO tbl_library_branch (branch_name, branch_address)
VALUES
('West', '985 Town Dr.')

/* LIBRARY BRANCH END*/

/* PUBLISHER TABLE */

CREATE TABLE tbl_publisher (
	publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(50) NOT NULL,
	publisher_phone INT NOT NULL
);

INSERT INTO tbl_publisher (publisher_name, publisher_address, publisher_phone)
VALUES
('publisher_1','pub_address_1',1),
('publisher_2','pub_address_2',2),
('publisher_3','pub_address_3',3),
('publisher_4','pub_address_4',4),
('publisher_5','pub_address_5',5),
('publisher_6','pub_address_6',6),
('publisher_7','pub_address_7',7),
('publisher_8','pub_address_8',8)

/* END PUBLISHER TABLE */


/* BOOKS TABLE */

CREATE TABLE tbl_books (
	book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	title VARCHAR(50) NOT NULL,
	publisher_name VARCHAR(50) NOT NULL CONSTRAINT fk_library_books_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_books (title, publisher_name)
VALUES
('The Lost Tribe','publisher_8'),
('book_1','publisher_1'),
('book_2','publisher_8'),
('book_3','publisher_1'),
('book_4','publisher_4'),
('book_5','publisher_6'),
('book_6','publisher_4'),
('book_7','publisher_1'),
('book_8','publisher_3'),
('book_9','publisher_1'),
('book_10','publisher_4'),
('book_11','publisher_8'),
('book_12','publisher_1'),
('book_13','publisher_4'),
('book_14','publisher_6'),
('book_15','publisher_2'),
('book_16','publisher_4'),
('book_17','publisher_1'),
('book_18','publisher_8'),
('book_19','publisher_1'),
('book_20','publisher_1'),
('book_21','publisher_1'),
('book_22','publisher_1'),
('book_23','publisher_1'),
('book_24','publisher_1'),
('book_25','publisher_1'),
('book_26','publisher_1'),
('book_27','publisher_1'),
('book_28','publisher_1'),
('book_29','publisher_1'),
('book_30','publisher_1'),
('book_31','publisher_1'),
('book_32','publisher_1'),
('book_33','publisher_1'),
('book_34','publisher_1'),
('book_35','publisher_1'),
('book_36','publisher_1'),
('book_37','publisher_1'),
('book_38','publisher_1'),
('book_39','publisher_1')

/* END BOOKS TABLE */

/* BOOK AUTHOR TABLE */

CREATE TABLE tbl_book_authors (
	book_id INT NOT NULL CONSTRAINT fk_authors_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name VARCHAR(50) NOT NULL
);
SELECT * FROM tbl_book_authors
INSERT INTO tbl_book_authors (book_id, author_name)
VAlUES
(21, 'name_1'),
(22, 'name_2'),
(23, 'name_3'),
(24, 'name_4'),
(25, 'name_5'),
(26, 'name_6'),
(27, 'name_7'),
(28, 'name_8'),
(29, 'name_9'),
(30, 'name_10')


/* BOOK AUTHORS TABLE END */


CREATE TABLE tbl_book_copies (
	book_id INT NOT NULL CONSTRAINT fk_book_copies_book_id FOREIGN KEY REFERENCES tbl_books(book_id),
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id),
	number_of_copies INT NOT NULL
);
SELECT * FROM tbl_book_copies
INSERT INTO tbl_book_copies (book_id, branch_id, number_of_copies)
VALUES
(21,1,2),
(22,2,4),
(23,3,3),
(24,4,3),
(25,1,6),
(26,2,3),
(27,3,8),
(28,4,4),
(29,1,3),
(30,2,6),
(31,3,3),
(32,4,8),
(33,1,4),
(34,2,6),
(35,3,3),
(36,4,8),
(37,1,4),
(38,2,6),
(39,3,3),
(40,4,8),
(41,1,4),
(42,2,6),
(43,3,3),
(44,4,8),
(45,1,4),
(46,2,6),
(47,3,3),
(48,4,8),
(49,1,4),
(50,2,6),
(51,3,3),
(52,4,8),
(53,1,4),
(54,2,6),
(55,3,3),
(56,4,8),
(57,1,4),
(58,2,6),
(59,3,3),
(60,4,8)


/* TABLE BOOK LOANS */

CREATE TABLE tbl_book_loans (
	book_id INT NOT NULL CONSTRAINT fk_book_loans_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_book_loans_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_no INT NOT NULL CONSTRAINT fk_book_loans_card_no FOREIGN KEY REFERENCES tbl_borrower(card_no) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out INT NOT NULL,
	date_due INT NOT NULL
);

INSERT INTO tbl_book_loans (book_id, branch_id, date_out, date_due, card_no)
VALUES
(22,4,02012020,02142020,1),
(22,3,02012020,2142020,2),
(23,2,02012020,2142020,3),
(24,1,02012020,2142020,4),
(25,4,02012020,2142020,5),
(26,3,02012020,2142020,6),
(27,2,02012020,2142020,7),
(28,1,02012020,2142020,8),
(29,4,02012020,2142020,1),
(30,3,02012020,2142020,2),
(31,2,02012020,2142020,3),
(32,1,02012020,2142020,4),
(33,4,02012020,2142020,5),
(33,3,02012020,2142020,6),
(22,2,02012020,2142020,7),
(34,1,02012020,2142020,8),
(35,4,02012020,2142020,1),
(36,3,02012020,2142020,2),
(21,2,02012020,2142020,3),
(40,1,02012020,2142020,4),
(40,4,02012020,2142020,5),
(23,3,02012020,2142020,6),
(33,2,02012020,2142020,7),
(40,1,02012020,2142020,8),
(25,4,02012020,2142020,1),
(21,3,02012020,2142020,2),
(21,3,02012020,2142020,3),
(34,1,02012020,2142020,4),
(40,4,02012020,2142020,5),
(21,2,02012020,2142020,6),
(23,2,02012020,2142020,7),
(22,3,02012020,2142020,8),
(33,3,02012020,2142020,1),
(21,4,02012020,2142020,2),
(31,2,02012020,2142020,3),
(34,1,02012020,2142020,4),
(35,4,02012020,2142020,5),
(36,2,02012020,2142020,6),
(37,3,02012020,2142020,7),
(38,1,02012020,2142020,8),
(39,1,02012020,2142020,1),
(21,3,02012020,2142020,2),
(23,2,02012020,2142020,3),
(24,2,02012020,2142020,4),
(25,3,02012020,2142020,5),
(21,4,02012020,2142020,6),
(27,4,02012020,2142020,5),
(38,4,02012020,2142020,7),
(39,2,02012020,2142020,8),
(40,1,02012020,2142020,1)

/* TABLE BOOK LOANS */


/* TABLE BORROWER */

CREATE TABLE tbl_borrower (
	card_no INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL
);


SELECT * FROM tbl_borrower
INSERT INTO tbl_borrower (borrower_name, borrower_address, phone)
VALUES
('Sam','123 Main St.','1234567894'),
('Ben','123 Forest Dr.','1234567894'),
('Stan','123 Alma Lane.','1234567894'),
('Arianna','123 Borr St.','1234567894'),
('Aria','234 Bufford St.','1234567894'),
('Bre','346 Lima Dr.','1234567894'),
('Nate','4567 Sunset Blvd.','1234567894'),
('Thomas','890 Lake Terrace Dr.','1234567894')

/* TABLE BORROWER */