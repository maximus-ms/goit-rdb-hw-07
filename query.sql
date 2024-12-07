use l3;

-- p1
select id, date, year(date), month(date), day(date) from orders;

-- p2
select id, date, date + interval 1 day as new_date from orders;

-- p3
select id, date, timestamp(date) as timestamp from orders;

-- p4
select count(*) from orders where date between '1996-07-10 00:00:00' and '1996-10-08 00:00:00';

-- p5
drop function if exists create_json_data;
delimiter //
create function create_json_data(id int, date datetime)
returns json
deterministic 
no sql
begin
    return json_object('id', id, 'date', date);
end //
delimiter ;

select id, date, create_json_data(id, date) from orders;




