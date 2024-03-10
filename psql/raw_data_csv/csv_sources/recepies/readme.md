# Usage license
Creative Commons Attribution 4.0 International Public License

# File contents
```
dataset
├─ foods									folder containing files of food dataset (starting data from giallozafferano.it)
│  ├─ CSV									folder containing files in .csv format
│  │  ├─ categories.csv			
│  │  ├─ foodDataset.xlsx					each of other .csv files derived from sheet of this excel file
│  │  ├─ ingredients.csv			
│  │  ├─ ingredientsClasses.csv		
│  │  ├─ ingredientsMetaclasses.csv	
│  │  ├─ preparations.csv			
│  │  └─ recipes.csv			
│  └─ TXT									folder containing files in .txt format
│     ├─ scorpored values					folder containing values in textData scorpored by type of data
│     │  ├─ category-cost-difficulty.txt
│     │  ├─ ingredients.txt
│     │  ├─ names.txt
│     │  ├─ preparations.txt
│     │  └─ preparationTime.txt
│     └─ textData.txt						.txt version of dataset/foods/CSV/foodDataset.xlsx file
└─ survey_answers				            folder containing results of the surveys on food preferences of the dataset
│  └─ sorts					                folder containing results of the three surveys' questions where users sort foods
│  │  |_ sort1.csv				            the three csv files contain the survey id, and then the food ordered by the user
│  │  ├─ sort2.csv
│  │  └─ sort3.csv
│  └─ answers.csv				            results of the surveys
│  └─ labels.txt				            labels of the samples in samples.txt 
│  └─ samples.txt				            couples of food in pairwise comparison form * extracted from the sorts
└─ readme.md				
```

\* Each sample has the form <IDfood1, IDfood2> and has label 1 if IDfood1 is preferred over IDfood2, -1 if IDfood2 is preferred over IDfood1, 0 if there is indifference relationship over IDfood1 and IDfood2
  The preference sorts have been translated in two phases:
	1- search of inconsistencies among the three sorts in order to get the "certain" preference relationships
	2- search of transitivity of preferences among the "certain" couples, giving indifference relationship to those for which no transitivity has been found.
More details about these two phases and a pseudo-code can be found in the article attached with this dataset

# Recipes dataset description 
the description refer to *dataset/foods/CSV/foodDataset.xlsx*

| Feature name | Description | 
|------|------------|
| Name | italian name of the recipe | 
| ID  | ID associated to the recipe |
| Link | link of where the food data has been get |
| Category Name | name of the category (Starter, Complete Meal, First Course, Second Course, Savoury Cake) |
| Category ID | ID associated to the category |
| Cost | cost indicator of the food, discrete interval from 1 to 5 |
| Difficulty | difficuly indicator of the food, discrete interval from 1 to 4 | 
| Preparation Time | integer positive number that indicates preparation time of the food expressed in minutes |
| Ingredient | english name of an ingredient of the recipe |
| Ingredient ID | ID associated to the ingredient |
| Weight | weight that the ingredient has in the composition of the interested recipe |
| ... |  the columns of ingredients repeats for 18 times, leaving empty spaces when the recipe has no ingredients other than  |
| Preparation | english name of a preparation performed on the recipe |
| Preparation ID | ID associated to the preparation |
| Weight | weight that the preparation has in the composition of the interested recipe |
| ... |  the columns of preparations repeats for 18 times, leaving empty spaces when the recipe has no preparations other than  |

in other sheet of the file are reportet all the ingredients, divided in classes and metaclasses, preparations and categories

**NOTE**: in *dataset/foods/TXT/textData.txt* ingredients and preparation has been vectorized as follow:
- each element of the ingredient vector represent the weight of the ingredient class in the recipe. The weight of an ingredient class in a recipe is collected by sum up the weight of the ingredients owned by that particular ingredient class in the recipe.
- each element of the preparation vector represent the weight of the preparation in the recipe.

# Preferences dataset description 
In the file *dataset/survey_answer/samples.txt* are reported 54 user's orderings in the form of *pairwise comparison*. Thus for each row correspond the ordering of a user. The ordering is written in the form of pairwise comparison, so each element of the ordering are paired with all others (avoiding simmetries). 
For instance, given the recipes as their ID:
```
1; 2; 3
```
becomes:
```
1,2; 1,3; 2,3
```
The file is written following the *.csv* format.
In the file *dataset/survey_answer/lables.txt* are written the correspongin labels of the couples.
The label has value 1 if the first element of the couple is preferred over the second, -1 if the second element is preferred over the first, 0 if there is uncertainity about which of the element is preferred.

# How to cite:
*D.Fossemò, F.Mignosi, L.Raggioli, M.Spezialetti, F.A.D'Asaro. Using Inductive Logic Programming to globally approximate Neural Networks for preference learning: challenges and preliminary results. BEWARE-22, co-located with AIxIA 2022, November 28-December 2, 2022, University of Udine, Udine, Italy.*