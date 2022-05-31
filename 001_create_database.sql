--Таблица для хранения данных об авторах
CREATE TABLE Author (
	Author_ID SERIAL PRIMARY KEY,
	Last_Name VARCHAR(100) NOT NULL
);

--Таблица для хранения данных об издательствах
CREATE TABLE Publisher (
	Publisher_ID SERIAL PRIMARY KEY,
	Publisher_Name VARCHAR(100) NOT NULL
);

--Таблица для хранения данных о книгах
CREATE TABLE Book (
	Book_ID SERIAL PRIMARY KEY,
	Book_Name VARCHAR(100) NOT NULL
);