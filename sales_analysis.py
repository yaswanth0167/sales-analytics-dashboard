import pandas as pd
import numpy as np
import matplotlib.pyplot as plt 
import seaborn as sns
df=pd.read_csv("cleaned_sales.csv")
print(df.head())
print(df.info())
print(df.isnull().sum())
print(df['Sales'].sum())
top_products = df.groupby('Product Name')['Sales'].sum().sort_values(ascending=False).head(10)
print(top_products)
monthly_sales = df.groupby('Month')['Sales'].sum()

print(monthly_sales)
monthly_sales.plot(figsize=(10,5))

plt.title("Monthly Sales Trend")
plt.xlabel("Month")
plt.ylabel("Sales")

plt.show()
region_sales = df.groupby('Region')['Sales'].sum()

region_sales.plot(kind='bar')

plt.title("Region-wise Sales")

plt.show()
category_sales = df.groupby('Category')['Sales'].sum()

print(category_sales)

numeric_df = df.select_dtypes(include=np.number)

sns.heatmap(numeric_df.corr(), annot=True)

plt.show()


from sklearn.linear_model import LinearRegression
monthly_sales = df.groupby('Month')['Sales'].sum().reset_index()
print(monthly_sales)


monthly_sales['Month_Number'] = range(1,13)
print(monthly_sales)

X = monthly_sales[['Month_Number']]
y = monthly_sales['Sales']
model = LinearRegression()
model.fit(X,y)
future_months = [[13], [14], [15]]

predictions = model.predict(future_months)

print(predictions)
plt.figure(figsize=(10,5))

plt.plot(monthly_sales['Month_Number'], y, label='Actual Sales')

plt.plot([13,14,15], predictions, label='Forecasted Sales')

plt.xlabel("Month Number")
plt.ylabel("Sales")
plt.title("Sales Forecasting")

plt.legend()

plt.show()