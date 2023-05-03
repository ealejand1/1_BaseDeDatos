create table triggers(
num int primary key,
let varchar(20)
);

delimiter //
drop trigger if exists introtrig //
create trigger introtrig
before insert on triggers for each row
begin
declare a int;

select max(num) into a from triggers ;
if(new.num <= a)then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='ERROR NUMERO';
end if;
end //
delimiter ;

insert into triggers(num) values(3);
