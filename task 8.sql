DELIMITER $$
create procedure get_user(in f_name varchar(100),l_name varchar(100))
begin
    select*from users
    where first_name = f_name and last_name = l_name;
end $$
DELIMITER $$

CALL get_user('naveen','kumar')

delimiter $$
create function uproduct(id int)
returns int
deterministic
begin
    declare uid int default 0 ;
    select  product_id into uid from product
    where product_id = id;
    return uid;
end $$
delimiter ;

select uproduct(1)

delimiter //
create procedure cus_item(in uid int,in uprice int ,out total int)
begin
     declare id int default 0 ;
     declare prices int default 0;
     select count(quantity) into id from order_item where product_id = uid;
     select count(product_id) into prices from order_item where price = uprice;
      set total = prices + id;
      
      if total < 10 then
       signal sqlstate '01000'
        set message_text = 'warning more than 10000';
      end if;
end //
delimiter ;

call cus_item('6','4000',@tot);
select @tot;

DELIMITER //
CREATE FUNCTION SimpleCompare(n INT, m INT)
  RETURNS VARCHAR(50)
  DETERMINISTIC
BEGIN
  DECLARE result VARCHAR(50);
  IF n > m THEN
    SET result = '>';
  ELSEIF n = m THEN
    SET result = '=';
  ELSE
    SET result = '<';
  END IF;

  RETURN CONCAT(n, ' ', result, ' ', m);
END//
DELIMITER ;

SELECT SimpleCompare(7, 8); 



