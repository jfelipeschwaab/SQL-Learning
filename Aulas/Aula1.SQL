/*
CODECADEMY MÓDULO 1

1. CREATE TABLE STATEMENT

O Statement CREATE TABLE Permite-nos criar uma nova tabela no SQL


Sintaxe: CREATE TABLE nome (
    column1 TYPE,
    colum2 TYPE,
    colum3 TYPE
);

SQL NECESSITA DE ; NO FINAL
*/
CREATE TABLE celebs (
    id INTEGER,
    name TEXT,
    age INTEGER
);

/*
2. INSERT INTO tableName(params)
VALUES(x,y,z)

Esse comando é utilizado para inserir informações na tabela escolhida
*/
INSERT INTO celebs (id, name, age)
VALUES (1, 'Justin Bieber', 22);
INSERT INTO celebs (id, name, age)
VALUES (2, 'Beyonce Knowles', 33);
INSERT INTO celebs (id, name, age)
VALUES (3, 'Jeremy Lin', 26);
INSERT INTO celebs (id, name, age)
VALUES (4, 'Taylor Swift', 26);


/*
3. SELECT Statement

O Comando SELECT é uma cláusula que indica que o statement é uma Query. Você utilizará SELECT toda
vez que der uma query em dados de uma tabela em específico.

SELECT * FROM celebs; utilizada para selecionar todas as colunas de uma tabela específica

*/
SELECT * FROM celebs;
SELECT name FROM celebs;

/*
4. ALTER TABLE Statement
O comando ALTER TABLE é utilizado para adicionar uma nova coluna na tabela

ALTER TABLE tableName 
ADD COLUMN columnName TYPE;

*/

ALTER TABLE celebs 
ADD COLUMN twitter_handle TEXT;


/*
5. UPDATE Statement

O comando UPDATE edita uma linha na tabela, você utiliza esse comando quando quer editar algo
de alguma informação que foi já colocada

Sintaxe: 
UPDATE table
SET coluna = novaInformação
WHERE parametro;
*/

UPDATE celebs
SET twitter_handle = '@taylorswift13'
WHERE id = 4;
SELECT * FROM celebs


/*
6. DELETE FROM Statement

Esse comando deleta uma ou mais fileiras de uma tabela, baseado em uma condição
Ex:
DELETE FROM celebs 
WHERE twitter_handle IS NULL;

**A Cláusula WHERE que determina a condição a ser estabelecida

*/
DELETE FROM celebs
WHERE twitter_handle IS NULL;
SELECT * FROM celebs


/*
7. CONSTRAINTS

Constraints são parâmetros que colocamos em nossas colunas, onde estabelecemos regras para que aquela
coluna seja criada, ou seja, se não atingir os parâmetros necessários, a coluna não irá existir

EX:
CREATE TABLE celebs (
   id INTEGER PRIMARY KEY, 
   name TEXT UNIQUE,
   date_of_birth TEXT NOT NULL,
   date_of_death TEXT DEFAULT 'Not Applicable'
);


Aqui colocamos algumas Constraints:
PRIMARY KEY = Essa coluna será a chave primária da entidade que será criada na tabela
UNIQUE = Não pode existir outro com este nome
NOT NULL = Não pode ser nulo
DEFAULT = Estabelece um valor padrão, caso nenhum valor tenha sido estabelecido.
*/
CREATE TABLE awards (
  id INTEGER PRIMARY KEY,
  recipient TEXT NOT NULL,
  award_name TEXT DEFAULT 'Grammy'
);
