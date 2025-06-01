SELECT crime.segment_id, SUM(crime.occurrences) AS total_crimes
FROM crime
INNER JOIN time ON crime.time_id = time.time_id
WHERE time.year = 2018
  AND time.weekday IN ('Saturday', 'Sunday')
GROUP BY crime.segment_id
ORDER BY total_crimes DESC
LIMIT 10;
