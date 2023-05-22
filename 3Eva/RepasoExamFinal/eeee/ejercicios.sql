EJ1

delimiter //
drop table if exists par;
drop table if exists impar;
create table par(num int primary key);
create table impar(num int primary key);

drop procedure if exists ej1;
create procedure ej1(n int)
begin
if n % 2 = 0 then
insert into par values (n);
else 
insert into impar values(n);
end if;
end //
delimiter ;

Ej2

delimiter //
drop table if exists par;
drop table if exists impar;
create table par(num int primary key);
create table impar(num int primary key);
drop procedure if exists ej2;
create procedure ej2(n int)
begin

declare a int default 1;
while a < n do
call ej1(a);
set a = a + 1;
end while;
end //
delimiter ;

Ej3

delimiter //
drop table if exists fibo;
create table fibo(a int primary key,b int);

drop procedure if exists ej3;
create procedure ej3(IN n int)
begin

declare pos int default 0;
declare valor int default 0;

while n > valor 
set pos= pos + 1;


EJ4 

drop function if exists ej4;
delimiter //
create function ej4 (num float,cant int) returns varchar(40) deterministic
begin

declare a float default 0.0;
declare texto varchar(40);
declare textosub varchar(40);
declare final varchar(40);
declare dif int;

set a =round(num,cant);
select cast(a as char(40)) into texto;
set textosub = substring_index(texto,".",-1);
if(length(textosub) < cant) then
set dif=cant-length(textosub);
set final=RPAD(texto,dif+length(texto),"0");
else
set final=texto;
end if;
return final;
end //

delimiter ;
