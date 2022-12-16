use database_for_labs;

drop trigger delete_product_from_shop;


delimiter |
create trigger users_insert after insert on users
for each row begin
	insert into logging set msg = concat('insert ', new.login), row_id = new.id;
    call insert_users_by_role(new.id, new.role_id);
end;


    
delimiter &&
create procedure insert_users_by_role(in id int, in role_id int)
begin 
	if role_id = 1 then 
		insert customer(id, loyalty_id)
        values (id, 1);
	elseif role_id = 4 then
		insert courier(id, shop_id)
        values (id, 1);
	end if;
end&&



delimiter |
create trigger users_update before update on users
for each row begin
	insert into logging set msg = concat('update ', old.login), row_id = old.id;
end;



delimiter |
create trigger users_delete before delete on users
for each row begin
	insert into logging set msg = concat('delete ', old.login), row_id = old.id;
    call user_del(old.role_id, old.id);
end;

delimiter &&
create procedure user_del(in role_id int, in user_id int)
begin
	if role_id = 1 then 
		delete from customer where id = user_id;
	elseif role_id = 4 then 
		delete from courier where id = user_id;
	end if;
end&&

delimiter |
create trigger add_product_to_basket after insert on product_basket
for each row begin
	call change_fullprice('+', new.basket_id, (select price from products where id = new.product_id));
end;


delimiter |
create trigger delete_product_from_basket before delete on product_basket
for each row begin
	call change_fullprice('-', old.basket_id, (select price from products where id = old.product_id));
end;
	
    
delimiter &&
create procedure change_fullprice(in operation varchar(45), in basket_id int, in product_price float)
begin
	if operation = '+' then 
		update basket set full_price = full_price + product_price where id = basket_id;
	elseif operation = '-' then 
		update basket set full_price = full_price - product_price where id = basket_id;
	end if;
end&&
		

delimiter |
create trigger delete_product_from_shop before delete on products
for each row begin
	delete from product_shop where product_id = old.id;
    delete from product_basket where product_id = old.id;
end;


delimiter |
create trigger delete_basket before delete on customer
for each row begin 
	delete from basket where user_id = old.id;
end;

