use harireddy;

CREATE TABLE factory (
factory_id INT PRIMARY KEY,
factory_name varchar(100),
location varchar(50),
manager_name varchar(50)
);

INSERT INTO factory VALUES
(1, 'Alpha Manufacturing', 'Pune', 'Rajesh Kumar'),
(2, 'Beta Industries', 'Chennai', 'Suresh Iyer'),
(3, 'Gamma Works', 'Bangalore', 'Anita Sharma'),
(4, 'Delta Corp', 'Hyderabad', 'Ravi Verma'),
(5, 'Omega Manufacturing', 'Ahmedabad', 'Neha Patel');

Select * from factory;

Create Table Production(
  production_id INT primary key,
  factory_id INT,
  production_name Varchar(50),
  quantity_produced INT,
  production_cost decimal(10,2),
  production_date date,
  shift varchar(50),
  foreign key (factory_id) references factory(factory_id));
  
  INSERT INTO Production VALUES
(1, 1, 'Gear Box', 120, 45000, '2025-01-01', 'Day'),
(2, 1, 'Engine Part', 90, 72000, '2025-01-02', 'Night'),
(3, 2, 'Brake Pad', 200, 30000, '2025-01-03', 'Day'),
(4, 2, 'Clutch Plate', 150, 55000, '2025-01-04', 'Night'),
(5, 3, 'Axle Rod', 80, 40000, '2025-01-05', 'Day'),
(6, 3, 'Gear Box', 110, 46000, '2025-01-06', 'Night'),
(7, 4, 'Piston', 130, 60000, '2025-01-07', 'Day'),
(8, 4, 'Cylinder', 95, 52000, '2025-01-08', 'Night'),
(9, 5, 'Engine Block', 70, 90000, '2025-01-09', 'Day'),
(10, 5, 'Crank Shaft', 60, 85000, '2025-01-10', 'Night'),
(11, 1, 'Brake Pad', 210, 31000, '2025-01-11', 'Day'),
(12, 2, 'Gear Box', 140, 47000, '2025-01-12', 'Night'),
(13, 3, 'Piston', 125, 61000, '2025-01-13', 'Day'),
(14, 4, 'Clutch Plate', 155, 56000, '2025-01-14', 'Night'),
(15, 5, 'Axle Rod', 100, 42000, '2025-01-15', 'Day'),
(16, 1, 'Cylinder', 85, 50000, '2025-01-16', 'Night'),
(17, 2, 'Engine Part', 95, 74000, '2025-01-17', 'Day'),
(18, 3, 'Brake Pad', 220, 33000, '2025-01-18', 'Night'),
(19, 4, 'Gear Box', 115, 48000, '2025-01-19', 'Day'),
(20, 5, 'Piston', 105, 62000, '2025-01-20', 'Night');

-- SQL Assignment-1 Anwsers

Select * from Production;

Select production_name,quantity_produced from Production;

Select production_name,quantity_produced from Production where quantity_produced>150;

Select production_name,production_cost from Production where production_cost<50000;

Select production_name,quantity_produced from production where quantity_produced between 80 and 120;

Select * from Production where production_name="Gear Box";

Select Production_name,quantity_produced,production_cost,production_date,shift from production where shift="Day";

Select production_name,quantity_produced,shift from production where shift="Night";

Select distinct production_name from Production;

Select DISTINCT shift from Production;

Select * from production order by production_cost ASC;

Select * from production order by quantity_produced DESC;

Select * from Production order by production_date DESC;

Select * from production Limit 5;

Select production_name,quantity_produced from Production order by quantity_produced DESC Limit 3;

Select * from production Limit 20 OFFSET 5;

Select factory_name,Production_name,quantity_produced,Production_cost from factory as f Inner Join Production as p 
on f.factory_id=p.factory_id;

Select factory_name,sum(quantity_produced) from factory as f inner join Production as p 
on f.factory_id=p.factory_id group by factory_name;

Select Production_name,Location from factory as f inner join Production as P 
where f.factory_id=P.factory_id and Location="Pune"; 

Select factory_name,production_cost from factory as f inner join Production as P 
on f.factory_id=P.factory_id and production_cost>60000;

Select factory_name,production_name,production_cost from factory as f inner join Production as P
on f.factory_id=P.factory_id and shift="Day" order by production_cost desc Limit 5 ;

Select distinct production_name,location from factory as f inner join Production as P
on f.factory_id=P.factory_id and location="Bangalore" || "Pune";

Select production_name,quantity_produced,factory_name from factory as f inner join Production as P
on f.factory_id=P.factory_id order by quantity_produced desc Limit 5 offset 2;

Select factory_name,production_name,production_cost,shift from factory as f inner join Production as P
on f.factory_id=P.factory_id and production_cost between 40000 AND 70000 
and shift="Night" and location="Hyderabad"||"Chennai";

Select factory_name,production_name,quantity_produced from factory as f inner join Production as P
on f.factory_id=P.factory_id and quantity_produced>100 AND production_name!="Brake Pad" 
order by factory_name and quantity_produced DESC; 




