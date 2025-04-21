-- Módulo 2 Codecademy
-- 1. SELECT
/*
Select é utilizado sempre que queremos os dados de uma tabela em específico

Suponhamos que queremos o conteúdo de duas colunas específicas:

SELECT column1, column2 
FROM table_name;

*/
SELECT name, genre, year
FROM movies;

-- 2. As
/*
As é uma keyword utilizada para renomear uma tabela ou coluna usando um apelido, o novo nome deve
ser colocado em single quotes

Quando utilizamos AS, as colunas não estão sendo renomeadas, o apelido aparece apenas no resultado.


*/
SELECT imdb_rating AS 'IMDb'
from movies;

-- 3. Distinct
/*
DISTINCT é utilizado para retornar valores distintos, sem repetição, no resultado da querye, irá
filtrar os valores duplicados e mostrá-los apenas como um. 
*/

SELECT DISTINCT genre
FROM movies;

SELECT DISTINCT year
FROM movies;

-- 4. Where
/*
Podemos limitar nossas query results usando a cláusula WHERE, que irá obter apenas a informação que
queremos.

EX:
SELECT *
FROM movies
WHERE imdb_rating > 8;

Aqui, limitamos os valorres para obter os resultados onde o imdb é maior que 8.
*/

SELECT * 
FROM movies
WHERE imdb_rating < 5;

SELECT *
FROM movies
WHERE year > 2014

-- 5. LIKE 1
/*
LIKE pode ser utilizado quando você quer comparar valores parecidos

ex:
Tabela movies possui dois filmes com titulos similares, Seven e Se7en
Como podemos selecionar todos os filmes que começam com 'Se' e terminam com 'En'?
RESP:
SELECT * 
FROM movies
WHERE name LIKE 'Se_en';

_ Significa que pode ser qualquer letra nesse meio, sem quebrar o padrão.

*/
SELECT * 
FROM movies
WHERE name LIKE 'Se_en';

-- 6. LIKE 2 
/*
O símbulo de % é outro operador que pode ser utilizado com LIKE

Essa query retorna apenas filmes que começam com A:
SELECT * 
FROM movies
WHERE name LIKE 'A%';

A% - retorna todos os filmes que começam com A
%A - retorna todos os filmes que terminam com A
%A% - retorna todos os filmes que contenham a letra A

Serve para palavras também

%man
man%
%man%
*/

SELECT * 
FROM movies
WHERE name LIKE '%man%';

SELECT *
FROM movies
WHERE name LIKE 'The %';

-- 7. Is null
/*
Alguns valores serão nulos ao decorrer do desenvolvimento de tabelas, iremos encontrar muitos dados
ainda com valores desconhecidos

valores desconhecidos são representados pela keyword NULL


Para comparar se o valor é nulo ou não, utilizamos as keywords:

IS NOT NULL
IS NULL

ex:
SELECT name
FROM movies 
WHERE imdb_rating IS NOT NULL;
*/
SELECT name
FROM movies
WHERE imdb_rating IS NULL;


-- 8. Between
/*
O operador BETWEEN é utilizado em cláusulas WHERE para filtrar o resultado baseado em um range, entre
dois valores, numeros, textos ou datas

Por exemplo, essa query retorna filmes entre 1990 e 1999 inclusivo:
SELECT *
FROM movies
WHERE year BETWEEN 1990 AND 1999;

Outro exemplo, nessa query retornariamos filmes que começam de A a I, não incluindo J:
SELECT *
FROM movies
WHERE name BETWEEN 'A' AND 'J';

*/

SELECT *
FROM movies
WHERE name BETWEEN 'D' AND 'G';

SELECT * 
FROM movies
WHERE year BETWEEN 1970 AND 1979;


-- 9. AND
/*
As vezes queremos juntar duas condições em uma cláusula WHERE, é aí que o AND entra em ação.
OBS: As duas condições devem ser verdade para serem realizadas
*/

SELECT * 
FROM movies
WHERE year BETWEEN 1970 AND 1979
AND imdb_rating >8 ;

SELECT * 
FROM movies
WHERE year < 1985 
AND genre == 'horror';


-- 10. OR
/*
Também utilizada como filtro, quando uma das condições for estabelecida (verdadeira), o resultado será
obtido.
*/

SELECT *
FROM movies
WHERE year > 2014
   OR genre = 'action';


SELECT *
FROM movies
WHERE genre == 'romance'
OR genre == 'comedy'

--11. ORDER BY
/*
O ORDER BY é utilizado quando queremos mostrar nosso resultado ordenado por uma ordem específica,
organizando os dados torna mais fácil de realizar análises nos dados e torná-los mais úteis

EX:
SELECT *
FROM movies
WHERE imdb_rating > 8
ORDER BY year DESC;

DESC - Descendente
ASC - Ascendente

OBS: ORDER BY sempre vem após o WHERE (se estiver presente)
*/

SELECT name, year
FROM movies
ORDER BY name;


SELECT name, year, imdb_rating
FROM movies
ORDER BY imdb_rating DESC;


-- 12. LIMIT
/*
SQL Table há muitos dados, então pode ser útil limitar a quantidade de dados que virá com LIMIT;
*/

SELECT *
FROM movies
ORDER BY imdb_rating DESC
LIMIT 3;

-- 13. CASE
/*
CASE nos permite testar difentes tipos de outputs

Vamos supor que quero condensar os ratings da tabela movies em três niveis
Se o filme ter nota > 8 é fantastico
se o filme tiver nota > 6 é aceitável
menor que isso, evitar

SELECT name,
 CASE
  WHEN imdb_rating > 8 THEN 'Fantastic'
  WHEN imdb_rating > 6 THEN 'Poorly Received'
  ELSE 'Avoid at All Costs'
 END
FROM movies;

OBS: é recomendado utilizar o AS, para dar um apelido à coluna que virá, pois, ela virá com nome
muito grande
*/

SELECT name,
CASE 
  WHEN genre = 'romance' THEN 'Chill'
  WHEN genre = 'comedy' THEN 'Chill'
  ELSE 'Intense'
END AS 'Mood'
FROM movies;
