create table board(
bno int auto_increment, 
title varchar(200), 
writer varchar(200), 
content text, 
isDel varchar(10) default 'N', 
reg_date datetime default now(), 
read_count int, 
primary key(bno));

create table member(
id varchar(100) not null, 
pw varchar(100) not null, 
name varchar(100), 
email varchar(100), 
home varchar(100), 
age int, 
reg_date datetime default now(), 
last_login datetime default now(), 
primary key(id));