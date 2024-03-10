import pandas as pd

# Read the CSV file into a DataFrame
df = pd.read_csv('./recipes.csv', sep=';')

col = df.columns 

r_col = range(0,8)
i_col = range(9,62)
p_col = range(63,77)

#df.iloc[range_column,range_row]

# TO DO 

# extract all the unique ingredients and give them an id to link them with the recepie 
# extract all the recepies and give them an id 
# 



