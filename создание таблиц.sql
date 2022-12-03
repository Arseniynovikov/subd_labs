use database_for_labs;

create table loyalty(
	id int primary key auto_increment,
    loyalty_name varchar(45) unique not null,
    percent int unique not null 
);

create table customer(
	id int, 
    loyalty_id int, 
    foreign key (id) references users(id) on update cascade on delete cascade, 
    foreign key (loyalty_id) references loyalty(id) on update cascade on delete set null 
);

create table shop(
	id int primary key auto_increment, 
    shop_name varchar(45) unique not null,
    shop_phone varchar(45) unique not null
);

create table courier(
	id int, 
    shop_id int, 
    foreign key (id) references users(id) on update cascade on delete cascade, 
    foreign key (shop_id) references shop(id) on update cascade on delete set null 
);

create table basket(
	id int primary key auto_increment, 
    user_id int not null, 
    full_price int default 0, 
    foreign key (user_id) references users(id) on update cascade on delete cascade
);

create table category(
	id int primary key auto_increment, 
    category_name varchar(45) not null, 
	category_description varchar(45) not null 
);

create table products(
	id int primary key auto_increment, 
    products_name varchar(45) unique not null,
    category_id int,
    price float default 0.0, 
    foreign key (category_id) references category(id) on update cascade on delete set null 
);

create table product_basket(
	basket_id int, 
    product_id int, 
    foreign key (basket_id) references basket(id) on update cascade on delete cascade, 
    foreign key (product_id) references products(id) on update cascade on delete cascade 
);

create table product_shop(
	shop_id int, 
    product_id int, 
    foreign key (shop_id) references shop(id) on update cascade on delete cascade, 
    foreign key (product_id) references products(id) on update cascade on delete cascade 
);

create table orders(
	id int primary key auto_increment, 
    basket_id int not null, 
    courier_id int not null, 
    foreign key (basket_id) references basket(id) on update cascade on delete cascade, 
    foreign key (courier_id) references courier(id) on update cascade on delete cascade 
);