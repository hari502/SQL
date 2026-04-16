--- Part A
select Production_name,quantity_produced,production_cost,(production_cost/quantity_produced) 
as Cost_per_Unit from Production;

Select production_name,production_date,Year(production_date) as production_year from Production;

Select production_name,production_cost,production_cost*1.10 as Estimated_future_Cost from production;

Select production_name,production_cost,production_cost * quantity_produced as Production_value
from production;

Select production_id,quantity_produced,(250-quantity_produced) as Remaining_Capacity from Production;

-- Part B
Select Sum(quantity_produced) as Total_quantity_produced_across_all_factories from production;

Select AVG(production_cost) as Average_prodcution_cost from Production;

Select Max(quantity_produced) as Maximum_quantity_produced,Min(quantity_produced) as Minimum_quantity_produced
From production;

Select Count(shift) As production_records_exist_for_Night_shift from Production where shift="Night";

Select count(distinct production_name) As Total_number_of_products_manufactured
from production;

-- Part C
Select production_name,Sum(quantity_produced) from production group by production_name;

Select factory_name,sum(production_cost) as Total_production_cost from factory f left join Production p 
on f.factory_id=p.factory_id group by factory_name;

Select shift,Avg(quantity_produced) as average_quantity_produced_per_shift from production group by shift;

Select factory_name,Count(Production_name) as production_records_per_factory 
from factory f inner join Production p
on f.factory_id=p.factory_id group by factory_name;

Select production_name,Sum(quantity_produced) as Total_quantity,Avg(production_cost) as Average_cost,
Sum(quantity_produced*production_cost) as Total_cost from production group by production_name;

-- Part D
Select factory_name,sum(quantity_produced) as Total_quantity_per_factory from factory f
inner join Production p on f.factory_id=p.factory_id group by factory_name 
order by Total_quantity_per_factory desc;

Select factory_name,Sum(production_cost) as Total_Cost from factory f
inner join Production p on f.factory_id=p.factory_id group by factory_name order by Total_Cost DESC;

Select production_name,sum(quantity_produced) as Total_quantity_produced from Production 
group by production_name order by Total_quantity_produced DESC Limit 3;

Select * from production order by production_cost ASC limit 5;

Select factory_name,production_name,production_cost from factory f inner join production p
on f.factory_id=p.factory_id order by factory_name,production_cost;


