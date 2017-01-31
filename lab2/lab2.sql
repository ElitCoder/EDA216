PRAGMA foreign_keys=OFF;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS theaters;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS performances;
DROP TABLE IF EXISTS reservations;

PRAGMA foreign_keys=ON;

CREATE TABLE users (
    username    VARCHAR(32) NOT NULL,
    address     VARCHAR(32),
    name        VARCHAR(32) NOT NULL,
    tel_nbr     VARCHAR(16) NOT NULL,
    PRIMARY KEY (username)
);

CREATE TABLE theaters (
    name        VARCHAR(32) NOT NULL,
    seats       INT         NOT NULL,
    PRIMARY KEY (name, seats)
);

CREATE TABLE movies (
    name        VARCHAR(32) NOT NULL,
    PRIMARY KEY (name)
);

CREATE TABLE performances (
    date        DATE NOT NULL,
    movie_name  VARCHAR(32) NOT NULL,
    theater_name    VARCHAR(32) NOT NULL,
    theater_seats   INT NOT NULL,
    PRIMARY KEY (date),
    FOREIGN KEY (movie_name) references movies(name),
    FOREIGN KEY (theater_name, theater_seats) references theaters(name,seats)
);

CREATE TABLE reservations (
    reservation_number  INT,
    movie_name          VARCHAR(32) NOT NULL,
    date                DATE NOT NULL,
    PRIMARY KEY (reservation_number),
    FOREIGN KEY (movie_name) references movies(name),
    FOREIGN KEY (date) references performances(date)
);

INSERT INTO users           VALUES('jacka', 'Lund', 'NickoYeah', '112');

INSERT INTO theaters        VALUES('SF', 2);

INSERT INTO movies          VALUES('Kung Fu Hustle');

INSERT INTO performances    VALUES('2017-02-01', 'Kung Fu Hustle', 'SF', 2);

INSERT INTO reservations    VALUES(NULL, 'Kung Fu Hustle', '2017-02-01');
