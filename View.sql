USE [Traffic accidents]


select count(VehicleID) AS [Number Of Vehicles], Insurance_type
from Vehicle v
inner join Insurance i
on v.InsuranceID = i.InsuranceID
where Insurance_status = 1 and Insurance_amount >= 7000
group by Insurance_type
order by [Number Of Vehicles];



select Brand,count(ahv.AccidentID) as [Number Of Accidents]
from Accident_has_Vehicle ahv
inner join Vehicle v
on ahv.VehicleID = v.VehicleID 
group by Brand
order by [Number Of Accidents];