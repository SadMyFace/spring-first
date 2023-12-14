create table board(
bno int auto_increment, 
title varchar(200), 
writer varchar(200), 
content text, 
isDel varchar(10) default 'N', 
reg_date datetime default now(), 
read_count int, 
primary key(bno));
