SELECT month, 
       total_revenue,
    total_revenue- LAG(total_revenue) over(order by month)
     as revenue_change
FROM (
     select sum(amount) as total_revenue, 
            date_trunc('month',revenue_date) as month
     from revenue
      group by date_trunc('month',revenue_date)
) monthly_revenue
order by month asc;
