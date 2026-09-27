/*
============================================================
NETFLIX DATA ANALYSIS - FINAL SQL ANALYSIS
============================================================
Project: Netflix Data Analysis - Python, SQL, Power BI
Database: netflix_analysis
Table: netflix_cleaned

This file contains the FINAL 10 SQL analysis queries.
The Python stage cleaned/prepared the data, SQL extracts insights,
and the results can later support the Power BI dashboard.

All queries are commented so a beginner can understand them.
============================================================
*/

USE netflix_analysis;


/*============================================================
QUERY 1 - MOVIES VS TV SHOWS
Question: How many Movies and TV Shows are in the dataset?

COUNT(*) counts rows.
GROUP BY type creates one result for each content type.

Result:
Movie   = 6131
TV Show = 2676
============================================================*/

SELECT
    type,
    COUNT(*) AS total_titles
FROM netflix_cleaned
GROUP BY type;


/*============================================================
QUERY 2 - TOP 10 YEARS BY TITLES ADDED
Question: Which years had the most titles added to Netflix?

WHERE removes missing years.
GROUP BY groups titles by year.
ORDER BY DESC ranks from highest to lowest.
LIMIT 10 keeps only the top 10.

Result:
2019 1999 | 2020 1878 | 2018 1625 | 2021 1498 | 2017 1164
2016 418 | 2015 73 | 2014 23 | 2011 13 | 2013 10
============================================================*/

SELECT
    year_added,
    COUNT(*) AS total_titles
FROM netflix_cleaned
WHERE year_added IS NOT NULL
GROUP BY year_added
ORDER BY total_titles DESC
LIMIT 10;


/*============================================================
QUERY 3 - TOP 10 COUNTRIES
Question: Which countries have the most titles?

IS NOT NULL removes missing country values.
<> means "not equal to", so Unknown is excluded.

Result:
United States 2818
India 972
United Kingdom 419
Japan 245
South Korea 199
Canada 181
Spain 145
France 124
Mexico 110
Egypt 106
============================================================*/

SELECT
    country,
    COUNT(*) AS total_titles
FROM netflix_cleaned
WHERE country IS NOT NULL
  AND country <> 'Unknown'
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;


/*============================================================
QUERY 4 - CONTENT RATINGS
Question: What are the most common ratings?

Missing and Unknown ratings are excluded.

Result:
TV-MA 3207 | TV-14 2160 | TV-PG 863 | R 799 | PG-13 490
TV-Y7 334 | TV-Y 307 | PG 287 | TV-G 220 | NR 80
G 41 | TV-Y7-FV 6 | NC-17 3 | UR 3
============================================================*/

SELECT
    rating,
    COUNT(*) AS total_titles
FROM netflix_cleaned
WHERE rating IS NOT NULL
  AND rating <> 'Unknown'
GROUP BY rating
ORDER BY total_titles DESC;


/*============================================================
QUERY 5 - RATING BY CONTENT TYPE
Question: How are ratings distributed between Movies and TV Shows?

Grouping by BOTH rating and type lets us compare the two content types.
============================================================*/

SELECT
    rating,
    type,
    COUNT(*) AS total_titles
FROM netflix_cleaned
GROUP BY rating, type
ORDER BY rating, type;


/*============================================================
QUERY 6 - TOP 10 GENRE/CATEGORY COMBINATIONS
Question: Which categories contain the most titles?

The dataset stores these values in listed_in.
"AS genre" gives the result a simpler name.

Result:
Dramas, International Movies 362
Documentaries 359
Stand-Up Comedy 334
Comedies, Dramas, International Movies 274
Dramas, Independent Movies, International Movies 252
Kids' TV 220
Children & Family Movies 215
Children & Family Movies, Comedies 201
Documentaries, International Movies 186
Dramas, International Movies, Romantic Movies 180
============================================================*/

SELECT
    listed_in AS genre,
    COUNT(*) AS total_titles
FROM netflix_cleaned
WHERE listed_in IS NOT NULL
  AND listed_in <> 'Unknown'
GROUP BY listed_in
ORDER BY total_titles DESC
LIMIT 10;


/*============================================================
QUERY 7 - TOP 10 LONGEST MOVIES
Question: What are the 10 longest Movies?

duration_value contains the numeric duration.
duration_unit identifies minutes.
============================================================*/

SELECT
    title,
    duration_value AS duration_minutes
FROM netflix_cleaned
WHERE type = 'Movie'
  AND duration_unit = 'min'
  AND duration_value IS NOT NULL
ORDER BY duration_value DESC
LIMIT 10;


/*============================================================
QUERY 8 - TITLES WITH THE LARGEST CAST
Question: Which titles have the most listed cast members?

How cast_count works:
LENGTH(cast) = length of the original text.
REPLACE(cast, ',', '') removes commas.
The difference gives the number of commas.
Adding 1 gives the number of names.

Example:
Actor A, Actor B, Actor C
2 commas + 1 = 3 cast members.

The query ranks the 10 largest cast counts.
============================================================*/

SELECT
    title,
    type,
    cast,
    (LENGTH(cast) - LENGTH(REPLACE(cast, ',', '')) + 1) AS cast_count
FROM netflix_cleaned
WHERE cast IS NOT NULL
  AND cast <> 'Unknown'
ORDER BY cast_count DESC
LIMIT 10;


/*============================================================
QUERY 9 - TOP 10 DIRECTORS
Question: Which directors have the most titles?

GROUP BY director creates one group per director.
COUNT(*) counts titles for each director.
============================================================*/

SELECT
    director,
    COUNT(*) AS total_titles
FROM netflix_cleaned
WHERE director IS NOT NULL
  AND director <> 'Unknown'
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;


/*============================================================
QUERY 10 - LARGEST RELEASE-TO-NETFLIX GAP
Question: Which titles were added to Netflix many years after release?

years_to_add = year_added - release_year

For example:
2017 - 1942 = 75 years.

Only valid year values are used, and negative gaps are excluded.
============================================================*/

SELECT
    title,
    type,
    release_year,
    year_added,
    (year_added - release_year) AS years_to_add
FROM netflix_cleaned
WHERE release_year IS NOT NULL
  AND year_added IS NOT NULL
  AND year_added >= release_year
ORDER BY years_to_add DESC
LIMIT 10;


/*============================================================
PROJECT SUMMARY
============================================================

1. Movies vs TV Shows
2. Top years by titles added
3. Top countries
4. Content rating distribution
5. Rating distribution by type
6. Top genre/category combinations
7. Longest movies
8. Largest cast counts
9. Top directors
10. Largest release-to-Netflix year gaps

SQL concepts demonstrated:
SELECT, COUNT(), AS, WHERE, IS NOT NULL, GROUP BY,
ORDER BY, DESC, LIMIT, <>, LENGTH(), REPLACE(),
and arithmetic calculations.

This SQL stage connects the cleaned Python dataset to the
analysis that can be visualized in Power BI.

============================================================
END OF FILE
============================================================
