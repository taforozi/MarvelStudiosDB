# Suppose a Marvel fan wants to see all the events and specifically their descriptions, 
# in which either death or battle has occurred

SELECT description AS 'Event Description' 
FROM events
WHERE type = 'death'
UNION
SELECT description AS 'Event Description' 
FROM events
WHERE type = 'battle';
