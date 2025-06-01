SELECT crime.segment_id, crime.crime_type, SUM(crime.occurrences) AS total_ocorrencias
FROM crime
INNER JOIN time ON crime.time_id = time.time_id
WHERE time.year = 2017
  AND crime.crime_type IN ('Roubo de Celular', 'Roubo de Carro')
GROUP BY crime.segment_id, crime.crime_type;
