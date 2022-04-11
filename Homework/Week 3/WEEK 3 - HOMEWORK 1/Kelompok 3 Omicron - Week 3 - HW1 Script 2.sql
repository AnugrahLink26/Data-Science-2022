select 
	product_id, 
	sum(quantity) as total_transactions
from datasource_sql_ds11.transaction
where created_at between
	'2018-10-01' and 
	'2018-12-31' and 
	store_id = '2'
group by product_id 
having sum(quantity) > avg(quantity) 
order by total_transactions desc 
limit 5

