create database zomato;

select * from metropolitian;
select * from urban;
select * from semi_urban;


create table urban (ID varchar(50),Delivery_person_ID varchar(50),Delivery_person_Age int,Delivery_person_Ratings double,Restaurant_latitude double,Restaurant_longitude double,Delivery_location_latitude double,Delivery_location_longitude double,Order_Date varchar(50),Time_Orderd varchar(50),Time_Order_picked varchar(50),Weather_conditions varchar(50),Road_traffic_density varchar(50),Vehicle_condition int,Type_of_order varchar(50),Type_of_vehicle varchar(50),multiple_deliveries int,Festival varchar(50),City varchar(50),Time_taken int);
create table semi_urban (ID varchar(50),Delivery_person_ID varchar(50),Delivery_person_Age int,Delivery_person_Ratings double,Restaurant_latitude double,Restaurant_longitude double,Delivery_location_latitude double,Delivery_location_longitude double,Order_Date varchar(50),Time_Orderd varchar(50),Time_Order_picked varchar(50),Weather_conditions varchar(50),Road_traffic_density varchar(50),Vehicle_condition int,Type_of_order varchar(50),Type_of_vehicle varchar(50),multiple_deliveries int,Festival varchar(50),City varchar(50),Time_taken int);

delimiter $$
create trigger ab
after delete on metropolitian
for each row begin
insert into urban (ID,Delivery_person_ID,Delivery_person_Age,Delivery_person_Ratings,Restaurant_latitude,Restaurant_longitude,Delivery_location_latitude,Delivery_location_longitude,Order_Date,Time_Orderd,Time_Order_picked,Weather_conditions,Road_traffic_density,Vehicle_condition,Type_of_order,Type_of_vehicle,multiple_deliveries,Festival,City,Time_taken) values (old.ID,old.Delivery_person_ID,old.Delivery_person_Age,old.Delivery_person_Ratings,old.Restaurant_latitude,old.Restaurant_longitude,old.Delivery_location_latitude,old.Delivery_location_longitude,old.Order_Date,old.Time_Orderd,old.Time_Order_picked,old.Weather_conditions,old.Road_traffic_density,old.Vehicle_condition,old.Type_of_order,old.Type_of_vehicle,old.multiple_deliveries,old.Festival,old.City,old.Time_taken);
end $$
delimiter ;

delete from metropolitian where City="Urban";


delimiter $$
create trigger zx
after delete on metropolitian
for each row begin
insert into semi_urban (ID,Delivery_person_ID,Delivery_person_Age,Delivery_person_Ratings,Restaurant_latitude,Restaurant_longitude,Delivery_location_latitude,Delivery_location_longitude,Order_Date,Time_Orderd,Time_Order_picked,Weather_conditions,Road_traffic_density,Vehicle_condition,Type_of_order,Type_of_vehicle,multiple_deliveries,Festival,City,Time_taken) values (old.ID,old.Delivery_person_ID,old.Delivery_person_Age,old.Delivery_person_Ratings,old.Restaurant_latitude,old.Restaurant_longitude,old.Delivery_location_latitude,old.Delivery_location_longitude,old.Order_Date,old.Time_Orderd,old.Time_Order_picked,old.Weather_conditions,old.Road_traffic_density,old.Vehicle_condition,old.Type_of_order,old.Type_of_vehicle,old.multiple_deliveries,old.Festival,old.City,old.Time_taken);
end $$
delimiter ;

delete from metropolitian where City="semi-urban";


select * from urban;
delete from urban where City = "semi-urban";


delete from metropolitian where City = "NaN";
delete from metropolitian where Festival = "NaN";
delete from metropolitian where Weather_conditions = "NaN";


delete from urban where City = "NaN";
delete from urban where Festival = "NaN";
delete from urban where Weather_conditions = "NaN";


delete from semi_urban where City = "NaN";
delete from semi_urban where Festival = "NaN";
delete from semi_urban where Weather_conditions = "NaN";