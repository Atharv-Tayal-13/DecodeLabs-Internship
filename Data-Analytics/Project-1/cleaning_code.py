import pandas as pd

df = pd.read_excel('Dataset for Data Analytics.xlsx')
df['CouponCode'] = df['CouponCode'].fillna('No Coupon')
df = df.drop_duplicates()
df.to_excel('Cleaned_Dataset.xlsx', index=False)

print('Dataset cleaned successfully')
