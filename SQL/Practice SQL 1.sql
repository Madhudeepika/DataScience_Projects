# 1 - See all shipments - Done
SELECT * FROM shipments;
# SELECT products, s.Date, Amount, Boxes From shipments s;

# 2 – All shipments by SP02
 SELECT * FROM shipments s
 WHERE s.`Sales Person` = 'SP02';
 
# 3 – All shipments by SP02 to G3
SELECT * FROM shipments s
 WHERE s.`Sales Person` = 'SP02' and s.geo = 'G3'
 ORDER by s.amount desc;

# 4 – All shipments in Jan 2023
SELECT * FROM ac_telugu.shipments s
where s.Date between '2023-1-1' and '2023-1-31';

SELECT * FROM ac_telugu.shipments s
where Extract(year_month from s.Date) = 202301;

# 5 – All shipments by SP02, SP03, SP12, SP15
SELECT * FROM ac_telugu.shipments s
where s.`Sales Person` = 'SP02'
or s.`Sales Person` = 'SP03'
or s.`Sales Person` = 'SP12'
or s.`Sales Person` = 'SP15';
SELECT * FROM ac_telugu.shipments s
where s.`Sales Person` in ('SP02', 'SP03', 'SP12', 'SP15');

# 6 – Products that have the word choco in them
select * from ac_telugu.products 
WHERE product like '%choco%';

# 7 – Sales persons whose name begins with S
select * from people
where `Sales Person` LIKE 'S%';

# 8 – Sales per box of chocolates in Feb 2023
SELECT s.DATE, s.Amount, s.Boxes, ROUND(s.Amount / s.Boxes, 1) AS 'Amount per Box' 
FROM shipments s
WHERE YEAR(s.Date) = 2023 AND MONTH(s.Date) = 2;

# 9 – All shipment data for Subbarao

-- Retrieve all people whose sales person name starts with 'Subba'
SELECT * FROM people WHERE `sales person` LIKE 'Subba%';

-- Retrieve shipments assigned to sales person ID 'sp11'
SELECT * FROM shipments WHERE `sales person` = 'sp11';

-- Join shipments and people tables to get relevant sales data for names starting with 'Subba'
SELECT p.`sales person`, s.Date, s.Amount, s.Boxes
FROM shipments s
JOIN people p ON p.`sp id` = s.`sales person`
WHERE p.`sales person` LIKE 'Subba%';

# 10 – All shipment data for Subbarao by month
SELECT DATE_FORMAT(s.Date, '%Y%m') AS YearMonth, SUM(s.Amount), SUM(s.Boxes)
FROM shipments s
JOIN people p ON p.`sp id` = s.`sales person`
WHERE p.`sales person` LIKE 'Subba%'
GROUP BY YearMonth;





# H1 – All shipment data for Subbarao to USA
select p.`sales person`, g.Geo, s.Date, s.Amount, s.boxes from shipments s
join people p on p.`sp id` = s.`sales person`
join geo g on g.GeoID = s.Geo
where
p.`sales person` LIKE 'Subba%' and
g.Geo = 'USA';


# H2 – What is the maximum amount in each month?

select extract(year_month from s.Date), max(s.Amount), min(s.amount)
from shipments s
group by extract(year_month from s.Date);

# H3 – How many shipments we do by each country in the month of March 2023

select g.geo, count(*), sum(s.Amount)
from shipments s
join geo g on g.GeoID = s.Geo
where extract(year_month from s.Date) = 202303
group by g.Geo;
