# SQL Analysis Summary

Dataset: 1200 e-commerce orders, loaded into a SQLite database (single
`orders` table) and queried directly with SQL.

## What I checked

- Order counts and revenue split by product, order status, payment method,
  and referral source
- Filtering with WHERE (equality, comparisons, LIKE pattern matching)
- Grouped aggregations with COUNT, SUM, AVG
- HAVING to filter grouped results after aggregation
- Percentage contribution of each product to total revenue
- Repeat customers and the cancelled/returned share

## Findings

**Order counts vs revenue**
Printer (181) and Tablet (179) have the highest order counts, but revenue
share tells a slightly different story - Printer and Chair are actually tied
for the top revenue share (15.47% each), since Chair's average price is
higher even with fewer orders. Revenue is fairly evenly spread across all 7
products, roughly 12-15% each, nothing dominates.

**Order status**
497 out of 1200 orders (about 41%) end up Cancelled or Returned. That's a
big share of orders not converting into a completed sale.

**Payment method**
Average order value is fairly close across payment methods - Credit Card is
highest at 1127.55, Debit Card lowest at 1001.56. Not a huge spread.

**Repeat customers**
Only 11 customers placed more than one order in this dataset. Most customers
are one-time buyers here.

**Shipping addresses**
655 unique shipping addresses across 1200 orders, so there's some overlap -
some addresses show up for more than one order.

## A note on HAVING vs WHERE

WHERE filters rows before any grouping happens. HAVING filters after the
GROUP BY has already aggregated the data, so it can filter on things like
COUNT(*) or AVG(column) which don't exist until the grouping is done. Used
this for things like "only show products with more than 170 orders" - that
can't be written with WHERE since COUNT(*) doesn't exist at the row level.

## Takeaways

- The 41% cancelled/return rate lines up with what came up in the Project 2
  EDA too - it's the most consistent signal across both projects
- Revenue being spread evenly across products means there isn't one product
  carrying the business, which is generally a good sign
- Repeat customer rate is very low, might be worth looking into why most
  customers only order once
