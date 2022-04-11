select 
	case 
		when c.city = 'Jakarta' then 'Jakarta'
		else 'Other City'
	end as customer_city,
	c.gender,
	s.type,
	sum(t.quantity)	
from 
	(
		(
		datasource_sql_ds11.transaction as t
		inner join datasource_sql_ds11.customer as c 
		on t.customer_id = c.id
		)
	inner join  datasource_sql_ds11.store as s
	on t.store_id = s.id 
	)
group by 
	customer_city,
	c.gender,
	s.type
order by 
	sum(t.quantity) desc,
	s.type
limit 4
	
	
	
	
	
