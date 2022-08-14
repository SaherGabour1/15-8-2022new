create database project1;



CREATE TABLE users (
	
		fname varchar(25) NOT NULL,
		lname  varchar(25) NOT NULL,
		idnum int PRIMARY KEY,
		phone int NOT NULL,
		usertype varchar(10) NOT NULL,
		age int NOT NULL,
		city varchar (20) NOT NULL,
		passwords varchar(25) NOT NULL,
		email varchar(25)NOT NULL
		
)

INSERT INTO users VALUES ('avi','levi',216014850,0549769830,'patient',25,'haifa','avilevi','1010');
INSERT INTO users VALUES ('rotem','aofer',315669827,0547787793,'worker',22,'tel aviv','rotemaofer','2020');
INSERT INTO users VALUES ('ameen','golan',205444182,051477239,'patient',18,'holon','ameengolan','3030');
INSERT INTO users VALUES ('saher','gabour',315017806,0526365049,'worker',36,'shafar-am','sahergabour','4040');
INSERT INTO users VALUES ('nabih','boulos',209417401,0543833755,'worker',24,'reine','nabihboulos','5050');
INSERT INTO users VALUES ('katrien','hen',303553168,053669666,'volnteer',29,'karmiel','katrienhen','6060');
INSERT INTO users VALUES ('sara','ata',321442578,054776663,'patient',15,'natanya','saraata','7070');
INSERT INTO users VALUES ('maya','levi',354887452,050880602,'patient',19,'haifa','mayalevi','8080');
INSERT INTO users VALUES ('nizar','aboud',215447859,053424001,'volnteer',28,'nesher','nizaraboud','9090');
INSERT INTO users VALUES ('aigor','tal',212554256,052555680,'volnteer',38,'hedera','aigortal','100100');




CREATE TABLE worker (
		workerNo int PRIMARY KEY,
		workertype varchar (20) NOT NULL,
		userid int FOREIGN KEY REFERENCES users(idnum)

	)
	
INSERT INTO worker VALUES (1,'doctor',315669827);	
INSERT INTO worker VALUES (2,'doctor',209417401);	
INSERT INTO worker VALUES (3,'Qualified nurse',315017806);	
INSERT INTO worker VALUES (4,'doctor',216014850);
INSERT INTO worker VALUES (5,'doctor',321442578);
INSERT INTO worker VALUES (6,'Qualified nurse',205444182);	
INSERT INTO worker VALUES (7,'Qualified nurse',354887452);	
INSERT INTO worker VALUES (8,'doctor',212554256);
INSERT INTO worker VALUES (9,'Qualified nurse',215447859);
INSERT INTO worker VALUES (10,'Qualified nurse',303553168);



CREATE TABLE records (
		recordNo int PRIMARY KEY ,
		recordname varchar(25) NOT NULL,
		userid int FOREIGN KEY REFERENCES users(idnum)

	)

INSERT INTO records VALUES (1,'record1',205444182);
INSERT INTO records VALUES (2,'record2',321442578);
INSERT INTO records VALUES (3,'record3',354887452);
INSERT INTO records VALUES (4,'record4',321442578);
INSERT INTO records VALUES (5,'record5',216014850);




CREATE TABLE hospitals (
		hospitalNo int PRIMARY KEY,
		hospitalname varchar(25)NOT NULL,
		city varchar (20) NOT NULL,
		userid int FOREIGN KEY REFERENCES users(idnum),
		worker int FOREIGN KEY REFERENCES worker(workerNo)
	)




INSERT INTO hospitals VALUES (11,'Rambam','haifa',209417401,4);
INSERT INTO hospitals VALUES (22,'Ben Tzion','haifa',315017806,5);
INSERT INTO hospitals VALUES (33,'EMMS','nazareth',315669827,3);
INSERT INTO hospitals VALUES (44,'FRENCH','Tel Aviv',216014850,2);
INSERT INTO hospitals VALUES (55,'EmekMedical','afula',321442578,6);


CREATE TABLE Labs (
		labNo int PRIMARY KEY, 
		labname varchar (25),
		city varchar(25),	
		worker int FOREIGN KEY REFERENCES worker(workerNo),
		hospitalid int FOREIGN KEY REFERENCES hospitals(hospitalNo)	
	)


