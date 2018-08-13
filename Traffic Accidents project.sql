CREATE DATABASE "Traffic accidents";

use "Traffic accidents";

Create table [Location](
idlocation int identity not null primary key,
road_name varchar(45),
road_type varchar(45),
Terrain varchar(45))

Create table [Date](
DateID int identity not null primary key,
datevalue date,
weekend int default 0,
Holiday int default 0
)

Create table Weather(
DateID int not null
references [Date](DateID),
LocationID int not null
references [Location](idlocation),
temperature int,
moisture decimal(3,2),
visibility int,
primary key (DateID, LocationID)
)

CREATE TABLE Driver(
     DriverID INT IDENTITY PRIMARY KEY,
     DriverLname VARCHAR(45),
	 DriverFname VARCHAR(45),
	 Driverage INT CHECK(DriverAge>0 and DriverAge<100),
     Drivergender VARCHAR(1),
     CHECK (Drivergender IN ('F', 'M'))	,
	 CardNumber nvarchar(25) 
);
 
CREATE TABLE Insurance(
	 InsuranceId INT IDENTITY PRIMARY KEY,
	 Company_name VARCHAR(45),
	 Insurance_type VARCHAR(45),
	 default_insurance_amount int	 
);

CREATE TABLE Vehicle(
	 VehicleID INT IDENTITY PRIMARY KEY,
	 Brand VARCHAR(45),
	 [Type] VARCHAR(45),
	 Transmission VARCHAR(45),
	 Capacity INT CHECK(Capacity>0 and Capacity<100),
	 Mileage INT CHECK(Mileage>0),
	 Vehicle_age INT CHECK(Vehicle_age>0 and Vehicle_age<50),
	 InsuranceId INT FOREIGN KEY REFERENCES Insurance(InsuranceId),
	 Insurance_status int,
	 Insurance_amount INT CHECK(Insurance_amount>0)
	 );

Create table Accident(
AccidentID int identity not null primary key,
--Accident_ReasonID int not null,
--Accident_levelID int not null,
Location_ID int not null references [Location](idlocation),
Date_ID int not null references [Date](DateID),
--Public_serviceID int 
)

CREATE TABLE Accident_has_Driver(
	 AccidentID INT FOREIGN KEY REFERENCES Accident(AccidentID),
	 DriverID INT FOREIGN KEY REFERENCES Driver(DriverID)
);

CREATE TABLE Accident_has_Vehicle(
	 AccidentID INT FOREIGN KEY REFERENCES Accident(AccidentID),
	 VehicleID INT FOREIGN KEY REFERENCES Vehicle(VehicleID)
);

CREATE TABLE Accident_Reason(
 --IDAccident_Reason   INT PRIMARY KEY,
 AccidentID INT PRIMARY KEY REFERENCES  Accident(AccidentID),
 PersonReason        INT CHECK (Accident_Reason.Personreason in (0,1)),
 RoadReason          INT CHECK (Accident_Reason.RoadReason in (0,1)),
 VehicleReason       INT CHECK (Accident_Reason.VehicleReason in (0,1)),
 WeatherReson        INT CHECK (Accident_Reason.WeatherReson in (0,1)),
 OtherReason         VARCHAR(100)
 );

CREATE TABLE Accident_Level
(AccidentID INT PRIMARY KEY REFERENCES Accident(AccidentID),
Fatality INT CHECK(Accident_Level.Fatality >=0),
Injure INT CHECK(Accident_Level.Injure >=0),
Economy_Lost INT CHECK(Accident_Level.Economy_Lost >=0),
LevelOfAccident INT )

CREATE TABLE Media_exposure (
     --idMedia_exposure INT IDENTITY,
     media_type   VARCHAR(45),
	 hits INT  CHECK(hits > 0),
	 AccidentID INT PRIMARY KEY REFERENCES  Accident(AccidentID),
     
     CHECK (Media_exposure.media_type IN ('News_Paper', 'TV', 'Internet'))	
) ;

CREATE TABLE PostAccidentTraffic
(--IDPostAccidentTraffic INT PRIMARY KEY,
AccidentID INT PRIMARY KEY REFERENCES  Accident(AccidentID),
TrafficDelay INT CHECK(PostAccidentTraffic.TrafficDelay >0),
BlockTime INT CHECK(PostAccidentTraffic.BlockTime >0),
);

Create table [time](
AccidetnID int not null primary key
references Accident(AccidentID),
happening_time time not null,
peakhour int not null check (peakhour in (0,1)),
duration int not null,
check (dbo.CK_peakhour(happening_time)=peakhour )
)

CREATE TABLE Public_service (
     --idPublic_service INT,
	 AccidentID INT PRIMARY KEY REFERENCES Accident(AccidentID),
     ambulance_or_not  INT,
	 fire_truck_or_not  INT,
	 police_or_not  INT,
     CHECK (Public_service.ambulance_or_not IN (0, 1)),
	 CHECK (Public_service.fire_truck_or_not IN (0, 1)),
	 CHECK (Public_service.police_or_not IN (0, 1))	
) ;

















Drop table Public_service;
Drop table PostAccidentTraffic;
Drop table Media_exposure;
Drop table Accident_Level;
Drop table Accident_Reason;
Drop table [time];
Drop table Accident_has_Driver;
Drop table Accident_has_Vehicle;
Drop table Accident;
Drop table Vehicle;
Drop table Driver;
Drop table Insurance;
Drop table Weather;
Drop table [Date];
Drop table [Location];

Drop database [Traffic accidents];

