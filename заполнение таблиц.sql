use database_for_labs;

insert roles(role_name)
values 
('user'),
('manager'),
('shop_manager'), 
('courier');

insert loyalty(loyalty_name, percent)
values
('beginner', 5), 
('medium', 15), 
('best', 25);

insert users(login, user_name, phone_number, user_password, role_id)
values
('user1', 'Андрей', '+375 44 1111111', '1111', 1), 
('user2', 'Аня', '+375 44 2222222', '2222', 1), 
('user3', 'Иван', '+375 44 3333333', '3333', 1), 

('manager', 'Арсений', '+375 44 4444444', '4444', 2),

('shop_manager1', 'Саша', '+375 44 5555555', '5555', 3), 
('shop_manager2', 'Маша', '+375 44 6666666', '6666', 3), 
('shop_manager3', 'Паша', '+375 44 7777777', '7777', 3),

('courier1', 'Лиза', '+375 44 1888888', '8881', 4), 
('courier2', 'Игнат', '+375 44 2888888', '8882', 4), 
('courier3', 'Вася', '+375 44 3888888', '8883', 4); 

insert customer(id, loyalty_id)
values
(1, 1), 
(2, 2),
(3, 3);

insert shop(shop_name, shop_phone)
values
('shop1', '+375 33 1121212'),
('shop2', '+375 33 2222222'),
('shop3', '+375 33 3333333'),
('shop4', '+375 33 4444444');

insert courier(id, shop_id)
value
(8, 1), 
(9, 2), 
(10, 3);

insert category(category_name, category_description)
value
('Электроника', 'Бытовая электроника, гаджеты'), 
('Стройка', 'Строительные материалы и преспособления'), 
('Мебель', 'Столы, стулья, диваны и т.д.'),
('Компьютера', 'Мышки, мониторы, комплектующие');

insert products(products_name, category_id, price)
values
('Стиральная машина', 1, 250.00),
('Холодильник', 1, 300.00),
('Пылесос', 1, 400.00),

('Краска', 2, 100.00),
('Обои', 2, 200.00),
('Кисточки', 2, 300.00),

('Диваны', 3, 100.00),
('Кресла', 3, 200.00),
('Столы', 3, 300.00),

('Мыши', 4, 100.00),
('Мониторы', 4, 200.00),
('Клавиатура', 4, 300.00);

insert basket(user_id, full_price)
values
(1, 300.00),
(2, 300.00),
(3, 300.00);

insert product_basket(basket_id, product_id)
values
(1, 10),
(1, 11),

(2, 7),
(2, 8),

(3, 4),
(3, 5);

insert product_shop(shop_id, product_id)
values
(1, 1),
(1, 2),
(1, 3),

(2, 4),
(2, 5),
(2, 6),

(3, 7),
(3, 8),
(3, 9),

(4, 10),
(4, 11),
(4, 12);

insert orders(basket_id, courier_id)
values
(1, 8),
(2, 9),
(3, 10);