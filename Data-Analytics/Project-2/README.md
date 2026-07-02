# Project 2 - Exploratory Data Analysis

This is my Project 2 submission for the Data Analytics internship (EDA phase).
The dataset has 1200 e-commerce order records, and the goal was to explore it -
check data quality, find patterns/trends, detect outliers, and write down what
the numbers actually mean.

## Folder structure

```
project-2-eda/
├── README.md
├── requirements.txt
├── data/
│   ├── raw/orders_raw.csv
│   └── cleaned/orders_cleaned.csv
├── notebooks/
│   └── EDA_Project2.ipynb
├── visuals/
│   └── (chart images used in the notebook)
└── reports/
    └── EDA_Summary_Report.md
```

## What's in the notebook

- Loaded the dataset and checked for missing values / duplicates
- Cleaned the CouponCode column (blank just means no coupon was used)
- Basic stats - mean, median, std dev, skewness for the numeric columns
- Outlier check using the IQR method
- Distribution plots, boxplots, bar charts for categories
- Monthly revenue trend
- Correlation between the numeric columns
- Final summary of what I found

## How to run it

```
pip install -r requirements.txt
jupyter notebook notebooks/EDA_Project2.ipynb
```

Run the cells top to bottom - it reads the raw csv, cleans it, saves the cleaned
version, and regenerates all the charts.

## Main findings

- Dataset is mostly clean - no duplicate rows, no calculation errors
- TotalPrice is right-skewed, so median (~824) is a better "typical order"
  number than the mean (~1054)
- Found 8 outlier orders (high value ones) using IQR - kept them, they look
  like real big orders, not errors
- Cancelled + Returned orders make up about 41% of all orders - biggest thing
  worth looking into
- UnitPrice and TotalPrice are fairly correlated (0.72) which makes sense
- UnitPrice and Quantity barely correlate (0.01)

More detail is in reports/EDA_Summary_Report.md.
