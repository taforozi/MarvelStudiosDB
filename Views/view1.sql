SELECT movies_have_directors.movieName AS Movie, producers.name AS Producers, directors.name AS Directors
FROM producers JOIN movies_have_producers ON movies_have_producers.producerID = producers.producerID
    JOIN movies_have_directors ON movies_have_directors.movieName = movies_have_producers.movieName
    JOIN directors ON movies_have_directors.directorID = directors.directorID;
		
