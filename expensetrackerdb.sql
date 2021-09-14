drop database expensetrackerdb;
drop user expensetracker;
create user expensetracker with password 'password';
create database expensetrackerdb with template = template0 owner=expensetracker;
\connect expensetrackerdb;
alter default privileges grant all on table expensetracker;
alter default privileges grant all on sequences expensetracker;

create table et_users(
user_id integer primary key not null,
first_name varchar(20) not null,
last_name  varchar(20) not null;
email  varchar(30) not null;

create table et_categories(
category_id integer primary key not null,
user_id integer not null,
description varchar(50) not null
);

alter table et_categories add constraint cat-users_fk
foreign key(user_id) et_users(user_id);
create table et_transactions(
transaction_id integer primary key not null,
user_id integer not null,
amount  numeric (10, 2) not null,
description varchar(50) not null,
note varchar(50)  not null,
transaction_date bigint not null
);

alter table et_transactions add constraint trans_cat_fk
foreign key (category_id) references et_categories(category_id);
alter table et_transactions add constraint et_users(user_id);
create sequence et_users_seq increment 1 start 1;
create sequence et_categories_seq increment 1 start 1;
create sequence et_transactions_sed increment 1 start 1000;
)