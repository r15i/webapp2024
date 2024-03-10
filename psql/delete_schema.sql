-- Disabilita temporaneamente i controlli delle chiavi esterne
SET session_replication_role = 'replica';

-- Droppa tutte le tabelle in ordine inverso di dipendenza delle chiavi esterne
DROP TABLE IF EXISTS "User_Favourite_Recipe";
DROP TABLE IF EXISTS "Recipe_Ingredient";
DROP TABLE IF EXISTS "Ingredient";
DROP TABLE IF EXISTS "Recipe";
DROP TABLE IF EXISTS "User";
DROP TABLE IF EXISTS "User_Role";

-- Riabilita i controlli delle chiavi esterne
SET session_replication_role = 'origin';

