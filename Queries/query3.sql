SELECT events.type AS 'Type of event' , events.description AS 'Description of event'
FROM movies JOIN events ON movies.movieName = events.movieName
WHERE movies.sequenceOfEvents <= 20;
