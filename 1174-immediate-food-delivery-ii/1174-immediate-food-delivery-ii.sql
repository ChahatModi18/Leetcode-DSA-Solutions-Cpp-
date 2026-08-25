# Write your MySQL query statement below
SELECT round(avg(order_date=customer_pref_delivery_date)*100,2) AS immediate_percentage 
from delivery
where(customer_id, order_date) 
in
(
    select customer_id, min(order_date)
    from delivery
    group by customer_id
);

/*
order_date = customer_pref_delivery_date
checks whether the order is immediate.

FIRST ORDER
    ↓
MIN(order_date)
    ↓
filter those rows
    ↓
compare actual date with preferred date
    ↓
TRUE = 1, FALSE = 0
    ↓
AVG()
    ↓
× 100
    ↓
ROUND(..., 2)


QUERY FUNCTIONING LOGICAL FLOW :
                 DELIVERY TABLE
                       │
                       ▼
          ┌────────────────────────┐
          │  GROUP BY customer_id  │
          │  MIN(order_date)       │
          └────────────┬───────────┘
                       │
                       ▼
              FIRST ORDER
              OF EACH CUSTOMER
                       │
                       ▼
          ┌────────────────────────┐
          │ WHERE (customer_id,    │
          │       order_date) IN   │
          │       first orders     │
          └────────────┬───────────┘
                       │
                       ▼
             ONLY FIRST ORDERS
                       │
                       ▼
          ┌────────────────────────┐
          │ order_date =           │
          │ customer_pref_delivery│
          │ _date                  │
          └────────────┬───────────┘
                       │
                       ▼
              TRUE = 1 / FALSE = 0
                       │
                       ▼
                    AVG()
                       │
                       ▼
                  × 100
                       │
                       ▼
                 ROUND(..., 2)
                       │
                       ▼
              immediate_percentage

*/ 