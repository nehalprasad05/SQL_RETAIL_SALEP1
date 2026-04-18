drop table if exists Retail_sales;

-- create table
CREATE TABLE Retail_Sales (
   transactions_id	int primary key,
  sale_date 	date,
  sale_time time,
   customer_id	int,
  gender varchar(10),	
  age	int,
  category	varchar(15),
  quantiy	int,
  price_per_unit	float,
  cogs	float,
  total_sale float)

select * from retail_sales;


select count (*) from retail_sales;

--data cleaning 

select * from retail_sales
where transactions_id is null;

select * from retail_sales
where sale_date is null;

select * from retail_sales
where customer_id is null;

select * from retail_sales
where 
    transactions_id is null
	or 
	sale_date is null 
	or 
	customer_id is null
	or 
	gender is null
	or 
	age is null 
	or
	category is null
	or 
	quantiy is null
	or
	price_per_unit is null
	or 
	cogs is null 
	or 
	total_sale is null;

	delete from retail_sales
	where 
    transactions_id is null
	or 
	sale_date is null 
	or 
	customer_id is null
	or 
	gender is null
	or 
	age is null 
	or
	category is null
	or 
	quantiy is null
	or
	price_per_unit is null
	or 
	cogs is null 
	or 
	total_sale is null;


	-- data expolartions
	-- how many records we have 
	select count (*) as total_sales from retail_sales;

--- how many  unique customers we have 

select count(distinct customer_id) as total_customers from retail_sales;

-- how many  unique category we have
select distinct (category) as unique_category from retail_sales;


--data analysis and business problems 

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 or equal  in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
select * from retail_sales

--ans1 
select * from retail_sales 
where sale_date = '2022-11-05';

--ans2

select * from retail_sales
where category = 'Clothing'
and TO_CHAR(sale_date,'YYYY-MM')='2022-11'
AND quantiy>=4

--ans3

select category ,sum (total_sale),COUNT (*) as total_orders
from retail_sales
group by category 

--ans4

select ROUND(AVG(age),3)as average_age from retail_sales
where category='Beauty'

--ans5
select * from retail_sales
where total_sale > '1000'


--ans6

select gender,category , count(*) as total_transactions from retail_sales
group by gender, category
order by 2


--ans7
select 
      EXTRACT( YEAR  FROM sale_date)as YEAR,
      EXTRACT ( MONTH FROM sale_date)as month,
	   AVG(total_sale) as AVERAGE_TOTAL_SALE
from retail_sales
group by year , month
order by year,  AVERAGE_TOTAL_SALE DESC


--ans8

select customer_id,
       sum(total_sale) as sum_total_sale
	   from retail_sales

	  group by customer_id
	  order by sum_total_sale desc
	  limit 5

--ans9
select category,
count(distinct customer_id ) as cnt_uniuqe_id
from retail_sales
group by category




