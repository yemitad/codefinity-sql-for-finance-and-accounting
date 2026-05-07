-- Write your code here
select concat( Extract(Year from transaction_date),'-Q', extract(quarter from transaction_date)) as quarter, sum(amount) as quarter_total 
From transactions
    Where category = 'Expense'
Group by concat( Extract(Year from transaction_date),'-Q', extract(quarter from transaction_date)) 
order by quarter
