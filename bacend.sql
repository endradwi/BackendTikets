DROP table cinema_date, cinema_location, cinema_time, cinemas, movies;


SELECT profile.first_name, orders.id, cinemas.name , movies.tittle 
from profile 
full OUTER JOIN orders ON orders.profile_id = profile.id
full OUTER JOIN cinemas ON cinemas.id = orders.cinema_id
full OUTER JOIN movies ON movies.id = orders.movie_id
;

drop table cinemas;

INSERT INTO movie (tittle, genre, images, synopsis,
	author, actors, release_date, duration, tag) 
	VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
	RETURNING id, tittle, genre, images, synopsis,
	author, actors, release_date, duration, tag;


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
SELECT users.id, profile.first_name, profile.last_name,
       profile.image, profile.phone_number, users.email, users.password
	FROM users
	JOIN profile ON profile.user_id = users.id 
	WHERE users.id = $1;
SELECT * FROM profile;
SELECT * FROM USERS;
ALTER TABLE profile ADD phone_number int;
ALTER TABLE profile ADD point int;
    SELECT profile.id, profile.first_name, profile.last_name, profile.phone_number,
           users.email, users.password
    FROM profile
    JOIN users ON users.id = profile.user_id
    WHERE profile.user_id = $1;

drop table profile;
DROP Table users;

DROP TABLE orders;
CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    profile_id INT REFERENCES profile(id),
    movie_id INT REFERENCES movies(id),
    cinema_id INT REFERENCES cinema(id),
    seat_id INT REFERENCES seat(id),
    date DATE,
    qty INT,
    total_price INT,
    payment_id int REFERENCES payment_method(id),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP
);

SELECT users.id, profile.first_name, profile.last_name, profile.image, users.email, users.password
FROM profile
JOIN users ON users.id = profile.user_id
ORDER BY users.id DESC;

drop table ORDERS;
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
    movies_id INT REFERENCES movies(id),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP
)
CREATE TABLE cinema (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    movies_id INT REFERENCES movies(id)
);

INSERT INTO cinema (name, movies_id) VALUES
('Cinepolis Mega Bekasi', 1),
('CGV Grand Indonesia', 2),
('Cinemaxx Lippo Mall Puri', 3),
('XXI Plaza Indonesia', 4),
('Cineworld Mall Kelapa Gading', 5),
('CGV Pacific Place', 6),
('Cinema XXI Tunjungan Plaza', 7),
('Cinemaxx Surabaya', 8),
('CGV Cinere Mall', 9),
('Cinepolis Palembang', 10),
('XXI Mall of Indonesia', 11),
('CGV Blok M Square', 12),
('Cinemaxx Transmart Carrefour', 13),
('Cinema XXI Semanggi', 14),
('CGV Central Park', 15),
('Cinepolis Jakarta Garden City', 16),
('XXI Grand City Mall Surabaya', 17),
('Cinemaxx Park 23 Bali', 18),
('CGV Bogor Trade Mall', 19),
('Cinepolis Cilandak Town Square', 20),
('Cinemaxx Festival City Link Bandung', 21),
('CGV Epiwalk Mall', 22),
('Cinepolis Dago Plaza Bandung', 23),
('XXI Supermall Karawaci', 24),
('CGV Mall Kota Kasablanka', 25),
('Cinemaxx Mall Ciputra Cibubur', 26),
('Cinepolis Trans Studio Mall Makassar', 27),
('XXI Paris Van Java Bandung', 28),
('Cinepolis Bandung Supermall', 29),
('CGV La Piazza Mall', 30),
('Cinemaxx Living World Alam Sutera', 31),
('CGV Grand Indonesia', 32),
('Cinemaxx Lippo Mall Puri', 33),
('XXI Plaza Indonesia', 34),
('Cineworld Mall Kelapa Gading', 35),
('CGV Pacific Place', 36),
('Cinema XXI Tunjungan Plaza', 37),
('Cinemaxx Surabaya', 38),
('CGV Cinere Mall', 39),
('Cinepolis Palembang', 40),
('XXI Mall of Indonesia', 1),
('CGV Blok M Square', 2),
('Cinemaxx Transmart Carrefour', 3),
('Cinema XXI Semanggi', 4),
('CGV Central Park', 5),
('Cinepolis Jakarta Garden City', 6),
('XXI Grand City Mall Surabaya', 7),
('Cinemaxx Park 23 Bali', 8),
('CGV Bogor Trade Mall', 9),
('Cinepolis Cilandak Town Square', 10),
('Cinemaxx Festival City Link Bandung', 11),
('CGV Epiwalk Mall', 12),
('Cinepolis Dago Plaza Bandung', 13),
('XXI Supermall Karawaci', 14),
('CGV Mall Kota Kasablanka', 15),
('Cinemaxx Mall Ciputra Cibubur', 16),
('Cinepolis Trans Studio Mall Makassar', 17),
('XXI Paris Van Java Bandung', 18),
('Cinepolis Bandung Supermall', 19),
('CGV La Piazza Mall', 20),
('Cinemaxx Living World Alam Sutera', 21);

