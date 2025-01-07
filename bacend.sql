CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    email VARCHAR(255),
    password VARCHAR(255),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP
);

CREATE TABLE profile(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(60),
    last_name VARCHAR(60),
    phone_number VARCHAR(13),
    image VARCHAR(255),
    user_id INT REFERENCES users(id),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP
);
CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    profile_id INT REFERENCES profile(id),
    movie_id INT REFERENCES movies(id),
    cinema_id INT REFERENCES cinema(id),
    payment_id INT REFERENCES payment_method(id),
    seat VARCHAR[],
    date_order DATE,
    qty INT,
    total_price INT,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP
);
drop TABLE orders, payment_method;
CREATE TABLE payment_method (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP
);

INSERT INTO payment_method (name) VALUES
('Goggle Pay'), ('Visa'), ('Gopay'), ('Pay Pal'),
('Dana'), ('Bank BCA'), ('Bank BRI'), ('OVO');

SELECt * FROM orders
FULL OUTER JOIN payment_method ON payment_method.id = orders.payment_id;
UPDATE orders
SET payment_id = $1
WHERE id = $2
RETURNING id, profile_id, movie_id, cinema_id, payment_id, seat, date_order, qty, total_price;


SELECT cinema.name, cinema_location.name_location
	FROM cinema
	JOIN cinema_location ON cinema_location.cinema_id = cinema.id;
	-- WHERE cinema.id = $1 AND cinema_location.name_location = $2`,

-- SELECT * from orders
-- FULL OUTER JOIN profile ON profile.id = orders.profile_id;
DROP TABLE orders;
SELECT * from orders;

INSERT INTO orders (profile_id, movie_id, cinema_id, seat_id, date_order, qty ) 
		VALUES ($1, $2, $3, $4, $5, $6) 
		RETURNING id, profile_id, movie_id, cinema_id, seat_id, date_order, qty;

SELECT * from orders;
SELECT seat.price FROM cinema 
		JOIN seat ON seat.cinema_id = cinema.id
		WHERE cinema.id = $1;


CREATE TABLE movies(
    id SERIAL PRIMARY KEY,
    tittle VARCHAR(60),
    genre VARCHAR(100),
    images VARCHAR(255),
    synopsis VARCHAR(255),
    author VARCHAR(60),
    actors VARCHAR(255),
    release_date DATE,
    duration TIME,
    tag VARCHAR(30),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP
);
CREATE Table cinema(
    id serial PRIMARY KEY,
    name VARCHAR(50),
    price INT,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP
);

INSERT INTO cinema (name, price) VALUES
('Cinepolis Mega Bekasi', 15000),
('CGV Grand Indonesia',15000),
('Cinemaxx Lippo Mall Puri',15000),
('XXI Plaza Indonesia',15000),
('Cineworld Mall Kelapa Gading',15000),
('CGV Pacific Place',15000),
('Cinema XXI Tunjungan Plaza',15000),
('Cinemaxx Surabaya',15000),
('CGV Cinere Mall',15000),
('Cinepolis Palembang',15000),
('XXI Mall of Indonesia',15000),
('CGV Blok M Square',15000),
('Cinemaxx Transmart Carrefour',15000),
('Cinema XXI Semanggi',15000),
('CGV Central Park',15000),
('Cinepolis Jakarta Garden City',15000),
('XXI Grand City Mall Surabaya',15000),
('Cinemaxx Park 23 Bali',15000),
('CGV Bogor Trade Mall',15000),
('Cinepolis Cilandak Town Square',15000),
('Cinemaxx Festival City Link Bandung',15000),
('CGV Epiwalk Mall',15000),
('Cinepolis Dago Plaza Bandung',15000),
('XXI Supermall Karawaci',15000),
('CGV Mall Kota Kasablanka',15000),
('Cinemaxx Mall Ciputra Cibubur',15000),
('Cinepolis Trans Studio Mall Makassar',15000),
('XXI Paris Van Java Bandung',15000),
('Cinepolis Bandung Supermall',15000),
('CGV La Piazza Mall',15000),
('Cinemaxx Living World Alam Sutera',15000),
('CGV Grand Indonesia',15000),
('Cinemaxx Lippo Mall Puri',15000),
('XXI Plaza Indonesia',15000),
('Cineworld Mall Kelapa Gading',15000),
('CGV Pacific Place',15000),
('Cinema XXI Tunjungan Plaza',15000),
('Cinemaxx Surabaya',15000),
('CGV Cinere Mall',15000);


CREATE TABLE cinema_date(
    id SERIAL PRIMARY KEY,
    name_date DATE,
    cinema_id int REFERENCES cinema(id),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP
);
-- Insert data ke dalam tabel cinema_date dengan referensi cinema_id sampai 50
INSERT INTO cinema_date (name_date, cinema_id)
VALUES
    ('2025-01-01', 1),
    ('2025-01-02', 2),
    ('2025-01-03', 3),
    ('2025-01-04', 4),
    ('2025-01-05', 5),
    ('2025-01-06', 6),
    ('2025-01-07', 7),
    ('2025-01-08', 8),
    ('2025-01-09', 9),
    ('2025-01-10', 10),
    ('2025-01-11', 11),
    ('2025-01-12', 12),
    ('2025-01-13', 13),
    ('2025-01-14', 14),
    ('2025-01-15', 15),
    ('2025-01-16', 16),
    ('2025-01-17', 17),
    ('2025-01-18', 18),
    ('2025-01-19', 19),
    ('2025-01-20', 20),
    ('2025-01-21', 21),
    ('2025-01-22', 22),
    ('2025-01-23', 23),
    ('2025-01-24', 24),
    ('2025-01-25', 25),
    ('2025-01-26', 26),
    ('2025-01-27', 27),
    ('2025-01-28', 28),
    ('2025-01-29', 29),
    ('2025-01-30', 30),
    ('2025-01-31', 31),
    ('2025-02-01', 32),
    ('2025-02-02', 33),
    ('2025-02-03', 34),
    ('2025-02-04', 35),
    ('2025-02-05', 36),
    ('2025-02-06', 37),
    ('2025-02-07', 38),
    ('2025-02-08', 39),
    ('2025-01-11', 1),
    ('2025-01-12', 2),
    ('2025-01-13', 3),
    ('2025-01-14', 4),
    ('2025-01-15', 5),
    ('2025-01-16', 6),
    ('2025-01-17', 7),
    ('2025-01-18', 8),
    ('2025-01-19', 9),
    ('2025-01-20', 10),
    ('2025-01-21', 11),
    ('2025-01-22', 12),
    ('2025-01-23', 13),
    ('2025-01-24', 14),
    ('2025-01-25', 15),
    ('2025-01-26', 16),
    ('2025-01-27', 17),
    ('2025-01-28', 18),
    ('2025-01-29', 19),
    ('2025-01-30', 20),
    ('2025-01-31', 21),
    ('2025-02-01', 22),
    ('2025-02-02', 23),
    ('2025-02-03', 24),
    ('2025-02-04', 25),
    ('2025-02-05', 26),
    ('2025-02-06', 27),
    ('2025-02-07', 28),
    ('2025-02-08', 29),
    ('2025-02-09', 30),
    ('2025-02-10', 31),
    ('2025-02-11', 32),
    ('2025-02-12', 33),
    ('2025-02-13', 34),
    ('2025-02-14', 35),
    ('2025-02-15', 36),
    ('2025-02-16', 37),
    ('2025-02-17', 38),
    ('2025-02-18', 39);

CREATE TABLE cinema_time(
    id SERIAL PRIMARY KEY,
    name_time TIME,
    cinema_id int REFERENCES cinema(id),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP 
);
INSERT INTO cinema_time (name_time, cinema_id)
VALUES
    ('10:00:00', 1),
    ('12:00:00', 1),
    ('14:00:00', 1),
    ('16:00:00', 1),
    ('18:00:00', 1),
    ('20:00:00', 1),
    ('22:00:00', 1),
    ('10:00:00', 2),
    ('12:00:00', 2),
    ('14:00:00', 2),
    ('16:00:00', 2),
    ('18:00:00', 2),
    ('20:00:00', 2),
    ('22:00:00', 2),
    ('10:00:00', 3),
    ('12:00:00', 3),
    ('14:00:00', 3),
    ('16:00:00', 3),
    ('18:00:00', 3),
    ('20:00:00', 3),
    ('22:00:00', 3),
    ('10:00:00', 4),
    ('12:00:00', 4),
    ('14:00:00', 4),
    ('16:00:00', 4),
    ('18:00:00', 4),
    ('20:00:00', 4),
    ('22:00:00', 4),
    ('10:00:00', 5),
    ('12:00:00', 5),
    ('14:00:00', 5),
    ('16:00:00', 5),
    ('18:00:00', 5),
    ('20:00:00', 5),
    ('22:00:00', 5),
    ('10:00:00', 6),
    ('12:00:00', 6),
    ('14:00:00', 6),
    ('16:00:00', 6),
    ('18:00:00', 6),
    ('20:00:00', 6),
    ('22:00:00', 6),
    ('10:00:00', 7),
    ('12:00:00', 7),
    ('14:00:00', 7),
    ('16:00:00', 7),
    ('18:00:00', 7),
    ('20:00:00', 7),
    ('22:00:00', 7),
    ('10:00:00', 8),
    ('12:00:00', 8),
    ('14:00:00', 8),
    ('16:00:00', 8),
    ('18:00:00', 8),
    ('20:00:00', 8),
    ('22:00:00', 8),
    ('10:00:00', 9),
    ('12:00:00', 9),
    ('14:00:00', 9),
    ('16:00:00', 9),
    ('18:00:00', 9),
    ('20:00:00', 9),
    ('22:00:00', 9),
    ('10:00:00', 10),
    ('12:00:00', 10),
    ('14:00:00', 10),
    ('16:00:00', 10),
    ('18:00:00', 10),
    ('20:00:00', 10),
    ('22:00:00', 10),
    ('10:00:00', 11),
    ('12:00:00', 11),
    ('14:00:00', 11),
    ('16:00:00', 11),
    ('18:00:00', 11),
    ('20:00:00', 11),
    ('22:00:00', 11),
    ('10:00:00', 12),
    ('12:00:00', 12),
    ('14:00:00', 12),
    ('16:00:00', 12),
    ('18:00:00', 12),
    ('20:00:00', 12),
    ('22:00:00', 12),
    ('10:00:00', 13),
    ('12:00:00', 13),
    ('14:00:00', 13),
    ('16:00:00', 13),
    ('18:00:00', 13),
    ('20:00:00', 13),
    ('22:00:00', 13),
    ('10:00:00', 14),
    ('12:00:00', 14),
    ('14:00:00', 14),
    ('16:00:00', 14),
    ('18:00:00', 14),
    ('20:00:00', 14),
    ('22:00:00', 14),
    ('10:00:00', 15),
    ('12:00:00', 15),
    ('14:00:00', 15),
    ('16:00:00', 15),
    ('18:00:00', 15),
    ('20:00:00', 15),
    ('22:00:00', 15),
    ('10:00:00', 16),
    ('12:00:00', 16),
    ('14:00:00', 16),
    ('16:00:00', 16),
    ('18:00:00', 16),
    ('20:00:00', 16),
    ('22:00:00', 16),
    ('10:00:00', 17),
    ('12:00:00', 17),
    ('14:00:00', 17),
    ('16:00:00', 17),
    ('18:00:00', 17),
    ('20:00:00', 17),
    ('22:00:00', 17),
    ('10:00:00', 18),
    ('12:00:00', 18),
    ('14:00:00', 18),
    ('16:00:00', 18),
    ('18:00:00', 18),
    ('20:00:00', 18),
    ('22:00:00', 18),
    ('10:00:00', 19),
    ('12:00:00', 19),
    ('14:00:00', 19),
    ('16:00:00', 19),
    ('18:00:00', 19),
    ('20:00:00', 19),
    ('22:00:00', 19),
    ('10:00:00', 20),
    ('12:00:00', 20),
    ('14:00:00', 20),
    ('16:00:00', 20),
    ('18:00:00', 20),
    ('20:00:00', 20),
    ('22:00:00', 20),
    ('10:00:00', 21),
    ('12:00:00', 21),
    ('14:00:00', 21),
    ('16:00:00', 21),
    ('18:00:00', 21),
    ('20:00:00', 21),
    ('22:00:00', 21),
    ('10:00:00', 22),
    ('12:00:00', 22),
    ('14:00:00', 22),
    ('16:00:00', 22),
    ('18:00:00', 22),
    ('20:00:00', 22),
    ('22:00:00', 22),
    ('10:00:00', 23),
    ('12:00:00', 23),
    ('14:00:00', 23),
    ('16:00:00', 23),
    ('18:00:00', 23),
    ('20:00:00', 23),
    ('22:00:00', 23),
    ('10:00:00', 24),
    ('12:00:00', 24),
    ('14:00:00', 24),
    ('16:00:00', 24),
    ('18:00:00', 24),
    ('20:00:00', 24),
    ('22:00:00', 24),
    ('10:00:00', 25),
    ('12:00:00', 25),
    ('14:00:00', 25),
    ('16:00:00', 25),
    ('18:00:00', 25),
    ('20:00:00', 25),
    ('22:00:00', 25),
    ('10:00:00', 26),
    ('12:00:00', 26),
    ('14:00:00', 26),
    ('16:00:00', 26),
    ('18:00:00', 26),
    ('20:00:00', 26),
    ('22:00:00', 26),
    ('10:00:00', 27),
    ('12:00:00', 27),
    ('14:00:00', 27),
    ('16:00:00', 27),
    ('18:00:00', 27),
    ('20:00:00', 27),
    ('22:00:00', 27),
    ('10:00:00', 28),
    ('12:00:00', 28),
    ('14:00:00', 28),
    ('16:00:00', 28),
    ('18:00:00', 28),
    ('20:00:00', 28),
    ('22:00:00', 28),
    ('10:00:00', 29),
    ('12:00:00', 29),
    ('14:00:00', 29),
    ('16:00:00', 29),
    ('18:00:00', 29),
    ('20:00:00', 29),
    ('22:00:00', 29),
    ('10:00:00', 30),
    ('12:00:00', 30),
    ('14:00:00', 30),
    ('16:00:00', 30),
    ('18:00:00', 30),
    ('20:00:00', 30),
    ('22:00:00', 30),
    ('10:00:00', 31),
    ('12:00:00', 31),
    ('14:00:00', 31),
    ('16:00:00', 31),
    ('18:00:00', 31),
    ('20:00:00', 31),
    ('22:00:00', 31),
    ('10:00:00', 32),
    ('12:00:00', 32),
    ('14:00:00', 32),
    ('16:00:00', 32),
    ('18:00:00', 32),
    ('20:00:00', 32),
    ('22:00:00', 32),
    ('10:00:00', 33),
    ('12:00:00', 33),
    ('14:00:00', 33),
    ('16:00:00', 33),
    ('18:00:00', 33),
    ('20:00:00', 33),
    ('22:00:00', 33),
    ('10:00:00', 34),
    ('12:00:00', 34),
    ('14:00:00', 34),
    ('16:00:00', 34),
    ('18:00:00', 34),
    ('20:00:00', 34),
    ('22:00:00', 34),
    ('10:00:00', 35),
    ('12:00:00', 35),
    ('14:00:00', 35),
    ('16:00:00', 35),
    ('18:00:00', 35),
    ('20:00:00', 35),
    ('22:00:00', 35),
    ('10:00:00', 36),
    ('12:00:00', 36),
    ('14:00:00', 36),
    ('16:00:00', 36),
    ('18:00:00', 36),
    ('20:00:00', 36),
    ('22:00:00', 36),
    ('10:00:00', 37),
    ('12:00:00', 37),
    ('14:00:00', 37),
    ('16:00:00', 37),
    ('18:00:00', 37),
    ('20:00:00', 37),
    ('22:00:00', 37),
    ('10:00:00', 38),
    ('12:00:00', 38),
    ('14:00:00', 38),
    ('16:00:00', 38),
    ('18:00:00', 38),
    ('20:00:00', 38),
    ('22:00:00', 38),
    ('10:00:00', 39),
    ('12:00:00', 39),
    ('14:00:00', 39),
    ('16:00:00', 39),
    ('18:00:00', 39),
    ('20:00:00', 39),
    ('22:00:00', 39);

CREATE TABLE cinema_location(
    id SERIAL PRIMARY KEY,
    name_location VARCHAR(50),
    cinema_id int REFERENCES cinema(id),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP
);


INSERT INTO cinema_location (name_location, cinema_id) VALUES
('Jakarta', 1),
('Surabaya', 2),
('Bandung', 3),
('Medan', 4),
('Yogyakarta', 5),
('Makassar', 6),
('Semarang', 7),
('Palembang', 8),
('Bali', 9),
('Malang', 10),
('Bogor', 11),
('Tangerang', 12),
('Depok', 13),
('Bekasi', 14),
('Batam', 15),
('Denpasar', 16),
('Bandar Lampung', 17),
('Pontianak', 18),
('Manado', 19),
('Mataram', 20),
('Solo', 21),
('Kudus', 22),
('Cirebon', 23),
('Pekanbaru', 24),
('Balikpapan', 25),
('Kupang', 26),
('Cirebon', 27),
('Samarinda', 28),
('Jayapura', 29),
('Ambon', 30),
('Banjarmasin', 31),
('Singaraja', 32),
('Jambi', 33),
('Serang', 34),
('Surakarta', 35),
('Probolinggo', 36),
('Tebing Tinggi', 37),
('Ternate', 38),
('Blitar', 39);


CREATE TABLE seat (
    id serial PRIMARY KEY,
    name varchar(3),
    price INT,
    cinema_id INT REFERENCES cinema(id),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP
);

INSERT INTO seat (name, price, cinema_id) VALUES
('A1', 15000, 1),('A2', 15000, 1),('A3', 15000, 1),('A4', 15000, 1),('A5', 15000, 1),
('A6', 15000, 1),('A7', 15000, 1),('A8', 15000, 1),('A9', 15000, 1),('A10', 15000, 1),
('A11', 15000, 1),('A12', 15000, 1),('A13', 15000, 1),('A14', 15000, 1),('B1', 15000, 1),
('B2', 15000, 1),('B3', 15000, 1),('B4', 15000, 1),('B5', 15000, 1),('B6', 15000, 1),
('B7', 15000, 1),('B8', 15000, 1),('B9', 15000, 1),('B10', 15000, 1),('B11', 15000, 1),
('B12', 15000, 1),('B13', 15000, 1),('B14', 15000, 1),('C1', 15000, 1),('C2', 15000, 1),
('C3', 15000, 1),('C4', 15000, 1),('C5', 15000, 1),('C6', 15000, 1),('C7', 15000, 1),
('C8', 15000, 1),('C9', 15000, 1),('C10', 15000, 1),('C11', 15000, 1),('C12', 15000, 1),
('C13', 15000, 1),('C14', 15000, 1),('D1', 15000, 1),('D2', 15000, 1),('D3', 15000, 1),
('D4', 15000, 1),('D5', 15000, 1),('D6', 15000, 1),('D7', 15000, 1),('D8', 15000, 1),
('D9', 15000, 1),('D10', 15000, 1),('D11', 15000, 1),('D12', 15000, 1),('D13', 15000, 1),
('D14', 15000, 1),('E1', 15000, 1),('E2', 15000, 1),('E3', 15000, 1),('E4', 15000, 1),
('E5', 15000, 1),('E6', 15000, 1),('E7', 15000, 1),('E8', 15000, 1),('E9', 15000, 1),
('E10', 15000, 1),('E11', 15000, 1),('E12', 15000, 1),('E13', 15000, 1),('E14', 15000, 1),
('F1', 15000, 1),('F2', 15000, 1),('F3', 15000, 1),('F4', 15000, 1),('F5', 15000, 1),
('F6', 15000, 1),('F7', 15000, 1),('F8', 15000, 1),('F9', 15000, 1),('F10', 15000, 1),
('F11', 15000, 1),('F12', 15000, 1),('F13', 15000, 1),('F14', 15000, 1),('G1', 15000, 1),
('G2', 15000, 1),('G3', 15000, 1),('G4', 15000, 1),('G5', 15000, 1),('G6', 15000, 1),
('G7', 15000, 1),('G8', 15000, 1),('G9', 15000, 1),('G10', 15000, 1),('G10', 15000, 1),
('G11', 15000, 1),('G12', 15000, 1),('G13', 15000, 1),('G14', 15000, 1);

UPDATE users
	SET email=$1, password=$2
	FROM profile
	WHERE users.id=$3
	AND users.id = profile.user_id
	RETURNING users.email, users.password;

SELECT profile.id, orders.id, movies.tittle, movies.images, movies.genre,
cinema.name, cinema_location.name_location FROM orders
JOIN profile ON orders.profile_id = profile.id 
JOIN movies ON movies.id = orders.movie_id 
JOIN cinema ON cinema.id = orders.cinema_id
JOIN cinema_location ON cinema_location.id = cinema.id
WHERE orders.id = $1;

SELECT  movies.tittle,movies.images,movies.genre, cinema.name, cinema_location.name_location from orders
-- JOIN profile ON profile.id = orders.profile_id
JOIN movies ON movies.id = orders.movie_id
JOIN cinema ON cinema.id = orders.cinema_id
JOIN cinema_location ON cinema_location.cinema_id = cinema.id
WHERE orders.id = 1;

SELECT  movies.tittle, movies.images, movies.genre,
cinema.name, cinema_location.name_location FROM orders
-- JOIN orders ON orders.profile_id = profile.id 
JOIN movies ON movies.id = orders.movie_id 
JOIN cinema ON cinema.id = orders.cinema_id
JOIN cinema_location ON cinema_location.id = cinema.id
WHERE orders.id = 100;

SELECT * from profile;
SELECT * from orders;

SELECT * FROM ;

SELECT users.id, users.email, users.password, profile.image FROM users 
JOIN profile ON profile.user_id = users.id
ORDER BY users.id ASC;

UPDATE users
SET email = COALESCE($1, email),
    password = COALESCE($2, password)
WHERE email = $3;

SELECT * from users;

drop table orders;
drop TABLE seat;

INSERT INTO movies (tittle, genre, images, synopsis, author, actors, release_date, duration, tag) VALUES
('Avatar', 'Action, Adventure, Science Fiction', 'avatar.jpg', 'Di dunia Pandora, manusia berusaha mengeksploitasi sumber daya alam, sementara kelompok Navi berjuang untuk melindungi rumah mereka.', 'James Cameron', 'Sam Worthington, Zoe Saldana', '2009-12-18', '02:42:00', 'epic'),
('The Dark Knight', 'Action, Crime, Drama', 'dark_knight.jpg', 'Batman berusaha menghentikan Joker yang berencana menciptakan kekacauan di Gotham City.', 'Christopher Nolan', 'Christian Bale, Heath Ledger', '2008-07-18', '02:32:00', 'thriller'),
('Inception', 'Action, Adventure, Science Fiction', 'inception.jpg', 'Seorang pencuri yang dapat memasuki mimpi orang lain diupah untuk menanamkan ide ke pikiran seseorang.', 'Christopher Nolan', 'Leonardo DiCaprio, Joseph Gordon-Levitt', '2010-07-16', '02:28:00', 'mind-bending'),
('Titanic', 'Drama, Romance', 'titanic.jpg', 'Kisah cinta antara Jack dan Rose yang terjebak dalam tragedi tenggelamnya kapal Titanic.', 'James Cameron', 'Leonardo DiCaprio, Kate Winslet', '1997-12-19', '03:14:00', 'classic'),
('The Matrix', 'Action, Science Fiction', 'matrix.jpg', 'Seorang programmer mengetahui bahwa dunia tempat dia tinggal adalah simulasi buatan yang diciptakan oleh mesin.', 'Lana Wachowski, Lilly Wachowski', 'Keanu Reeves, Laurence Fishburne', '1999-03-31', '02:16:00', 'cyberpunk'),
('Forrest Gump', 'Drama, Romance', 'forrest_gump.jpg', 'Seorang pria sederhana mengalami berbagai peristiwa besar dalam sejarah Amerika, dari Perang Vietnam hingga Watergate.', 'Eric Roth', 'Tom Hanks, Robin Wright', '1994-07-06', '02:22:00', 'inspirational'),
('Avengers: Endgame', 'Action, Adventure, Science Fiction', 'avengers_endgame.jpg', 'Para Avengers berusaha untuk mengalahkan Thanos setelah kehancuran yang dia bawa di Avengers: Infinity War.', 'Anthony Russo, Joe Russo', 'Robert Downey Jr., Chris Evans', '2019-04-26', '03:02:00', 'superhero'),
('The Shawshank Redemption', 'Drama', 'shawshank.jpg', 'Seorang pria yang dihukum untuk kejahatan yang tidak dia lakukan berteman dengan sesama tahanan dan merencanakan pelarian.', 'Frank Darabont', 'Tim Robbins, Morgan Freeman', '1994-09-22', '02:22:00', 'hope'),
('Jurassic Park', 'Action, Adventure, Science Fiction', 'jurassic_park.jpg', 'Seorang ilmuwan menciptakan taman safari yang dihuni oleh dinosaurus, tetapi segalanya menjadi kacau ketika dinosaurus lepas.', 'Michael Crichton', 'Sam Neill, Laura Dern', '1993-06-11', '02:06:00', 'thriller'),
('The Godfather', 'Crime, Drama', 'godfather.jpg', 'Kisah keluarga mafia Corleone dan perjuangan Michael Corleone untuk mempertahankan kekuatan dan kehormatan keluarga.', 'Mario Puzo', 'Marlon Brando, Al Pacino', '1972-03-24', '02:55:00', 'classic'),
('The Lion King', 'Animation, Adventure, Drama', 'lion_king.jpg', 'Seorang anak singa berjuang untuk merebut kembali tahtanya setelah ayahnya dibunuh.', 'Roger Allers, Rob Minkoff', 'Matthew Broderick, Jeremy Irons', '1994-06-24', '01:28:00', 'animated'),
('Gladiator', 'Action, Adventure, Drama', 'gladiator.jpg', 'Seorang prajurit yang dikhianati berjuang untuk membalas dendam di arena gladiator Roma.', 'Ridley Scott', 'Russell Crowe, Joaquin Phoenix', '2000-05-05', '02:35:00', 'epic'),
('Star Wars: Episode V - The Empire Strikes Back', 'Action, Adventure, Fantasy', 'empire_strikes_back.jpg', 'Rebel Alliance berjuang melawan Kekaisaran Galaksi, sementara Luke Skywalker melanjutkan latihannya dengan Yoda.', 'Irvin Kershner', 'Mark Hamill, Harrison Ford', '1980-05-21', '02:04:00', 'sci-fi'),
('Back to the Future', 'Adventure, Comedy, Science Fiction', 'back_to_the_future.jpg', 'Seorang remaja bepergian ke masa lalu menggunakan mesin waktu dan bertemu orang tuanya yang muda.', 'Robert Zemeckis', 'Michael J. Fox, Christopher Lloyd', '1985-07-03', '01:56:00', 'time-travel'),
('The Avengers', 'Action, Adventure, Science Fiction', 'avengers.jpg', 'Tim superhero berusaha untuk bekerja sama dan melawan ancaman yang mengancam dunia.', 'Joss Whedon', 'Robert Downey Jr., Chris Hemsworth', '2012-05-04', '02:23:00', 'teamwork'),
('The Lord of the Rings: The Return of the King', 'Action, Adventure, Drama', 'lotr_return_of_king.jpg', 'Frodo dan Sam berusaha untuk menghancurkan cincin kekuasaan di Gunung Doom, sementara pasukan Rohan dan Gondor bersatu melawan Sauron.', 'Peter Jackson', 'Elijah Wood, Ian McKellen', '2003-12-17', '03:21:00', 'epic'),
('Pulp Fiction', 'Crime, Drama', 'pulp_fiction.jpg', 'Kisah beberapa karakter yang terhubung melalui serangkaian kejadian kriminal di Los Angeles.', 'Quentin Tarantino', 'John Travolta, Uma Thurman', '1994-10-14', '02:34:00', 'cult'),
('Forrest Gump', 'Drama, Romance', 'forrest_gump.jpg', 'Seorang pria sederhana mengalami berbagai peristiwa besar dalam sejarah Amerika, dari Perang Vietnam hingga Watergate.', 'Eric Roth', 'Tom Hanks, Robin Wright', '1994-07-06', '02:22:00', 'inspirational'),
('Schindler List', 'Biography, Drama, History', 'schindlers_list.jpg', 'Seorang pengusaha Jerman menyelamatkan lebih dari seribu orang Yahudi selama Holocaust.', 'Steven Zaillian', 'Liam Neeson, Ben Kingsley', '1993-12-15', '03:15:00', 'historical'),
('The Departed', 'Crime, Drama, Thriller', 'departed.jpg', 'Seorang polisi menyamar sebagai gangster, sementara seorang gangster menyamar sebagai polisi dalam perjuangan untuk melindungi kota Boston.', 'William Monahan', 'Leonardo DiCaprio, Matt Damon', '2006-10-06', '02:31:00', 'thriller'),
('The Silence of the Lambs', 'Crime, Drama, Thriller', 'silence_of_the_lambs.jpg', 'Seorang agen FBI bekerja sama dengan seorang pembunuh berantai untuk menangkap pembunuh lainnya.', 'Thomas Harris', 'Jodie Foster, Anthony Hopkins', '1991-02-14', '01:58:00', 'psychological'),
('The Prestige', 'Drama, Mystery, Science Fiction', 'prestige.jpg', 'Dua pesulap terlibat dalam persaingan sengit untuk menciptakan trik sulap yang lebih hebat.', 'Jonathan Nolan', 'Christian Bale, Hugh Jackman', '2006-10-20', '02:10:00', 'mystery'),
('The Dark Knight Rises', 'Action, Drama', 'dark_knight_rises.jpg', 'Batman kembali untuk melawan Bane yang berusaha menghancurkan Gotham City.', 'Christopher Nolan', 'Christian Bale, Tom Hardy', '2012-07-20', '02:44:00', 'superhero'),
('The Green Mile', 'Crime, Drama, Fantasy', 'green_mile.jpg', 'Seorang sipir penjara menjalin hubungan dengan seorang terpidana mati yang memiliki kekuatan penyembuhan luar biasa.', 'Frank Darabont', 'Tom Hanks, Michael Clarke Duncan', '1999-12-10', '03:09:00', 'emotional'),
('Interstellar', 'Adventure, Drama, Science Fiction', 'interstellar.jpg', 'Seorang ilmuwan dan timnya melakukan perjalanan antar bintang untuk mencari tempat tinggal baru bagi umat manusia.', 'Jonathan Nolan', 'Matthew McConaughey, Anne Hathaway', '2014-11-07', '02:49:00', 'space'),
('The Wizard of Oz', 'Adventure, Family, Fantasy', 'wizard_of_oz.jpg', 'Seorang gadis muda bertualang ke dunia fantasi untuk menemukan jalan pulang, bertemu teman-teman baru sepanjang perjalanan.', 'L. Frank Baum', 'Judy Garland, Frank Morgan', '1939-08-15', '01:42:00', 'classic'),
('Casablanca', 'Drama, Romance, War', 'casablanca.jpg', 'Seorang pemilik kafe di Casablanca menjadi terlibat dalam perjuangan cinta dan perjuangan melawan Nazi selama Perang Dunia II.', 'Julius J. Epstein', 'Humphrey Bogart, Ingrid Bergman', '1942-11-26', '01:42:00', 'classic'),
('The Shining', 'Horror, Mystery, Thriller', 'shining.jpg', 'Seorang penulis yang sedang mengalami masalah kejiwaan diisolasi bersama keluarganya di hotel terpencil yang penuh dengan kekuatan jahat.', 'Stephen King', 'Jack Nicholson, Shelley Duvall', '1980-05-23', '02:26:00', 'psychological'),
('Fight Club', 'Drama', 'fight_club.jpg', 'Seorang pria yang bosan dengan hidupnya memulai sebuah klub perkelahian bawah tanah yang mengarah pada peristiwa-peristiwa berbahaya.', 'Chuck Palahniuk', 'Brad Pitt, Edward Norton', '1999-10-15', '02:19:00', 'cult'),
('The Godfather: Part II', 'Crime, Drama', 'godfather_part2.jpg', 'Melanjutkan kisah keluarga Corleone, film ini memperlihatkan awal mula perjalanan Michael Corleone menjadi seorang pemimpin mafia.', 'Francis Ford Coppola', 'Al Pacino, Robert De Niro', '1974-12-20', '03:22:00', 'epic'),
('The Princess Bride', 'Adventure, Family, Fantasy', 'princess_bride.jpg', 'Seorang pemuda menceritakan kisah petualangan menakjubkan dengan aksi heroik, cinta, dan persahabatan kepada kakeknya.', 'William Goldman', 'Cary Elwes, Robin Wright', '1987-09-25', '01:38:00', 'classic'),
('The Godfather: Part III', 'Crime, Drama', 'godfather_part3.jpg', 'Michael Corleone berusaha untuk melepaskan diri dari dunia kejahatan dan menghadapi masa lalu keluarganya.', 'Mario Puzo', 'Al Pacino, Diane Keaton', '1990-12-25', '02:42:00', 'mafia'),
('The Revenant', 'Action, Drama, Adventure', 'revenant.jpg', 'Seorang pemburu berjuang untuk bertahan hidup setelah dikhianati dan diserang oleh beruang.', 'Alejandro González Iñárritu', 'Leonardo DiCaprio, Tom Hardy', '2015-12-25', '02:36:00', 'survival'),
('The Social Network', 'Biography, Drama', 'social_network.jpg', 'Kisah pendirian Facebook dan perjuangan Mark Zuckerberg untuk mempertahankan kontrol terhadap perusahaannya.', 'Aaron Sorkin', 'Jesse Eisenberg, Andrew Garfield', '2010-10-01', '02:00:00', 'biography'),
('Mad Max: Fury Road', 'Action, Adventure, Science Fiction', 'mad_max.jpg', 'Seorang wanita berusaha melarikan diri dari tiran di dunia pasca-apokaliptik, dengan bantuan seorang pembawa jalan.', 'George Miller', 'Tom Hardy, Charlize Theron', '2015-05-15', '02:00:00', 'post-apocalyptic'),
('The Usual Suspects', 'Crime, Drama, Mystery', 'usual_suspects.jpg', 'Seorang detektif mencoba mengungkap siapa yang bertanggung jawab atas kejahatan yang melibatkan lima penjahat yang telah berkumpul bersama.', 'Christopher McQuarrie', 'Kevin Spacey, Gabriel Byrne', '1995-08-16', '01:46:00', 'thriller'),
('The Terminator', 'Action, Science Fiction, Thriller', 'terminator.jpg', 'Seorang pembunuh cyborg dikirim kembali ke masa lalu untuk membunuh ibu pemimpin perlawanan manusia.', 'James Cameron', 'Arnold Schwarzenegger, Linda Hamilton', '1984-10-26', '01:47:00', 'action'),
('The Great Gatsby', 'Drama, Romance', 'great_gatsby.jpg', 'Kisah seorang pria misterius yang berusaha meraih kembali cinta lamanya dalam dunia penuh kemewahan dan dekadensi.', 'Baz Luhrmann', 'Leonardo DiCaprio, Carey Mulligan', '2013-05-10', '02:23:00', 'romantic'),
('The Grand Budapest Hotel', 'Comedy, Drama', 'grand_budapest_hotel.jpg', 'Seorang penjaga hotel yang terhormat berjuang untuk membuktikan bahwa dia tidak bersalah atas tuduhan pencurian sebuah lukisan langka.', 'Wes Anderson', 'Ralph Fiennes, F. Murray Abraham', '2014-03-28', '01:39:00', 'quirky'),
('The Martian', 'Adventure, Drama, Science Fiction', 'martian.jpg', 'Seorang astronaut yang terdampar di Mars berjuang untuk bertahan hidup dan mencoba untuk kembali ke Bumi.', 'Drew Goddard', 'Matt Damon, Jessica Chastain', '2015-10-02', '02:24:00', 'survival'),
('Guardians of the Galaxy', 'Action, Adventure, Comedy', 'guardians_of_the_galaxy.jpg', 'Sekelompok individu yang tidak biasa menjadi pahlawan galaksi dengan melawan ancaman besar terhadap alam semesta.', 'James Gunn', 'Chris Pratt, Zoe Saldana', '2014-08-01', '02:01:00', 'superhero');


SELECT movies.id, movies.tittle, movies.genre,
	movies.synopsis, movies.author, movies.actors,
	movies.release_date, movies.duration, cinema.name, 
	cinema_date.name_date, cinema_time.name_time,
	cinema_location.name_location
	FROM movies 
    JOIN cinema ON cinema.movies_id = movies.id
    JOIN cinema_date ON cinema_date.cinema_id = cinema.id
    JOIN cinema_time ON cinema_time.cinema_id = cinema.id
    JOIN cinema_location ON cinema_location.cinema_id = cinema.id
    WHERE movies.id = 1;

select * from orders;

select 

UPDATE users
SET email=$1, password=$2
FROM profile
WHERE users.id=$3
AND users.id = profile.user_id
RETURNING users.email, users.password;

SELECT * from users;