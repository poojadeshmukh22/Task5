select * from sales
	
---Left Join

select order_line, customer_id, customer_id,sales,quantity from sales

select product_id,category,product_name from product

select customer_id,customer_name, age from customer

select s.order_line, s.customer_id, s.product_id,sales,p.category,p.product_name from sales as s
left join product as p
on s.product_id= p.product_id
limit 200


select sum(s.sales),avg(s.quantity),p.category,p.product_name from sales as s
left join product as p
on s.product_id=p.product_id
group by s.order_line , p.category,p.product_name
having sum(s.sales)>500
order by avg(s.quantity) ASC
limit 100
offset 50


----- Right Join

select order_line,customer_id,ship_mode,sales,profit from sales

select customer_id,age,country,postal_code from customer

select s.order_line,s.customer_id,s.ship_mode,s.sales,s.profit,c.customer_id,c.age,c.country,c.postal_code from sales as s
right join customer as c
on s.customer_id= c.customer_id


select sum(s.sales),avg(c.age),c.country,c.postal_code from sales as s
right join customer as c
on s.customer_id= c.customer_id
group by s.order_line,c.age,c.country,c.postal_code
having sum(s.sales)<1000
order by c.country= 'United States'
limit 500
offset 100

	

----Full Join

select order_line,customer_id,sales,discount,profit from sales

select customer_id,customer_name,city,region from customer

select s.order_line,s.customer_id,s.sales,s.discount,s.profit,c.customer_name,c.city,c.region from sales as s
full join customer as c
on s.customer_id=c.customer_id


select s.order_line,s.customer_id,sum(s.sales),s.discount,s.profit,c.customer_name,c.city,c.region from sales as s
full join customer as c
on s.customer_id=c.customer_id
group by s.order_line,s.customer_id,c.customer_name,c.city,c.region,s.discount,s.profit
having SUM(s.sales)<1000
limit 10
offset 10
