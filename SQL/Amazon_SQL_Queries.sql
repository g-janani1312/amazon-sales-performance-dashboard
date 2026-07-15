SELECT * FROM amazon_table;

ALTER TABLE amazon_table
RENAME TO amazon;

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

select count(*) as total_orders from amazon;

select * from amazon limit 10;

select distinct category from amazon;

select distinct ship_state from amazon;

select sum(amount) as total_revenue from amazon;

select sum(qty) as total_quantity from amazon;

select avg(amount) as average_order_value from amazon;

select max(amount) from amazon;
select min(amount) from amazon;

select category, 
sum(amount) as revenue 
from amazon 
group by category 
order by revenue desc;

select category, 
count(*) as orders 
from amazon 
group by category
order by orders asc;

select ship_state,
sum(amount) as revenue
from amazon
group by ship_state 
order by revenue desc
limit 10;

select ship_city,
sum(amount) as revenue
from amazon
group by ship_city 
order by revenue desc
limit 10;

select ship_city,
count(*) as total_orders
from amazon
group by ship_city
order by total_orders desc
limit 10;

select ship_state,
count(*) as total_orders
from amazon
group by ship_state
order by total_orders desc
limit 10;

select category,sum(qty) as total_quantity from amazon
where ship_city='Bengaluru' 
group by category
order by total_quantity desc;

select category,sum(amount) as total_revenue from amazon
where ship_city='Bengaluru' 
group by category
order by total_revenue desc;

select ship_state,category,sum(qty) as total_quantity
from amazon
group by ship_state,category
order by ship_state,total_quantity desc ;

select ship_state,category,count(*) as total_orders
from amazon
group by ship_state,category
order by ship_state,total_orders desc;

select ship_state, category,sum(amount) as total_revenue
from amazon 
group by ship_state, category
order by ship_state, total_revenue asc;

select category,ship_state,total_quantity
from (
		select category,ship_state,sum(qty) as total_quantity,
		rank() over(
				partition by ship_state 
				order by sum(qty) desc
			) as rank
		from amazon
		group by ship_state,category
)
Where rank=1;

select category,ship_city,total_quantity
from (
		select category,ship_city,sum(qty) as total_quantity,
		rank() over(
				partition by ship_city 
				order by sum(qty) desc
			) as rank
		from amazon
		group by ship_city,category
		order by total_quantity desc
)
Where rank=1
limit 10;

select status, count(*) as orders from amazon group by status;

select fulfilment, count(*) as orders from amazon group by fulfilment;

select b2b, count(*) as orders from amazon group by b2b;

select month, month_name, sum(amount) from amazon group by month,month_name order by month;

select * from amazon where amount>5000;

select distinct status from amazon;

select count(*) as total_order_shipped from amazon where status='Shipped';

select status,sum(amount) as revenue from amazon group by status order by revenue desc;

select status,count(order_id) as total_orders from amazon group by status order by total_orders desc;

select ship_state, sum(qty) as total_quantity from amazon group by ship_state order by total_quantity desc;

select sku,sum(amount) as revenue from amazon group by sku order by revenue desc limit 5;