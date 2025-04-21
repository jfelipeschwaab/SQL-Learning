-- Módulo 3 CodeCademy Aggregate Functions
-- 1. COUNT
/*
A maneira mais fácil de descobrir a quantidade de fileiras em uma tabela é com o
método COUNT

COUNT utiliza o nome da coluna (ou todas) e conta suas fileiras

Você também pode dar condições para ser realizado um filtro na contagem
*/

SELECT COUNT(*) 
FROM fake_apps;

SELECT COUNT(*) 
FROM fake_apps
WHERE price = 0;

-- 2. SUM
/*
SUM Retorna a soma de todos os valores de uma coluna.
*/

SELECT SUM(downloads)
FROM fake_apps;

-- 3. MAX & MIN
-- Retorna o maior valor e o menor valor de uma coluna, respectivamente.
SELECT MIN(downloads)
FROM fake_apps;

SELECT MAX(price)
FROM fake_apps;

-- 4. AVERAGE 
-- AVG retorna a média total de uma coluna e todos seus valores

SELECT AVG(downloads)
FROM fake_apps;

SELECT AVG(price)
FROM fake_apps;

-- 5. ROUND
/*
Por padrão, o SQL Tenta ser o mais específico possível, sem arredondar valores, contudo, as vezes
esses valores ficam difíceis de serem lidos, mas conseguimos deixá-los fáceis de serem lidos mediante
à Funcão ROUND

ROUND precisa de 2 argumentos
1. Coluna
2. Um inteiro

Esse inteiro irá representar a quantidade de números após a vírgula, ou seja, as casas decimais
*/
SELECT name, ROUND(price, 0)
FROM fake_apps;

SELECT ROUND(AVG(price), 2)
FROM fake_apps;

--6. GROUP BY 1
/*
Muitas das vezes, vamos querer dados agrupados de uma maneira específica

Por exemplo, se quisermos a média imdb dos filmes por ano, teríamos que fazer inúmeras cláusulas
com WHERE, entretanto, o GROUP BY facilita nossa vida nisso.

OBS: GROUP BY sempre vem após WHERE e antes de LIMIT ou ORDER BY
*/
SELECT price, COUNT(*) 
FROM fake_apps
GROUP BY price;

SELECT price, COUNT(*) 
FROM fake_apps
WHERE downloads > 20000
GROUP BY price;

SELECT category, SUM(downloads)
FROM fake_apps
GROUP BY category;

-- 7. GROUP BY 2
/*
Algumas vezes, iremos querer agrupar por cálculos feitos na coluna

Por exemplo, se quisermos saber quantos filmes tem imdb 1,2,3,4,5 arredondados, poderiamos fazer
com essa query:

SELECT ROUND(imdb_rating),
   COUNT(name)
FROM movies
GROUP BY ROUND(imdb_rating)
ORDER BY ROUND(imdb_rating);

Contudo, está muito verboso e, consequentemente, suscetível à erros

SQL Nos permite usar um shortcut na cláusula GROUP BY, onde podemos referenciar a coluna selecionada
por um número.

1 é a primeira coluna selecionada
2..
3...

EX:
SELECT ROUND(imdb_rating),
   COUNT(name)
FROM movies
GROUP BY 1
ORDER BY 1;

Aqui, seria a mesma coisa de escrever ROUND(imdb_rating)

*/
SELECT category, price, AVG(downloads)
FROM fake_apps
GROUP BY 1, 2;


-- 8. HAVING
/*
Além de agrupar dados de forma específica, SQL te permite escolher quais
dados você quer excluir ou que fiquem

Por exemplo, se quisermos saber quais gêneros de filmes foram mais produzidos em um ano, entretanto,
nos importamos apenas com os generos que tem +10 filmes.

Não conseguimos usar o WHERE, pois, não queremos filtrar fileiras, e sim, grupos

HAVING é bem parecido com WHERE, de fato, tudo que aprendemos pode ser utilizado no HAVING

ex:
SELECT year,
   genre,
   COUNT(name)
FROM movies
GROUP BY 1, 2
HAVING COUNT(name) > 10;

*/

SELECT price, ROUND(AVG(downloads)) AS downloads, COUNT(*) AS Count
FROM fake_apps
GROUP BY price
HAVING COUNT(*) > 10;
