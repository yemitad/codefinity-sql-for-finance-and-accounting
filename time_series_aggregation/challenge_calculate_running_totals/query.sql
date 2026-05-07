-- Write your code here
Select transaction_date, amount,description, sum(amount) over (order by transaction_date
    rows between unbounded preceding and current row)as running_total
From transactions
Where category ='Expense'
Group by transaction_date, amount,description
order by transaction_date