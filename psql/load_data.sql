

\COPY "User_Role" FROM './db_data_csv/User_Role.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY "User" FROM './db_data_csv/User.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY "Recipe" FROM './db_data_csv/Recipe.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY "Ingredient" FROM './db_data_csv/Ingredient.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY "Recipe_Ingredient" FROM './db_data_csv/Recipe_Ingredient.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
-- \COPY "User_Favourite_Recipe" FROM './db_data_csv/User_Favourite_Recipe.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
