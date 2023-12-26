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

create table comment(
cno int auto_increment, 
bno int not null, 
writer varchar(100) not null, 
content varchar(500), 
reg_date datetime default now(), 
primary key(cno));

-- 2023-12-26 --
create table file(
uuid varchar(256) not null, 
save_dir varchar(256) not null, 
file_name varchar(256) not null, 
file_type tinyint(1) default 0, 
bno int, 
file_size int, 
reg_date datetime default now(), 
primary key(uuid));
