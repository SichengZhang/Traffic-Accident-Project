USE [Traffic accidents]


insert [Date](datevalue) values ('2017-04-01') ,('2017-04-02'),('2017-4-03'),('2017-4-04'),('2017-4-05'),
('2017-4-06'),('2017-4-07'),('2017-4-08'),('2017-4-09'),('2017-4-10');
insert Location values('Huntington','Avenue','level'),('Queensberry','Street','level'),
('Boylston','Street','level'),('Museum','Road','level'),('Longwood','Avenue','level'),
('Parker Hill','Avenue','rolling'),('93','highway','level'),('Massachusetts','Avenue','level'),
('Beacon','Street','level'),('Arlington','Street','level')
insert weather values (1,1,40,0.33,10),(1,5,56,0.23,9),(2,1,64,0.38,10),(3,3,56,0.73,8),
(4,6,46,0.47,9),(5,1,54,0.83,7),(6,3,52,0.47,10),(7,1,49,0.46,10),(8,10,52,0.59,9),
(9,7,61,0.43,10),(10,3,59,0.56,10)
insert Insurance values ('Progressive','Liability Insurance',5000),('USAA','Liability Insurance',4000),
('Esurance','Liability Insurance',4500),('Progressive','Collision Coverage',4500),
('USAA','Collision Coverage',5500),('Esurance','Collision Coverage',6000),
('Progressive','Comprehensive Coverage',8000),('USAA','Comprehensive Coverage',7000),
('Esurance','Comprehensive Coverage',6500),('Quote','Comprehensive Coverage',6600)
insert Vehicle values 
( 'BMW', 'Sedan', 'Auto', 4, 10000, 3, 1, null, null),
('Honda', 'MPV', 'Auto', 8, 8000, 2, 3, null, null),
('BENZ', 'HatchBack', 'Auto', 4, 7000, 3, 10, null, null),
('Nissan', 'Sedan', 'Auto', 4, 10000, 3, 9, null, null),
('Mazda', 'Coupe', 'Auto', 2, 2000, 1, 8, null, null),
('BMW', 'Sedan', 'Auto', 4, 50000, 5, 7, null, null),
('Toyota', 'SUV', 'Auto', 6, 100000, 8, 6, null, null),
( 'Toyota', 'Sedan', 'Auto', 4, 1000, 1, 7, null, null),
( 'Nissan', 'Sedan', 'Auto', 4, 6000, 2,6, null, null),
('Mercury', 'Sedan', 'Manual', 4, 200000, 10, 4, null, null),
('Honda', 'SUV', 'Auto', 4, 7000, 5,8, null, null),
('BMW', 'SUV', 'Auto', 6, 2000, 1, 9,null, null)
insert Driver( DriverLname ,DriverFname,Driverage ,Drivergender , CardNumber) values('Yihui','Huang',2,'F',1111111111),('Xiao','Li',1,'F',1121111121),
('Yu','Tian',5,'M',1113161171),('Huan','Wang',1,'M',1121811711),
('MM','Tian',10,'F',1311711811),('Si','Song',6,'F',3131111517),
('Danny','Peter',4,'M',3111171219),('Nancy','Green',9,'F',3345199181),
('Haris','White',3,'M',6123411171),('Trader','Joe',1,'M',8156114001)


insert Accident values(1,1),(2,1),(3,2),(4,2),(5,4),(4,4),(2,6),(8,6),(1,7),(9,8),(7,6),(8,10),(8,10)
Insert Accident_Reason values(1,0,0,0,1,null),(2,1,0,0,1,null),(3,0,0,0,1,null),(4,0,1,0,0,null),(5,0,0,0,1,null),
(6,0,1,0,0,null),(7,0,0,0,1,null),(8,1,0,0,0,null),(9,0,0,1,0,null),(10,1,0,0,0,null),(11,1,0,0,0,null),
(12,1,0,0,1,null),(13,1,0,0,1,null)
insert [time] values (1,'12:00:00',0,15),(2,'09:15:00',1,8),(3,'22:20:00',0,15),
(4,'17:20:00',1,15),(5,'19:35:00',1,20),(6,'08:10:05',1,15),(7,'09:36:00',1,16),
(8,'12:45:05',0,19),(9,'07:35:00',1,30),(10,'17:10:05',1,12),(11,'23:15:00',0,25),
(12,'14:10:05',0,15),(13,'08:55:00',1,5)
insert Accident_has_Driver values (1,7),(1,8),(1,5),(2,2),(2,3),(3,9),(4,4),(4,1),(5,6),(6,10),(6,2),
(7,8),(8,1),(8,5),(9,7),(9,6),(10,10),(11,7),(12,7),(13,3),(13,9)
INSERT Accident_Level (AccidentID,Fatality,Injure,Economy_Lost )VALUES (1,0,1,5000),(2,1,1,15000),(3,0,1,13500),(4,2,0,40000),
                             (5,0,2,7000),(6,0,0,3000),(7,0,2,7650),(8,0,2,4530),
							 (9,1,0,15000),(10,0,2,8650),(11,0,1,3350),(12,0,1,2000),
							 (13,2,0,17785)
Insert Public_service values (1,1,1,1),(2,1,1,1),(3,0,0,1),(4,1,0,1),(5,1,0,1),(6,0,0,1),(7,0,0,1),
(8,0,0,0),(9,0,0,1),(10,1,0,1),(11,1,0,1),(12,1,1,1),(13,0,1,1)
INSERT Media_exposure VALUES ('TV','85333','1'),('TV','56834','2'),('News_Paper','2543245','3'),('TV','553','4'),('Internet','3838','5'),('Internet','12747','6'),
                             ('TV','213453','7'),('News_Paper','2138533','8'),('TV','834353','9'),('News_Paper','563423','10'),('TV','45343','11'),('TV','55553','12'),
							 ('Internet','876863','13')
Insert PostAccidentTraffic values(1,20,20), (2,30,30), (3,40,40), (4,50,50),(5,20,20),(6,10,10),
(7,15,5),(8,25,4),(9,14,10),(10,40,40),(11,34,24),(12,25,10),(13,20,20)
INSERT Accident_has_Vehicle VALUES (1,1)
INSERT Accident_has_Vehicle VALUES (2,7)
INSERT Accident_has_Vehicle VALUES (3,4)
INSERT Accident_has_Vehicle VALUES (4,5)
INSERT Accident_has_Vehicle VALUES (5,7)
INSERT Accident_has_Vehicle VALUES (6,9)
INSERT Accident_has_Vehicle VALUES (7,2)
INSERT Accident_has_Vehicle VALUES (8,6)
INSERT Accident_has_Vehicle VALUES (9,3)
INSERT Accident_has_Vehicle VALUES (10,3)
INSERT Accident_has_Vehicle VALUES (11,7)
INSERT Accident_has_Vehicle VALUES (12,3)
INSERT Accident_has_Vehicle VALUES (13,9)
