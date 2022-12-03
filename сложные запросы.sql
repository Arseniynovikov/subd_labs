use database_for_labs;

select id from products where category_id > 2 and price >= 100;
select * from basket where user_id = 1 or full_price > 400;

select users.id, users.user_name, users.phone_number, loyalty.percent from customer
inner join users on users.id = customer.id
inner join loyalty on loyalty.id = customer.loyalty_id;

select users.login, users.phone_number, customer.loyalty_id from users
left join customer on customer.id = users.id;


select category_id, sum(price) as sum_price  from products group by category_id;  
select category_id, max(price) as max_price  from products group by category_id;  
select category_id, min(price) as min_price  from products group by category_id;  
select category_id, count(*) as count  from products group by category_id;  

select products_name, price, 
case 
	when price <= 100
		then 'дешёвый товар'
	when price <= 200
		then 'товар средней цены'
	when price > 200
		then 'дорогой товар'
	else 'что-то среднее'
end as category
from products;

explain select * from users;