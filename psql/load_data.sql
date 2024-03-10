\COPY "User_Role" FROM './raw_data_csv/User_Role.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY "Recipe" FROM './raw_data_csv/Recipe.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY "User" FROM './raw_data_csv/User.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY "Ingredient" FROM './raw_data_csv/Ingredient.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY "Recipe_Ingredient" FROM './raw_data_csv/Recipe_Ingredient.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY "User_Favourite_Recipe" FROM './raw_data_csv/User_Favourite_Recipe.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