INSERT INTO Labs VALUES (12,'Hematology','haifa',4,44);
INSERT INTO Labs VALUES (13,'blood bank','afula',5,22);
INSERT INTO Labs VALUES (14,'Tel Hashomer','Tel Aviv',6,44);
INSERT INTO Labs VALUES (15,'Rosenblatt','Natanya',1,33);
INSERT INTO Labs VALUES (16,'Fugene','Haifa',2,11);
INSERT INTO Labs VALUES (17,'NIPT','Tel Aviv',8,55);

CREATE TABLE Blood (
		BloodNo int PRIMARY KEY,
		BloodType varchar(3) NOT NULL,
		userid int FOREIGN KEY REFERENCES users(idnum)
	)

INSERT INTO Blood VALUES (1,'A',216014850);
INSERT INTO Blood VALUES (2,'B',303553168);
INSERT INTO Blood VALUES (3,'B',212554256);
INSERT INTO Blood VALUES (4,'O',315017806);
INSERT INTO Blood VALUES (5,'A',354887452);
INSERT INTO Blood VALUES (6,'B',321442578);
INSERT INTO Blood VALUES (7,'B',215447859);
INSERT INTO Blood VALUES (8,'O',209417401);
INSERT INTO Blood VALUES (9,'B',315669827);




CREATE TABLE Donation (
		DonationNo int PRIMARY KEY,
		Donationbloodtype varchar(1) NOT NULL,
		DonationDate varchar(100) NOT NULL,
		DonationHour varchar(15) NOT NULL,
		userid int FOREIGN KEY REFERENCES users(idnum),
		bloodid int FOREIGN KEY REFERENCES Blood(BloodNo)

)

INSERT INTO Donation VALUES (100,'A','10/10/2022','10:00',205444182,1);
INSERT INTO Donation VALUES (101,'B','1/8/2022','11:00',303553168,2);
INSERT INTO Donation VALUES (102,'A','11/5/2022','10:30',315017806,4);
INSERT INTO Donation VALUES (103,'B','7/12/2022','9:00',209417401,9);
INSERT INTO Donation VALUES (104,'B','3/1/2022','11:20',321442578,8);
INSERT INTO Donation VALUES (105,'B','5/8/2022','13:40',303553168,6);
INSERT INTO Donation VALUES (106,'A','12/11/2022','15:20',354887452,5);
INSERT INTO Donation VALUES (107,'B','6/6/2022','8:10',215447859,3);
INSERT INTO Donation VALUES (108,'A','9/8/2022','12:30',212554256,7);


CREATE TABLE Test (
		TestNo int PRIMARY KEY,
		Testname varchar(25)  NOT NULL,
		TestDate varchar(50) NOT NULL,
		TestHour varchar(15) NOT NULL,
		userid int FOREIGN KEY REFERENCES users(idnum)
	
)

INSERT INTO Test VALUES (111,'TestA1','1/5/2022','9:00',303553168);
INSERT INTO Test VALUES (222,'TestB2','7/7/2022','10:00',215447859);
INSERT INTO Test VALUES (333,'TestC3','3/10/2022','11:00',215447859);
INSERT INTO Test VALUES (444,'TestD4','4/6/2022','9:30',212554256);
INSERT INTO Test VALUES (555,'TestE3','15/1/2022','12:00',321442578);
INSERT INTO Test VALUES (666,'TestF4','14/8/2022','10:30',212554256);
INSERT INTO Test VALUES (777,'TestG3','9/9/2022','13:50',216014850);
INSERT INTO Test VALUES (888,'TestH4','9/6/2022','14:30',303553168);




CREATE TABLE DonationArea (
		AreaNo int PRIMARY KEY ,
		AreaName varchar(25) NOT NULL,
		city varchar(25) NOT NULL,
		hospitalid int FOREIGN KEY REFERENCES hospitals(hospitalNo)	
)

INSERT INTO DonationArea VALUES (1111,'North','Haifa',11);
INSERT INTO DonationArea VALUES (2222,'Center','Natanya',33);
INSERT INTO DonationArea VALUES (3333,'North','Nazareth',55);
INSERT INTO DonationArea VALUES (4444,'Center','Tel Aviv',44);
INSERT INTO DonationArea VALUES (5555,'North','Haifa',11);
INSERT INTO DonationArea VALUES (6666,'Center','Holon',22);
INSERT INTO DonationArea VALUES (7777,'Center','Tel Aviv',55);
INSERT INTO DonationArea VALUES (8888,'North','Haifa',22);




select*from users
select*from Test
select*from hospitals
select*from DonationArea
select*from Donation
select*from Blood
select*from worker
select*from records
select*from Labs
