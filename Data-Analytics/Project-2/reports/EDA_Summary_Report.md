# EDA Summary Report

Dataset: 1200 e-commerce orders, Jan 2023 to Jun 2025

## What I checked

- Missing values, duplicate rows, and whether Quantity x UnitPrice actually
  equals TotalPrice everywhere
- Mean, median, std dev, and skewness for the numeric columns
- Outliers using the IQR method (Q1 - 1.5*IQR to Q3 + 1.5*IQR)
- Correlation between the numeric columns
- Revenue and order counts split by product, status, payment method,
  referral source, and month

## Findings

**Data quality**
No duplicate rows, no duplicate order IDs, and Quantity x UnitPrice matches
TotalPrice for every row. The only column with missing values is CouponCode
(about 26% blank), but that just means no coupon was used on that order, so
I filled it with "NONE" instead of dropping anything.

**Order value is skewed**
Mean order value is about 1054, median is about 824. Skewness is around 0.89
which means it's right-skewed - a few large orders pull the average up. So
median is the better number to use when talking about a "typical" order.

**Outliers**
Quantity, UnitPrice, and ItemsInCart have zero outliers. TotalPrice has 8
outliers, all high value orders (large quantity + high unit price together).
These look like genuinely big orders rather than data entry mistakes, so I
kept them instead of removing them.

**Order status**
Cancelled (250) and Returned (247) orders together make up about 41% of all
orders. That's a big chunk of orders that never actually convert - probably
the most useful thing to dig into further.

**Correlations**
- UnitPrice vs TotalPrice: 0.72 (makes sense, price drives total)
- Quantity vs TotalPrice: 0.62
- Quantity vs ItemsInCart: 0.65
- UnitPrice vs Quantity: 0.01 (basically no relationship)

**Other stuff**
Product categories are fairly evenly split (156-181 orders each, no single
category dominates). About 74% of orders used one of the three coupon codes,
so coupons are used a lot, not just occasionally.

## Takeaways

- Use median, not mean, when reporting typical order value
- The 41% cancel/return rate is the biggest thing worth investigating next
- No bulk-discount pattern exists yet (price and quantity don't correlate),
  could be worth testing
- The 8 outlier orders could be worth a manual look (possible bulk/VIP
  customers)
