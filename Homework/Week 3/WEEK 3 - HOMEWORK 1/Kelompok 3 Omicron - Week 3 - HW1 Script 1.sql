with specific_customer as
	(
	select 
		id,
		gender,
		city,
		email 
	from datasource_sql_ds11.customer
	where 
		gender = 'Female' and 
		city = 'Jakarta' and 
		email = 'Gmail'
	)
select 
	c.gender,
	c.city,
	c.email,
	count(c.id)
from specific_customer as c
inner join
	(
	select 
		customer_id, 
		count(customer_id) as cid
	from datasource_sql_ds11.transaction
	group by customer_id 
	having count(customer_id) >= 10
	)
	as t
on c.id = t.customer_id
group by
	c.gender,
	c.city,
	c.email
	

	
	
	
	