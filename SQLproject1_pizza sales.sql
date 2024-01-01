select * from pizza_sales;

select * from pizza_sales;

select sum(total_price) as total_revenue from pizza_sales;

select sum(total_price) / count(distinct order_id) as avg_order_value from pizza_sales;

select sum(quantity) as total_pizza_sold from pizza_sales;

select count(distinct order_id) as total_orders from pizza_sales;

select cast (cast(sum(quantity)as decimal(10,2)) / 
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as avg_pizza_per_order from pizza_sales;

-- hourly trend for total pizza sold

select datepart(hour, order_time) as order_hour, sum(quantity) as total_pizzas_sold from pizza_sales
group by datepart(hour, order_time)
order by datepart(hour, order_time);

--weekly trend for total orders

select DATEPART(iso_week, order_date) as week_number, year(order_date) as order_year,
count(distinct order_id) as total_order from pizza_sales
group by  DATEPART(iso_week, order_date), year(order_date)
order by  DATEPART(iso_week, order_date), year(order_date);

select pizza_category, sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as PCT from pizza_sales 
group by pizza_category; 

select pizza_size, cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales where datepart(quarter, order_date) = 1) as decimal(10,2)) as PCT from pizza_sales 
where datepart(quarter, order_date) = 1
group by pizza_size
order by PCT desc; 

select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name 
 order by total_revenue desc;

select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name 
 order by total_revenue asc;

select top 5 pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name 
 order by total_quantity desc;

select top 5 pizza_name, count(distinct order_id) as total_orders from pizza_sales
group by pizza_name 
 order by total_orders;