select * from movies;

SELECT movies.id, movies.tittle, movies.genre,
	movies.images, cinema.cinema_time, cinema.name, 
	cinema.cinema_date, cinema.cinema_location
	FROM cinema 
    JOIN movies ON cinema.movies_id = movies.id
    WHERE movies.id = $1 AND cinema.name ILIKE $2 
    AND cinema.cinema_date LIKE $3 AND cinema.cinema_time LiKE $4 
    AND cinema.cinema_location ILIKE $5

drop table cinema_date, cinema_location, cinema_time;

drop table cinema;
drop Table seat;

INSERT INTO orders(profile_id, movie_id, cinema_id, total_price, qty) VALUES (154, 1, 1, 10000, 2);


SELECT price FROM cinema WHERE id = $1;
select * from cinema;

SELECT * from movies;

CREATE TABLE cinema_date(
    id SERIAL PRIMARY KEY,
    name_date VARCHAR(11),
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
    ('2025-02-09', 40),
    ('2025-02-10', 41),
    ('2025-02-11', 42),
    ('2025-02-12', 43),
    ('2025-02-13', 44),
    ('2025-02-14', 45),
    ('2025-02-15', 46),
    ('2025-02-16', 47),
    ('2025-02-17', 48),
    ('2025-02-18', 49),
    ('2025-02-19', 50),
    ('2025-01-01', 51),
    ('2025-01-02', 52),
    ('2025-01-03', 53),
    ('2025-01-04', 54),
    ('2025-01-05', 55),
    ('2025-01-06', 56),
    ('2025-01-07', 57),
    ('2025-01-08', 58),
    ('2025-01-09', 59),
    ('2025-01-10', 60),
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
    ('2025-02-18', 39),
    ('2025-02-19', 40);


drop table cinema_date;

select * from cinema_date;

CREATE TABLE cinema_time(
    id SERIAL PRIMARY KEY,
    name_time VARCHAR(10),
    cinema_id int REFERENCES cinema(id),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP 
);
INSERT INTO cinema_time (name_time, cinema_id)
VALUES
    ('10:00:00', 50),
    ('12:00:00', 50),
    ('14:00:00', 50),
    ('16:00:00', 50),
    ('18:00:00', 50),
    ('20:00:00', 50),
    ('22:00:00', 50),
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
    ('22:00:00', 39),
    ('10:00:00', 40),
    ('12:00:00', 40),
    ('14:00:00', 40),
    ('16:00:00', 40),
    ('18:00:00', 40),
    ('20:00:00', 40),
    ('22:00:00', 40),
    ('10:00:00', 41),
    ('12:00:00', 41),
    ('14:00:00', 41),
    ('16:00:00', 41),
    ('18:00:00', 41),
    ('20:00:00', 41),
    ('22:00:00', 41),
    ('10:00:00', 42),
    ('12:00:00', 42),
    ('14:00:00', 42),
    ('16:00:00', 42),
    ('18:00:00', 42),
    ('20:00:00', 42),
    ('22:00:00', 42),
    ('10:00:00', 43),
    ('12:00:00', 43),
    ('14:00:00', 43),
    ('16:00:00', 43),
    ('18:00:00', 43),
    ('20:00:00', 43),
    ('22:00:00', 43),
    ('10:00:00', 44),
    ('12:00:00', 44),
    ('14:00:00', 44),
    ('16:00:00', 44),
    ('18:00:00', 44),
    ('20:00:00', 44),
    ('22:00:00', 44),
    ('10:00:00', 45),
    ('12:00:00', 45),
    ('14:00:00', 45),
    ('16:00:00', 45),
    ('18:00:00', 45),
    ('20:00:00', 45),
    ('22:00:00', 45),
    ('10:00:00', 46),
    ('12:00:00', 46),
    ('14:00:00', 46),
    ('16:00:00', 46),
    ('18:00:00', 46),
    ('20:00:00', 46),
    ('22:00:00', 46),
    ('10:00:00', 47),
    ('12:00:00', 47),
    ('14:00:00', 47),
    ('16:00:00', 47),
    ('18:00:00', 47),
    ('20:00:00', 47),
    ('22:00:00', 47),
    ('10:00:00', 48),
    ('12:00:00', 48),
    ('14:00:00', 48),
    ('16:00:00', 48),
    ('18:00:00', 48),
    ('20:00:00', 48),
    ('22:00:00', 48),
    ('10:00:00', 49),
    ('12:00:00', 49),
    ('14:00:00', 49),
    ('16:00:00', 49),
    ('18:00:00', 49),
    ('20:00:00', 49),
    ('22:00:00', 49),
    ('10:00:00', 50),
    ('12:00:00', 50),
    ('14:00:00', 50),
    ('16:00:00', 50),
    ('18:00:00', 50),
    ('20:00:00', 50),
    ('22:00:00', 50);

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
('Blitar', 39),
('Lhokseumawe', 40),
('Cilegon', 41),
('Purwakarta', 42),
('Banjarbaru', 43),
('Sleman', 44),
('Bontang', 45),
('Ponorogo', 46),
('Magelang', 47),
('Cianjur', 48),
('Sukabumi', 49),
('Rembang', 50);
	SELECT movies.id, movies.tittle, movies.genre,
	movies.images, cinema.name, cinema_time.name_time,
	cinema_date.name_date, cinema_location.name_location
	FROM cinema 
    JOIN movies ON cinema.movies_id = movies.id
	JOIN cinema_time ON cinema_time.cinema_id = cinema.id
	JOIN cinema_date ON cinema_date.cinema_id = cinema.id
	JOIN cinema_location ON cinema_location.cinema_id = cinema.id
    WHERE movies.id = $1 AND cinema_time.name_time = $2
	AND cinema_date.name_date = $3 AND cinema_location.name_location ILIKE $4

SELECT profile.id, orders.profile_id, orders.movie_id, movies.tittle,
	movies.genre, movies.images, cinema.name, 
	FORM profile
	JOIN orders ON orders.profile_id = profile.id
	-- JOIN movies ON movies.id = orders.movie_id
	-- JOIN cinema ON cinema.id = ordes_cinema_id
	WHERE profile.id = 1;

SELECT profile.first_name, orders.profile_id, orders.movie_id,
movies.tittle, movies.genre, movies.images, cinema.name
from profile
JOIN orders ON orders.profile_id = profile.id
JOIN movies ON movies.id = orders.movie_id
JOIN cinema ON cinema.id = orders.cinema_id
WHERE profile.id = 1
;

CREATE TABLE seat (
    id serial PRIMARY KEY,
    name varchar(3),
    price INT,
    cinema_id INT REFERENCES cinema(id),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP
);
DROP table seat;


SELECT count(seat_id) as seat_id  From orders 
WHERE id = $1;

SELECT * from users;
TRUNCATE TABLE seat;
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
('G2', 15000, 1),('G3', 15000, 1),('G4', 15000, 1),('G5', 15000, 1),('G6', 15000, 1);
('G7', 15000, 1),('G8', 15000, 1),('G9'), 15000, 1,('G10', 15000, 1),('G10', 15000, 1),
('G11', 15000, 1),('G12', 15000, 1),('G13', 15000, 1),('G14', 15000, 1);



CREATE TABLE payment_method (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP
);

INSERT INTO payment_method (name) VALUES
('Goggle Pay'), ('Visa'), ('Gopay'), ('Pay Pal'),
('Dana'), ('Bank BCA'), ('Bank BRI'), ('OVO');
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

INSERT INTO users (email, password) VALUES
('john.doe@example.com', 'password123'),
('jane.smith@example.com', 'password123'),
('michael.brown@example.com', 'password123'),
('emily.jones@example.com', 'password123'),
('chris.davis@example.com', 'password123'),
('sarah.miller@example.com', 'password123'),
('david.moore@example.com', 'password123'),
('mary.taylor@example.com', 'password123'),
('robert.anderson@example.com', 'password123'),
('lisa.thomas@example.com', 'password123'),
('james.jackson@example.com', 'password123'),
('patricia.white@example.com', 'password123'),
('charles.harris@example.com', 'password123'),
('joseph.martin@example.com', 'password123'),
('jennifer.lee@example.com', 'password123'),
('mark.young@example.com', 'password123'),
('nancy.king@example.com', 'password123'),
('kevin.green@example.com', 'password123'),
('daniel.adams@example.com', 'password123'),
('susan.carter@example.com', 'password123'),
('william.hernandez@example.com', 'password12'),
('barbara.martinez@example.com', 'password123'),
('david.garcia@example.com', 'password123'),
('linda.rodriguez@example.com', 'password123'),
('george.wilson@example.com', 'password123'),
('elizabeth.moore@example.com', 'password123'),
('joseph.taylor@example.com', 'password123'),
('martha.jackson@example.com', 'password123'),
('nicholas.johnson@example.com', 'password123'),
('christopher.brown@example.com', 'password123'),
('jacqueline.martin@example.com', 'password123'),
('george.clark@example.com', 'password123'),
('melissa.wright@example.com', 'password123'),
('susan.garcia@example.com', 'password123'),
('daniel.kim@example.com', 'password123'),
('julia.martinez@example.com', 'password123'),
('aaron.williams@example.com', 'password123'),
('heather.perez@example.com', 'password123'),
('roberto.smith@example.com', 'password123'),
('laura.johnson@example.com', 'password123'),
('joseph.smith@example.com', 'password123'),
('anna.white@example.com', 'password123'),
('brian.miller@example.com', 'password123'),
('lisa.davis@example.com', 'password123'),
('john.morris@example.com', 'password123'),
('susan.kelly@example.com', 'password123'),
('stephen.smith@example.com', 'password123'),
('lisa.campbell@example.com', 'password123'),
('jackson.evans@example.com', 'password123'),
('olivia.jenkins@example.com', 'password123'),
('elizabeth.sullivan@example.com', 'password10'),
('benjamin.wood@example.com', 'password123'),
('rachel.lee@example.com', 'password123'),
('ethan.owen@example.com', 'password123'),
('zoe.adams@example.com', 'password123'),
('rachel.morris@example.com', 'password123'),
('louis.james@example.com', 'password123'),
('michelle.harris@example.com', 'password123'),
('nathan.wilson@example.com', 'password123'),
('laura.jameson@example.com', 'password123'),
('victor.carter@example.com', 'password123'),
('cheryl.roberts@example.com', 'password123'),
('olivia.morris@example.com', 'password123'),
('grace.hernandez@example.com', 'password123'),
('henry.king@example.com', 'password123'),
('elizabeth.carter@example.com', 'password123'),
('joseph.brown@example.com', 'password123');

select * from profile;
INSERT INTO profile (first_name, last_name, image, user_id) VALUES
('John', 'Doe', 'https://example.com/images/john_doe.jpg', 1);

INSERT INTO profile (first_name, last_name, image, user_id) VALUES
('John', 'Doe', 'https://example.com/images/john_doe.jpg', 1),
('Jane', 'Smith', 'https://example.com/images/jane_smith.jpg', 2),
('Michael', 'Brown', 'https://example.com/images/michael_brown.jpg', 3),
('Emily', 'Jones', 'https://example.com/images/emily_jones.jpg', 4),
('Chris', 'Davis', 'https://example.com/images/chris_davis.jpg', 5),
('Sarah', 'Miller', 'https://example.com/images/sarah_miller.jpg', 6),
('David', 'Moore', 'https://example.com/images/david_moore.jpg', 7),
('Mary', 'Taylor', 'https://example.com/images/mary_taylor.jpg', 8),
('Robert', 'Anderson', 'https://example.com/images/robert_anderson.jpg', 9),
('Lisa', 'Thomas', 'https://example.com/images/lisa_thomas.jpg', 10),
('James', 'Jackson', 'https://example.com/images/james_jackson.jpg', 11),
('Patricia', 'White', 'https://example.com/images/patricia_white.jpg', 12),
('Charles', 'Harris', 'https://example.com/images/charles_harris.jpg', 13),
('Joseph', 'Martin', 'https://example.com/images/joseph_martin.jpg', 14),
('Jennifer', 'Lee', 'https://example.com/images/jennifer_lee.jpg', 15),
('Mark', 'Young', 'https://example.com/images/mark_young.jpg', 16),
('Nancy', 'King', 'https://example.com/images/nancy_king.jpg', 17),
('Kevin', 'Green', 'https://example.com/images/kevin_green.jpg', 18),
('Daniel', 'Adams', 'https://example.com/images/daniel_adams.jpg', 19),
('Susan', 'Carter', 'https://example.com/images/susan_carter.jpg', 20),
('William', 'Hernandez', 'https://example.com/images/william_hernandez.jpg', 21),
('Barbara', 'Martinez', 'https://example.com/images/barbara_martinez.jpg', 22),
('David', 'Garcia', 'https://example.com/images/david_garcia.jpg', 23),
('Linda', 'Rodriguez', 'https://example.com/images/linda_rodriguez.jpg', 24),
('George', 'Wilson', 'https://example.com/images/george_wilson.jpg', 25),
('Elizabeth', 'Moore', 'https://example.com/images/elizabeth_moore.jpg', 26),
('Joseph', 'Taylor', 'https://example.com/images/joseph_taylor.jpg', 27),
('Martha', 'Jackson', 'https://example.com/images/martha_jackson.jpg', 28),
('Nicholas', 'Johnson', 'https://example.com/images/nicholas_johnson.jpg', 29),
('Christopher', 'Brown', 'https://example.com/images/christopher_brown.jpg', 30),
('Jacqueline', 'Martin', 'https://example.com/images/jacqueline_martin.jpg', 31),
('George', 'Clark', 'https://example.com/images/george_clark.jpg', 32),
('Melissa', 'Wright', 'https://example.com/images/melissa_wright.jpg', 33),
('Susan', 'Garcia', 'https://example.com/images/susan_garcia.jpg', 34),
('Daniel', 'Kim', 'https://example.com/images/daniel_kim.jpg', 35),
('Julia', 'Martinez', 'https://example.com/images/julia_martinez.jpg', 36),
('Aaron', 'Williams', 'https://example.com/images/aaron_williams.jpg', 37),
('Heather', 'Perez', 'https://example.com/images/heather_perez.jpg', 38),
('Roberto', 'Smith', 'https://example.com/images/roberto_smith.jpg', 39),
('Laura', 'Johnson', 'https://example.com/images/laura_johnson.jpg', 40),
('Joseph', 'Smith', 'https://example.com/images/joseph_smith.jpg', 41),
('Anna', 'White', 'https://example.com/images/anna_white.jpg', 42),
('Brian', 'Miller', 'https://example.com/images/brian_miller.jpg', 43),
('Lisa', 'Davis', 'https://example.com/images/lisa_davis.jpg', 44),
('John', 'Morris', 'https://example.com/images/john_morris.jpg', 45),
('Susan', 'Kelly', 'https://example.com/images/susan_kelly.jpg', 46),
('Stephen', 'Smith', 'https://example.com/images/stephen_smith.jpg', 47),
('Lisa', 'Campbell', 'https://example.com/images/lisa_campbell.jpg', 48),
('Jackson', 'Evans', 'https://example.com/images/jackson_evans.jpg', 49),
('Olivia', 'Jenkins', 'https://example.com/images/olivia_jenkins.jpg', 50),
('William', 'Reed', 'https://example.com/images/william_reed.jpg', 51),
('Charlotte', 'Baker', 'https://example.com/images/charlotte_baker.jpg', 52),
('George', 'King', 'https://example.com/images/george_king.jpg', 53),
('Isabella', 'Scott', 'https://example.com/images/isabella_scott.jpg', 54),
('Samuel', 'Adams', 'https://example.com/images/samuel_adams.jpg', 55),
('Lily', 'Martinez', 'https://example.com/images/lily_martinez.jpg', 56),
('Matthew', 'Lee', 'https://example.com/images/matthew_lee.jpg', 57),
('Sophia', 'Allen', 'https://example.com/images/sophia_allen.jpg', 58),
('Henry', 'Hall', 'https://example.com/images/henry_hall.jpg', 59),
('Grace', 'Bennett', 'https://example.com/images/grace_bennett.jpg', 60);

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