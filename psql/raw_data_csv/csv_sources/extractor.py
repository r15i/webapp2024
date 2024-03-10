import pandas as pd

# Read the CSV file into a DataFrame
df = pd.read_csv('./recipes.csv', sep=';')

col = df.columns 

r_col = range(0,8)
i_col = range(9,62)
p_col = range(63,77)

#df.iloc[range_column,range_row]

# TO DO 

# reduce recepie and format it to have only the id and other stuff
# extract the list of ingredients for each and make the Recepie ingredient tab 
# reformat ingredients and try to preserve the food categories 
# need to plot and figure how is done 
# there are some errors like herbs and spices uses comma so sometimes it sucks





