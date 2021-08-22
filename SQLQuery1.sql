--------Created the database--------
create database spotify;
use spotify;

-------------Creating the user table---------
create table UserProfile
(
Id int identity(1,1) primary key,
UserName varchar(20),
Country varchar(15),
Email varchar(20)
);



--------------------Insert Values to the UserProfile table-------------
insert into UserProfile values('vedhashni','India','ved@gmail.com'),('kishore','India','Kishore69@gmail.com'),
('Arun','India','arun10@gmail.com'),('Divya','India','div@gmail.com'),('Prem','India','prem32@gmail.com');

select * from UserProfile;

----------------------Create Track table ------------------
create table TrackTable
(
TrackId int identity(1,1),
PlaylistId varchar(20),
TrackName varchar(25),
ArtistName varchar(20) primary key,
 );
alter table TrackTable alter column PlaylistId int;
alter table TrackTable Add foreign key(PlaylistId) REFERENCES PlaylistTable(PlaylistId);


-------------------------Insert into Track-----------
insert into Tracktable values(1,'track1','Muse'),(2,'track2','Sidhu Moose Wala'),
(3,'track3','Supermassive Black'),(4,'track4','Moose'),
(5,'track5','Tape');

select * from TrackTable;

select COUNT(*) from TrackTable;

-------------------Create Playlist table-------------
create table PlaylistTable
(
PlaylistId int identity(1,1) primary key,
Userid int, 
PlaylistName varchar(20),
Foreign key (Userid) references UserProfile(id),
);

----------------Insert into Playlist-------------
insert into PlaylistTable values(6,'Revelations'),
(7,'Moosetape'),(8,'Black Hole'),
(9,'Hole'),(10,'Wala');

select * from PlaylistTable;

---------------------Joins---------------
select UserProfile.UserName,TrackTable.TrackName,PlaylistTable.PlaylistName
FROM ((UserProfile
INNER JOIN PlaylistTable
ON UserProfile.Id = PlaylistTable.Userid)
INNER JOIN TrackTable ON TrackTable.PlaylistId = PlaylistTable.PlaylistId) where UserProfile.Id = PlaylistTable.Userid;


select UserProfile.UserName,PlaylistTable.PlaylistName
from UserProfile
INNER JOIN PlaylistTable
ON UserProfile.Id=PlaylistTable.Userid where UserProfile.Id = PlaylistTable.Userid;

--------------------with specific condition--------------
select UserProfile.UserName,TrackTable.TrackName,PlaylistTable.PlaylistName
FROM ((UserProfile
INNER JOIN PlaylistTable
ON UserProfile.Id = PlaylistTable.Userid)
INNER JOIN TrackTable ON TrackTable.PlaylistId = PlaylistTable.PlaylistId) where UserProfile.Id = '6';

select UserProfile.UserName,PlaylistTable.PlaylistName
from UserProfile
INNER JOIN PlaylistTable
ON UserProfile.Id=PlaylistTable.Userid where UserProfile.Id = '10';









