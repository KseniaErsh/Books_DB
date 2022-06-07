--Добавление полей в таблицу для дальнейшего добавления внешних ключей
ALTER TABLE IF EXISTS Book 
ADD PublisherID INT;

ALTER TABLE IF EXISTS Book 
ADD AuthorID INT; 

--Добавление внешнего ключа для связи таблиц Book и Publisher
ALTER TABLE IF EXISTS Book 
ADD CONSTRAINT FK_BooksPublisher FOREIGN KEY (PublisherID) 
REFERENCES Publisher(Publisher_ID);

--Добавление внешнего ключа для связи таблиц Book и Author
ALTER TABLE IF EXISTS Book 
ADD CONSTRAINT FK_BooksAuthor FOREIGN KEY (AuthorID) 
REFERENCES Author(Author_ID);
