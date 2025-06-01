SELECT crime.crime_type, SUM(crime.occurrences) AS total_crimes
FROM crime
INNER JOIN time ON crime.time_id = time.time_id
INNER JOIN segment ON crime.segment_id = segment.segment_id
WHERE segment.one_way = TRUE
  AND time.year = 2012
GROUP BY crime.crime_type;
