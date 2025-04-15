-- Cria tabela friends
CREATE TABLE friends (
    id INTEGER PRIMARY KEY,
    name TEXT,
    birthday DATE
);

-- Adiciona Amigo
INSERT INTO friends(id,name,birthday)
VALUES(1, "Ororo Munroe", "1940-05-30");

-- Visualizar tabela
SELECT * FROM friends;

-- Adiciona mais 2 amigos
INSERT INTO friends(id,name,birthday)
VALUES(2, "Juliane Schwaab", "1979-06-12");
INSERT INTO friends(id,name,birthday)
VALUES(3, "Beatriz Schwaab", "1999-09-28");

-- Atualiza uma linha da tabela, aqui no caso, um nome
UPDATE friends
SET name = "Storm"
WHERE id = 1;
SELECT * FROM friends;


-- Cria uma nova coluna, aqui no caso, e-mail
ALTER TABLE friends
ADD COLUMN email TEXT;

--Atualizando os e-mails
UPDATE friends
SET email = 'storm@codecademy.com'
WHERE id = 1;

UPDATE friends
SET email = 'juliane@gmail.com'
WHERE id = 2;

UPDATE friends
SET email = 'bia@gmail.com'
WHERE id = 3;

-- Visualizando a tabela
SELECT * FROM friends;

-- Deletando uma linha
DELETE FROM friends
WHERE id = 1;

-- Visualizando a tabela
SELECT * FROM friends;







