CREATE DATABASE videogames;
USE videogames;

CREATE TABLE Developers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100)
);

CREATE TABLE Genres (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Platforms (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    type ENUM('console', 'pc', 'mobile', 'handheld') NOT NULL
);

CREATE TABLE Games (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    release_date DATE,
    price DECIMAL(10,2) NOT NULL,
    developer_id INT NOT NULL,
    genre_id INT NOT NULL,
    FOREIGN KEY (developer_id) REFERENCES Developers(id),
    FOREIGN KEY (genre_id) REFERENCES Genres(id)
);

CREATE TABLE Game_platforms (
    id INT PRIMARY KEY AUTO_INCREMENT,
    game_id INT NOT NULL,
    platform_id INT NOT NULL,
    release_date DATE,
    price_per_platform DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (game_id) REFERENCES Games(id) ON DELETE CASCADE,
    FOREIGN KEY (platform_id) REFERENCES Platforms(id),
    UNIQUE KEY unique_game_platform (game_id, platform_id)
);

INSERT INTO Developers (name, country) VALUES
('Nintendo EPD', 'Japan'),
('Rockstar Games', 'USA'),
('CD Projekt RED', 'Poland'),
('Valve Corporation', 'USA');

INSERT INTO Genres (name) VALUES
('Action'),
('Adventure'),
('RPG'),
('Sports'),
('Racing'),
('FPS');

INSERT INTO Platforms (name, type) VALUES
('Nintendo Switch', 'console'),
('PlayStation 5', 'console'),
('Xbox Series X', 'console'),
('PC', 'pc'),
('Steam Deck', 'handheld');

INSERT INTO Games (name, release_date, price, developer_id, genre_id) VALUES
('The Legend of Zelda: Breath of the Wild', '2017-03-03', 59.99, 1, 2),
('Grand Theft Auto V', '2013-09-17', 29.99, 2, 1),
('The Witcher 3', '2015-05-19', 39.99, 3, 3),
('Portal 2', '2011-04-19', 19.99, 4, 1);

INSERT INTO Game_platforms (game_id, platform_id, release_date, price_per_platform) VALUES
-- Zelda solo en Switch
(1, 1, '2017-03-03', 59.99),

-- GTA V en múltiples plataformas
(2, 2, '2014-11-18', 29.99), -- PS5
(2, 3, '2014-11-18', 29.99), -- Xbox Series X
(2, 4, '2015-04-14', 29.99), -- PC

-- The Witcher 3 en múltiples plataformas
(3, 1, '2019-10-15', 59.99), -- Nintendo Switch
(3, 2, '2015-05-19', 39.99), -- PS5
(3, 3, '2015-05-19', 39.99), -- Xbox Series X
(3, 4, '2015-05-19', 39.99), -- PC

-- Portal 2 en múltiples plataformas
(4, 2, '2011-04-19', 19.99), -- PS5
(4, 3, '2011-04-19', 19.99), -- Xbox Series X
(4, 4, '2011-04-19', 19.99); -- PC

SELECT
    g.name as juego,
    g.release_date as lanzamiento,
    g.price as precio_base,
    d.name as desarrollador,
    gen.name as genero
FROM Games g
JOIN Developers d ON g.developer_id = d.id
JOIN Genres gen ON g.genre_id = gen.id;

SELECT g.name as juego, p.name as plataforma, gp.release_date as fecha_lanzamiento_plataforma, gp.price_per_platform as precio_en_plataforma
FROM Games g
JOIN Game_platforms gp ON g.id = gp.game_id
JOIN Platforms p ON gp.platform_id = p.id
ORDER BY g.name, p.name;

SELECT d.name as desarrollador, d.country as pais, COUNT(g.id) as total_juegos
FROM Developers d
LEFT JOIN Games g ON d.id = g.developer_id
GROUP BY d.id, d.name, d.country;