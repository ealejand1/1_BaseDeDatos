insert into nums value (1);
insert into nums value (2);
insert into nums value (4);


delimiter //
drop function if exists sumamal //
create function sumamal()
returns int
reads sql data
begin
    declare a int;
    declare resul int default 0;

    declare done boolean default false;
    declare c1 cursor for select id from nums;
    declare continue handler for SQLSTATE '02000' set done = TRUE;

    open c1;
    c1_loop: LOOP
            fetch c1 into a;
            if done then
                leave c1_loop;
            elseif a % 2 = 0 then
                set resul=resul + a;
            else
                set resul=resul - a;
            end if;
        end LOOP c1_loop;
    close c1;
return resul;
end //
delimiter ;


            
