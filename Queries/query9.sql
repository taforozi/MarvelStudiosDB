SELECT description AS 'Event Description' 
FROM events
WHERE type = 'death'
UNION
SELECT description AS 'Event Description' 
FROM events
WHERE type = 'battle';