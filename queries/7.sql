-- 7. Quais os IDs dos segmentos que possuíam o maior índice criminal (soma de ocorrências de todos os tipos de crimes) durante os finais de semana do ano de 2018?
SELECT (SUM(crime.total_feminicide) + SUM(crime.total_homicide) + SUM(crime.total_felony_murder) +
        SUM(crime.total_bodily_harm) + SUM(crime.total_theft_cellphone) + SUM(crime.total_armed_robbery_cellphone) +
        SUM(crime.total_theft_auto) + SUM(crime.total_armed_robbery_auto)) as total_crimes,
        segment.id
FROM crime
         JOIN segment ON segment.id = crime.segment_id
WHERE crime.time_id IN (SELECT id from time where year = 2018 and (weekday = 'saturday' or weekday = 'sunday'))
GROUP BY segment.id
ORDER BY total_crimes DESC
LIMIT 10