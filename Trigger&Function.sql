use [Traffic accidents];
go 

Create Trigger updateAccidentLevel
ON dbo.Accident_Level
AFTER INSERT, UPDATE
AS BEGIN
 update Accident_Level
  SET LevelOfAccident =
  Case when   a.Fatality*0.6 + a.injure*0.3+ a.Economy_Lost /10000*0.1 < 0.25 then  0
       when  a.Fatality*0.6 + a.injure*0.3+ a.Economy_Lost /10000*0.1 between 0.25 and 0.5 then 1
        when a.Fatality*0.6 + a.injure*0.3+ a.Economy_Lost /10000*0.1 between 0.5 and 1 then 2
        When a.Fatality*0.6 + a.injure*0.3+ a.Economy_Lost /10000*0.1 Between 1 and 2 then 3
        when  a.Fatality*0.6 + a.injure*0.3+ a.Economy_Lost /10000*0.1 between 2 and 5 then 4
          ELSE  5
		  end
  from inserted i
  join Accident_Level a
  on i.AccidentID=a.AccidentID
END

go

Create function dbo.CK_peakhour
(@timing time)
returns int 
as
begin
declare @pp int 
begin
if (datepart (hour,@timing)in(6,7,8,9,16,17,18,19) )
 set @pp=1;
else 
 set @pp=0; 
end 
return @pp
end;
go 

create function holiday_date(@date_value date)
returns int
as 
begin
declare @holiday int
declare @m int=DATEPART(mm, @date_value)
declare @d int=DATEPART(DD, @date_value) 
declare @weekend int =DATEPART(DW,@date_value)
begin
-- New Years Day
IF (@M = 1 AND @D = 1 ) 
set @holiday=1;
-- Martin Luther King Day (3rd Monday of January)
Else IF (@M = 1 AND @D BETWEEN 15 AND 21 AND @weekend = 2) set @holiday=1;

-- Presidents Day (3rd Monday of February)
Else IF (@M = 2 AND @D BETWEEN 15 AND 21 AND @weekend = 2) set @holiday=1;

-- Memorial Day (Last Monday of May)
Else IF (@M = 5 AND @D BETWEEN 25 AND 31 AND @weekend = 2) set @holiday=1;

-- Independence Day
Else IF (@M = 7 AND @D = 4 ) set @holiday=1;

-- Labor Day (1st Monday of September)
ELSE IF (@M = 9 AND @D BETWEEN 1 AND 7 AND @weekend = 2) set @holiday=1;

-- Columbus Day (2nd Monday of October)
ELSE IF (@M = 10 AND @D BETWEEN 8 AND 14 AND @weekend = 2) set @holiday=1;

-- Veterans Day (October 11th)
ELSE IF (@M = 11 AND @D = 11 ) set @holiday=1;

-- Thanksgiving Day (4th Thursday of November)
ELSE IF (@M = 11 AND @D BETWEEN 22 AND 28 AND @weekend = 5) set @holiday=1;;

-- Christmas Day (December 25th)
ELSE IF (@M = 12 AND @D = 25 ) set @holiday=1;
Else set @holiday=0;
end
return @holiday;
end
go

Create trigger WK_HOLIDAY_datevalue
on [Date]
after Insert,update
as 
begin
update [date] set Holiday=1
from [date] d
full join inserted i
on d.DateID=i.DateID
where dbo.holiday_date(i.datevalue)=1;
update [Date]
set weekend = 
case when datepart(dw, d.datevalue) in(1, 7) then 1
     else 0 end
from [Date] d
full join inserted i
on d.DateID=i.DateID
end
go

CREATE FUNCTION getDefaultInsuranceAmount(@insuranceID INT)
RETURNS INT
AS 
BEGIN
DECLARE @insuranceamount INT
SET @insuranceamount = (SELECT default_insurance_amount FROM Insurance WHERE InsuranceId = @insuranceID)
RETURN @insuranceamount;
END
go

CREATE Trigger updateinsurance_status_amount
ON accident_has_vehicle
After INSERT,UPDATE
AS BEGIN
 DECLARE @accidentamount INT
 DECLARE @insurance_status INT
 DECLARE @insuranceID INT
 SET @accidentamount = (Select Count(ahv.AccidentID) FROM accident_has_vehicle ahv  inner join inserted i on i.VehicleID = ahv.VehicleID)
 SET @insuranceID = (SELECT InsuranceId FROM Vehicle WHERE VehicleID = (select i.vehicleid from inserted i))
 if @accidentamount>=0 
 and @accidentamount < 2 SET @insurance_status = 0
 else if @accidentamount >= 2 
 and @accidentamount <5  SET @insurance_status = 1
 else if @accidentamount >=5 
 and @accidentamount <10  SET @insurance_status = 2
 else SET @insurance_status = 3

 UPDATE Vehicle
 SET Insurance_status = @insurance_status
 WHERE VehicleID = (select i.vehicleid from inserted i);
  UPDATE Vehicle
 SET Insurance_amount = @accidentamount * 500  + (@insurance_status*0.5 + 1)* dbo.getDefaultInsuranceAmount(@insuranceID)
 WHERE VehicleID = (select i.vehicleid from inserted i)
 
END

Drop function dbo.CK_peakhour;
Drop function dbo.holiday_date;
Drop function getDefaultInsuranceAmount;
Drop trigger  WK_HOLIDAY_datevalue;
Drop trigger  dbo.updateAccidentLevel;
Drop trigger updateinsurance_status;
