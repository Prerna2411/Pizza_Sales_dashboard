select * from pizza_sales;
///kpi requirements
//total revenue-sum of all order prices

select sum(Total_Price) Total_revenue from pizza_sales;

///average order value--sum of prices /total no. of orders
select sum(Total_Price)/count(distinct order_id) Average_order_value from pizza_sales;

///total pizzas sold
select SUM(quantity) Total_pizzas_sold from pizza_sales;

///total orders 
select count(distinct(order_id)) Total_orders from pizza_sales;

///average pizzas per order
select cast(sum(quantity)/count(distinct order_id) as decimal(10,2)) as Average_Pizzas_per_order from pizza_sales;

/////In Oracle SQL, you cannot use column aliases directly in the ORDER BY clause; 
////instead, you need to use the original expression or the positional index of the column.
///date and month trends
select TO_CHAR(order_date,'DAY') as order_day,count(distinct order_id) total_orders from pizza_sales
group by TO_CHAR(order_date,'DAY')
order by TOTAL_ORDERS;

select TO_CHAR(order_date,'MONTH') as order_day,count(distinct order_id) total_orders from pizza_sales
group by TO_CHAR(order_date,'MONTH')
order by total_orders;

///percentage of sales by pizza category

select pizza_category,round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) as percentage
from pizza_sales
group by pizza_category
order by percentage desc;
///where to_char(order_date,'MM')='01'

//percentage of sales by pizza category
select pizza_size,round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) as percentage
from pizza_sales
group by pizza_size
order by percentage desc;


///top 5 best sellers by revenue 
select pizza_name,sum(total_price) as tprice
from pizza_sales
group by pizza_name
order by sum(total_price) desc
fetch first 5 rows only;

///
///bottom 5 best sellers by revenue 
select pizza_name,sum(total_price) as Totalprice
from pizza_sales
group by pizza_name
order by sum(total_price) asc
fetch first 5 rows only;


///top 5 best sellers by quantity
select pizza_name,sum(Quantity) as Totalquantity
from pizza_sales
group by pizza_name
order by sum(quantity) desc
fetch first 5 rows only;

///
///top 5 best sellers by orders
select pizza_name,count(distinct order_id) as Totalorders
from pizza_sales
group by pizza_name
order by count(distinct order_id) desc
fetch first 5 rows only;







