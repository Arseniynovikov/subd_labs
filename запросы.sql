use database_for_labs;

select id, login, user_name from users;
select products_name, price from products;

select products_name, price from products where category_id = 2;

select * from customer;

select * from products where category_id = 3 order by products_name desc;

select * from users;
update users set user_name = 'Марина' where id = 5;
select * from users;

SELECT * FROM products LIMIT 3 OFFSET 2;


delete from users;