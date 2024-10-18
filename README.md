# sql-challenge



Had issue with date format with employees csv file has to use python to change the date value

using the following code

import pandas as pd

# Step 1: Read the CSV file
df = pd.read_csv('path_to_your_file.csv')

# Step 2: Convert the date columns from MM/DD/YYYY to a DateTime object
df['birth_date'] = pd.to_datetime(df['birth_date'], format='%m/%d/%Y')
df['hire_date'] = pd.to_datetime(df['hire_date'], format='%m/%d/%Y')

# Step 3: Format the dates into YYYY-MM-DD
df['birth_date'] = df['birth_date'].dt.strftime('%Y-%m-%d')
df['hire_date'] = df['hire_date'].dt.strftime('%Y-%m-%d')

# Step 4: Save the modified data back to a CSV file
df.to_csv('modified_file.csv', index=False)