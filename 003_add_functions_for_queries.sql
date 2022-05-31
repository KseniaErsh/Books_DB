CREATE OR REPLACE FUNCTION getBooksWithoutPublisher ()
RETURNS SETOF character 
AS '
--Функция возвращает список книг, у которых нет издательства
select book_name from book
where publisherid is null;'
LANGUAGE sql;


CREATE OR REPLACE FUNCTION getBooksWithoutAuthor ()
RETURNS SETOF character 
AS '
--Функция возвращает список книг, у которых нет автора
select book_name from book
where authorid is null;'
LANGUAGE sql;


CREATE OR REPLACE FUNCTION getBooksWithoutAuthorAndPublisher ()
RETURNS SETOF character 
AS '
--Функция возвращает список книг, у которых нет издательства и автора
select book_name from book
where publisherid is null and authorid is null'
LANGUAGE sql;


CREATE OR REPLACE FUNCTION getBooksByAuthor (VARCHAR(100))
RETURNS SETOF character 
AS '
--Функция возвращает список книг автора $1
select book_name from book
where authorid IN (select author_id from author where last_name=$1)'
LANGUAGE sql;


CREATE OR REPLACE FUNCTION getBooksFromPublisher (VARCHAR(150))
RETURNS SETOF character 
AS '
--Функция возвращает список книг издательства $1
select book_name from book
where publisherid IN (select publisher_id from publisher where publisher_name=$1)'
LANGUAGE sql;


CREATE OR REPLACE FUNCTION getAutorsOfPublisher (VARCHAR(150))
RETURNS SETOF character 
AS '
--Функция возвращает список авторов издательства $1
select last_name from author
where author_id in 
	(select authorid from book
	where publisherid IN (select publisher_id from publisher where publisher_name=$1))'
LANGUAGE sql;


CREATE OR REPLACE FUNCTION getPublisher (VARCHAR(100))
RETURNS VARCHAR(150) 
AS '
--Функция возвращает список издательство автора $1
select publisher_name from publisher
where publisher_id in
	(select publisherid from book
	where authorid IN (select author_id from author where last_name=$1))'
LANGUAGE sql;