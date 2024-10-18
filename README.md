# sql-challenge



Had issue with date format with employees csv file has to use python to change the date value

using the following code

Step 1: Read the CSV file
Step 2: Convert the date columns from MM/DD/YYYY to a DateTime object
Step 3: Format the dates into YYYY-MM-DD
Step 4: Save the modified data back to a CSV file
------------------------------------

import pandas as pd

df = pd.read_csv('path_to_your_file.csv')

df['birth_date'] = pd.to_datetime(df['birth_date'], format='%m/%d/%Y')
df['hire_date'] = pd.to_datetime(df['hire_date'], format='%m/%d/%Y')

df['birth_date'] = df['birth_date'].dt.strftime('%Y-%m-%d')
df['hire_date'] = df['hire_date'].dt.strftime('%Y-%m-%d')

df.to_csv('modified_file.csv', index=False)



When importing CSV files

Add tables, then import csv files, then add FK constraints.
Otherwise will get errors.

-------------

personal notes

when joining, remember to connect the key with relating key in another table.

example:

SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM dept_emp AS de
INNER JOIN departments AS d ON d.dept_no = de.dept_no -- connect here
INNER JOIN employees AS e ON e.emp_no = de.emp_no -- connect here

