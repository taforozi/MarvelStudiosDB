SELECT movieName AS Movie, duration
FROM movies
WHERE duration IN
(SELECT MAX(duration) FROM movies);

# or
# SELECT DISTINCT movieName AS Movie, duration
# FROM movies
# ORDER BY duration DESC
# LIMIT 1;


