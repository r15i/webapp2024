import pandas as pd
import numpy as np
import os 
pd.options.mode.chained_assignment = None  # default='warn'
path = "./db_form_csv/"

# deleting previus verion 
os.system(f"rm -rf {path}")
os.system(f"mkdir {path}")


# takes in input a dataframe rec , keep only the columns with the same name as in the name 


"""
User.csv
id,email,password,name,surname,role_id,registration_date
"""

"""
User_Role.csv
id,description
"""

"""
User_Favourite_Recipe.csv
recipe_id,ingredient_id
"""



"""
Ingredient.csv
id,name
"""
form_ing = ["id","name"]
df = pd.read_csv("./csv_data/ingredients.csv", sep=";")
df.columns = df.columns.str.lower()
df.rename(columns={'ingredient': 'name'}, inplace=True)

ing = df[form_ing]


ing.to_csv(path + "Ingredient.csv", index=False)


"""
Recipe.csv
id,name,description,time_minutes,difficulty,image_url,user_id,approved
"""

# Recipe.csv db structur 
form_rec = [
    "id",
    "name",
    "description",
    "time_minutes",
    "difficulty",
    "ddimage_url",
    "user_id",
    "approved",
]


# Read the CSV file into a DataFrame
df = pd.read_csv("./csv_data/recipes.csv", sep=";")
df.columns = df.columns.str.lower()
# cleaning from non existent stuff 
df = df[:np.where(pd.isna(df["id"]))[0][0]]

#columns in the recepie 
r_col = list(range(0, 8))
#colums with the ingredient associated to the recepie 
i_col = list(range(8, 62))
# there a re also some columns on preparation 

# getting only the columns of recepie it's ingredients
rec = df.iloc[:, r_col]



# renaming the ingredient to name 
rec.rename(columns={'ingredient': 'name'}, inplace=True)
# preparation time  to time_minutes
rec.rename(columns={'preparation time': 'time_minutes'}, inplace=True)
# link to ddimage_url
rec.rename(columns={'link': 'ddimage_url'}, inplace=True)

# chainging the type 
rec["id"] = rec["id"].astype(int)
rec["time_minutes"] = rec["time_minutes"].astype(int)
rec["difficulty"] = rec["difficulty"].astype(int)

# change the value to a strin
rec['difficulty'] = rec['difficulty'].map({1: 'easy', 2: 'medium', 3: 'hard', 4: 'hard'})

# adding missing columns  if is not present
for i in form_rec:
    if not (i in rec.columns):
        rec.loc[:, i] = pd.Series(dtype=str)
# keeping and reorganizing only the stuff form we want
rec = rec[form_rec]

# insert empty placholder in description 
rec['description'] = "<description of " + rec['id'].astype(str)+" " + rec['name'].astype(str)+">"
# insert in each entry the user_id 
# i assumed the user 1 entered all the initial recepies 
rec['user_id'] = 1
# insert as approved 
rec['approved'] = 1

# save recepie to  csv in good format without index of pandas
rec.to_csv(path + "Recipe.csv", index=False)


"""
Recipe_Ingredient.csv
recipe_id,ingredient_id
"""
"""
########################################
########################################
########################################
            inserisco una funzione 
########################################
########################################

# Define a function to process each row
def process_row(row):
    # Getting only the columns with the id 
    ing_id = row[row.index.str.startswith('ingredient') & row.index.str.contains('id')]
    
    # Drop NaN values only for the selected columns
    row = row.dropna(subset=ing_id.index)
    
    # Extracting the ingredients
    data = {key: [value] for key, value in row.items() if key in ing_id.index}
    
    return pd.DataFrame(data)

# Apply the function to each row and concatenate the results
empty_df = pd.concat(rec_ing.apply(process_row, axis=1).tolist(), ignore_index=True)

print(empty_df)




"""


# id of the recepie 
ids_rec = rec["id"]
# need to append for each recepie 
form_rec_ing = ["recipe_id","ingredient_id"]
rec_ing = df.iloc[:, i_col]




# for every row 
for i,r in enumerate(ids_rec):
    id_rec = ids_rec[i]
    #selecting the row 
    row = rec_ing.iloc[i,:]
    #dropping the nans value 
    row = row.dropna()
    # getting only the columns with the id 
    ing_id = row[row.index.str.startswith('ingredient')]
    ing_id = ing_id[ing_id.index.str.contains('id')]
    ing_id = ing_id.astype(int)
    ing_id = list(ing_id)

    # create an empty DataFrame 
    # Create an empty DataFrame for the ingredient


    # row to append
    data = {form_rec_ing[0]:[id_rec]*len(ing_id),form_rec_ing[1]: ing_id}
    
    

    tmp = pd.DataFrame(data)
    tmp  =  tmp.drop_duplicates()


    if(i ==0):
        tmp.to_csv(path + "Recipe_Ingredient.csv",mode = "a", index=False)
    else:
        tmp.to_csv(path + "Recipe_Ingredient.csv",mode = "a",header = False ,index=False)
    

print(f"the db are being saved into {path}")
