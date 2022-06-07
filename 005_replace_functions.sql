CREATE OR REPLACE FUNCTION getAutorsOfPublisher (VARCHAR(150))
RETURNS SETOF character 
AS '
--Функция возвращает список авторов издательства $1
select last_name from author
where publisherid IN (select publisher_id from publisher where publisher_name=$1)'
LANGUAGE sql;


CREATE OR REPLACE FUNCTION getPublisher (VARCHAR(100))
RETURNS VARCHAR(150) 
AS '
--Функция возвращает список издательство автора $1
select publisher_name from publisher
where publisher_id in
	(select publisherid from author where last_name=$1)'
LANGUAGE sql;