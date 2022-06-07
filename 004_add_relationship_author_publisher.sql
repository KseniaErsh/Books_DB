--Добавление полей в таблицы для дальнейшего добавления внешних ключей
ALTER TABLE IF EXISTS Author 
ADD PublisherID INT;

--Добавление внешнего ключа для связи таблиц Author и Publisher
ALTER TABLE IF EXISTS Author 
ADD CONSTRAINT FK_AuthorPublisher FOREIGN KEY (PublisherID) 
REFERENCES Publisher(Publisher_ID);
