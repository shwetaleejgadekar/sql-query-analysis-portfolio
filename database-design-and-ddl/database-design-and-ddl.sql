-- ------------- CREATING & SHOWING DATABASE -------------
create database if not exists Business;


-- ------------- USING DATABASE -------------
use Business;


-- ------------- CREATING TABLES -------------
create table if not exists customer (
    customer_id int primary key,
    name varchar(50) not null,
    email varchar(100) unique not null
);


create table if not exists item(
	item_id int primary key,
	name varchar(50) not null,
	Price int not null
); 


create table if not exists `order`(
	order_id int primary key,
	customer_id int not null,
	item_id int not null unique,
	quantity int,
    foreign key (customer_id)
		references customer(customer_id)
		on update cascade
		on delete no action,
    foreign key (item_id)
		references item(item_id)
		on update cascade
		on delete no action
); 


-- ------------- INSERTING DATA INTO TABLES -------------
insert into customer
values 
(1, "Rosalyn Rivera", "rr@adatum.com"),
(2, "Jayne Sargen", "jayne@test.com"),
(3, "Dean Luong", "dean@test.com");

insert into item
values 
(1, "Chair", 200),
(2, "Table", 100),
(3, "Lamp", 50);

insert into `order`
values 
(1, 2, 1, 1),
(2, 2, 2, 3),
(3, 3, 3, 5);

