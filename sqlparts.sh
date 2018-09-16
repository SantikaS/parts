USE test; 

DROP TABLE IF EXISTS part; 
CREATE TABLE part( 
	id INT(11) NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	need TINYINT(1) NOT NULL DEFAULT 0,
	number INT(11),
	PRIMARY KEY (id)) 
ENGINE = InnoDB 
DEFAULT CHARACTER SET = utf8; 
INSERT INTO part (name,need,number) 
	VALUES 	('Материнская плата',1,7), 
		('Звуковая карта',0,2),
		('Процессор',1,5),
		('Подсветка корпуса',0,0),
		('HDD диск',0,1),
		('Корпус',1,10),
		('Память',1,7),
		('SSD диск',1,15),
		('Видеокарта',0,4),
		('Блок питания',1,6),
		('DVD привод',0,2),
		('CD привод',0,3),
		('Blu-ray привод',0,1),
		('Дисковод 5,25',0,0),
		('Дисковод 3,5',0,1),
		('Клавиатура',1,6),
		('Мышь',1,12),
		('Монитор',1,7),
		('Картридер',0,3),
		('Wi-fi адаптер',0,1),
		('Коврик для мыши',0,2),
		('Кулер 120мм',0,5),
		('Кулер 100мм',0,2),
		('Кулер 80мм',0,0),
		('Кулер 40мм',0,1)
;
