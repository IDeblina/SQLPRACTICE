CREATE database practice;
use practice;

CREATE table persons (
	p_id int,
    lastname varchar(20),
    firstname varchar(50),
    address varchar(100),
    city varchar(100)
); 
show tables;

DROP table persons; 

SELECT * from persons;

INSERT INTO persons(p_id,lastname,firstname,address,city)
VALUES (1 ,'HANSEN', 'OLA','TIMOTEIVN 10', 'SANDNES');

INSERT INTO persons(p_id, lastname,firstname,address,city)
VALUES(2 ,'SVENDSON', 'TOVE', 'BORGVN23', 'SANDNES');

SELECT distinct * from persons;

INSERT INTO persons(p_id, lastname,firstname,address,city)
VALUES(3 ,'PETTERSEN', 'KARI', 'STORGT20', 'STAVANGER');

SELECT  lastname, firstname from persons;

SELECT distinct * from persons 
WHERE city = 'SANDNES';

SELECT * from persons
WHERE firstname= 'TOVE' and lastname='SVENDSON';

SELECT distinct * from persons
WHERE firstname = 'TOVE' or firstname= 'OLA';

CREATE table employee(
	e_id int,
    salary int,
    bonus int
);

SELECT * from employee;

INSERT INTO employee(e_id, salary,bonus)
VALUES( 101, 2000, 200 );

INSERT INTO employee(e_id, salary,bonus)
VALUES( 102, 3000, 150 );

INSERT INTO employee(e_id, salary,bonus)
VALUES( 103, 1000, 100 );

INSERT INTO employee(e_id, salary,bonus)
VALUES( 104, 2050, 125 );

INSERT INTO employee(e_id, salary,bonus)
VALUES( 105, 3500, 200 );

drop table employee;

SELECT SUM(salary) from employee;
SELECT SUM(bonus) from employee;
SELECT SUM(salary+bonus) from employee;
SELECT salary - bonus from employee;

CREATE table shoppe(
	id varchar(100),
    sname varchar(100),
    area varchar(100)
);
drop table shoppe;

SELECT * from shoppe;
INSERT INTO shoppe(id,sname,area)
VALUES('S01', 'ABC COMPUTERONICS', 'CP' );

INSERT INTO shoppe(id,sname,area)
VALUES('S02', 'ALL INFOTECH MEDIA ', 'GK II' );

INSERT INTO shoppe(id,sname,area)
VALUES('S03', 'TECH SHOPPE', 'CP' );

INSERT INTO shoppe(id,sname,area)
VALUES('S04', 'GEEKS TECNO SOFT ', 'Nehru Place' );

INSERT INTO shoppe(id,sname,area)
VALUES('S05', 'HITECH TECH STORE', 'Nehru Place' );

CREATE table ACCESSORIES(
	no varchar(20),
	name varchar(100),
    price int,
	id varchar(20)
);
drop table ACCESSORIES;

SELECT * from ACCESSORIES;

INSERT INTO ACCESSORIES(no,name,price,id)
VALUES('A01', 'Mother Board', 12000, 'S01');

INSERT INTO ACCESSORIES(no,name,price,id)
VALUES('A02', 'Hard Disk', 5000, 'S01');

INSERT INTO ACCESSORIES(no,name,price,id)
VALUES('A03', 'Keyboard', 500, 'S02');

INSERT INTO ACCESSORIES(no,name,price,id)
VALUES('A04', 'Mouse', 300, 'S01');

INSERT INTO ACCESSORIES(no,name,price,id)
VALUES('A05', 'Mother Board', 13000, 'S02');

INSERT INTO ACCESSORIES(no,name,price,id)
VALUES('A06', 'Keyboard', 400, 'S03');

INSERT INTO ACCESSORIES(no,name,price,id)
VALUES('A07', 'LCD',6000,'S04');

INSERT INTO ACCESSORIES(no,name,price,id)
VALUES('A08', 'LCD', 5500 ,'S05');

INSERT INTO ACCESSORIES(no,name,price,id)
VALUES('A09', 'Mouse', 350 ,'S05');

INSERT INTO ACCESSORIES(no,name,price,id)
VALUES('A10', 'Hard Disk', 4500 ,'S03');

SELECT name , price from ACCESSORIES 
ORDER BY price;

SELECT id , sname from shoppe 
WHERE area = 'Nehru Place';

SELECT DISTINCT name from ACCESSORIES
 WHERE price>=5000;
 
SELECT max(price) , min(price)
FROM  ACCESSORIES
where name = 'Keyboard';

SELECT max(price) , min(price)
FROM  ACCESSORIES
where name = 'Mother Board';

SELECT max(price) , min(price)
FROM  ACCESSORIES
where name = 'Mouse';

SELECT max(price) , min(price)
FROM  ACCESSORIES
where name = 'LCD';

SELECT max(price) , min(price)
FROM  ACCESSORIES
where name = 'Hard Disk';

 SELECT area, COUNT(*)
 FROM SHOPPE 
 GROUP BY area; 
 
 SELECT COUNT(DISTINCT AREA) FROM shoppe; 
 
SELECT name, price*0.05 DISCOUNT FROM ACCESSORIES 
WHERE id IN('S02', 'S03');

CREATE table items(
	code int,
    iname varchar(100),
    qty int,
    price int,
    company varchar(100),
    tcode varchar(20)

);

SELECT * from items;

INSERT INTO items
VALUES(1001, 'DIGITAL PAD 121', 120, 11000, 'XENITA','T01' ),
(1006, 'LED SCREEN 40', 70, 38000,'SANTORA', 'T02'),
(1004, 'CAR GPS SYSTEM',50, 2150, 'GEOKNOW', 'T01'),
(1003, 'DIGITAL CAMERA 12X', 160,8000 ,'DIGICLICK' ,'T02'), 
(1005, 'PEN DRIVE 32 GB', 600, 1200, 'STOREHOME', 'T03');


CREATE table traders(
	tcode int,
    tname varchar(100),
    city varchar(50)
);

ALTER TABLE traders 
MODIFY COLUMN tcode varchar(20);

INSERT INTO traders
VALUES('T01', 'ELECTRONIC SALES','MUMBAI'),
('T03', 'BUSY STORE CORP ','DELHI'),
('T02', 'DISP HOUSE INC ','CHENNAI');

SELECT * FROM traders;

SELECT * FROM items 
ORDER BY iname;

SELECT * FROM items 
ORDER BY iname DESC;

SELECT iname, price FROM items
WHERE price  BETWEEN 11000 AND 22000;

SELECT iname, price FROM items
WHERE price >11000 AND price <38000;

SELECT tcode, count(*) from items
GROUP BY tcode;

SELECT price, iname,qty from items 
WHERE qty >150;

SELECT tname from traders 
WHERE city='DELHI' or city='MUMBAI';

SELECT max(price), min(price) from items;

SELECT DISTINCT tcode from items;

SELECT company,iname from items 
ORDER BY company DESC;

SELECT SUM(price) as AMOUNT from items;

SELECT items.iname, traders.tname from items
INNER JOIN traders ON items.tcode=traders.tcode
WHERE items.qty<100;

