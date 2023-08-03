SELECT *
FROM Customer

--PROJEÇÃO 

-- Limite
SELECT *
FROM Customer
LIMIT 10;

-- Contador
SELECT COUNT(*)
FROM Customer;

SELECT 
	FirstName,
	Lastname,
	City
FROM Customer
LIMIT 10

-- Ordenação dos dados
SELECT 
	FirstName,
	Lastname,
	City
FROM Customer
ORDER BY FirstName DESC

SELECT 
	FirstName,
	Lastname,
	City
FROM Customer
ORDER BY 3 ASC

-- Apelidos, alias
SELECT 
	FirstName as "Nome",
	Lastname as "Sobrenome",
	City as "Cidade do cliente" --("")PARA USAR O ESPAÇO
FROM Customer
ORDER BY 3 ASC

-- Seleção - Filtro
-- Consultas em string devem respeitar maiúsculas e minúsculas (Case sensitive)
SELECT *
FROM Album
WHERE Title = "Big Ones"


SELECT *
FROM Album
WHERE ArtistId  = 10

--Selecionando valores não nulos
SELECT *
FROM Album
WHERE Column1 NOTNULL 

SELECT *
FROM Album
WHERE Column1 is NULL 

--Filtros com valores lógicos
SELECT *
FROM Album
WHERE AlbumId >= 100

SELECT *
FROM Album
WHERE AlbumId 
	BETWEEN 10 and 30
	
SELECT *
FROM Album
WHERE AlbumId >= 100
	AND ArtistId = 22
	
SELECT *
FROM Album
WHERE AlbumId >= 100
	OR  ArtistId = 22
	
-- Usando like (Método mais flexível)
SELECT *
FROM Album
WHERE Title like "%vivo"

SELECT *
FROM Album
WHERE Title like "%disc%"

SELECT *
FROM Artist
WHERE Name like "AC/DC"

-- Manipulação de dados
SELECT *
FROM Genre
LIMIT 10

SELECT *
FROM Genre
WHERE name like "MPB"

INSERT  INTO Genre (GenreId, Name)
VALUES (NULL, "MPB") -- ID 26

SELECT *
FROM Artist 
WHERE Name like "TOQUINHO"

INSERT  INTO Artist (Name)
VALUES ( "Toquinho") --ID 276

SELECT *
FROM Track

INSERT  INTO Track
VALUES
(NULL, "Aquarela", NULL, 1, 26, "Toquinho e Vinicius", 2500000, 8000000, 5.99),
(NULL, "Samba da benção", NULL, 1, 26, "Toquinho e Vinicius", 2500000, 8000000, 8.99),
(NULL, "Wave", NULL, 1, 26, "Toquinho e Tom", 2500000, 8000000, 6.99)

SELECT *
FROM Track 
WHERE GenreId = 26

SELECT *
FROM Track 
WHERE Composer like "Toquinho%"

--Atualização de dados de uma tabela
SELECT *
FROM Customer 
LIMIT 10

UPDATE Customer
SET Company = "EBAC"
WHERE CustomerId = 2 -- Atualizar registro apenas para o Id 2

SELECT *
FROM Customer 
WHERE Country like "Bra_il" 

UPDATE Customer 
SET Country = "Brasil"
WHERE Country like "Brazil" -- Atualizar registro de alteração de nome

-- Exclusão de registros - DELETE 
SELECT *
FROM Invoice
WHERE Total >= 20
	AND BillingCountry like "USA"
	
DELETE 
FROM Invoice
WHERE Total >= 20
	AND BillingCountry like "USA"
	
-- Junção de dados	
SELECT COUNT(*)
FROM Album 

SELECT COUNT(*) 
FROM Artist 

SELECT COUNT(*)
FROM Album , Artist -- Forma errada de juntar base de dados

--Join
SELECT 
	Album.Title,
	Artist.Name
FROM Album
INNER JOIN Artist
	ON Album.ArtistId = Artist.ArtistId 
WHERE name like "Iron Maiden"


SELECT 
	Album.Title as "Título do album",
	Artist.Name as "Nome do artista",
	Track.Name as "Nome da música"
FROM Album
INNER JOIN Artist
	ON Album.ArtistId = Artist.ArtistId 
INNER JOIN Track 
	ON Album.AlbumId = Track.AlbumId 
	
-- Criando tabelas (Aluno e Matrícula)
CREATE TABLE Alunos(
	AlunoId INTEGER PRIMARY KEY AUTOINCREMENT, --Preenche o ID
	Nome VARCHAR (30),
	Matricula INTEGER (5)
);

SELECT *
FROM Alunos --Buscar tabela

INSERT INTO Alunos (Nome, Matricula)
VALUES
	("Michael Maia", 10058),
	("Ariele Santana", 12568),
	("Sheldon Cooper", 64897)
	

-- Excluindo tabela
DROP TABLE Alunos 
