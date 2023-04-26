create table impar (
a int primary key
);

create table par (
a1 int primary key
);

delimiter //
create procedure paroimpar2(IN n int)
begin
if (n % 2) = 0 then
insert into par values(n);
else
insert into impar values(n);
end if;
End //
delimiter ;

delimiter //
create procedure paroimpar2(IN n int)
begin

while n > 0 do
if(n % 2) = 0 then
insert into par values(n);
else
insert into impar values(n);
end if;
set n= n - 1;
end while;

end //
delimiter ;

Ej 3

create table fibo (
num int
);

delimiter //

create procedure Fibona2(IN n int)
begin
declare a int default 0;
declare b int default 1;
declare c int default 0;
insert into fibo values(0);
insert into fibo values(1);

while(b < n) do
set c=a+b;
if(c < n) then
insert into fibo values (c);
end if;
set a=c+b;
if(a < n) then
insert into fibo values (a);
end if;
set b=a+c;
if(b < n) then
insert into fibo values (b);
end if;
end while;
end //
delimiter ;


Ejercicio 4
drop function if exists decimales;
delimiter //


create function decimales(n float ,d int) returns varchar(100) deterministic
begin 
declare a float default 0.0;
declare texto varchar(40);
declare textosub varchar(40);
declare final varchar(40);
declare b int default 0;

set a=round(n,d);
select cast(a as char(40)) into texto;
set  textosub =substring_index(texto,".",-1);
if(length(textosub) < d )then
set b=d-length(textosub);
set final=rpad(texto,"0",b);
end if;

return final;
end //

delimiter ;

Ejercicio 5 PAD

delimiter //

create function pad(string varchar(40),c varchar(10),lon int,sentido varchar(3))


