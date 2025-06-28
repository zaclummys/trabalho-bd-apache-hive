-- 6. Quais os IDs de segmentos que possuíam o maior índice criminal (soma de ocorrências de todos os tipos de crimes), durante o mês de Novembro de 2010?
SELECT (SUM(crime.total_feminicide) + SUM(crime.total_homicide) + SUM(crime.total_felony_murder) +
        SUM(crime.total_bodily_harm) + SUM(crime.total_theft_cellphone) + SUM(crime.total_armed_robbery_cellphone) +
        SUM(crime.total_theft_auto) + SUM(crime.total_armed_robbery_auto)) as total_crimes,
        segment.segment_id
FROM crime
         JOIN segment ON segment.segment_id = crime.segment_id
WHERE crime.time_id IN (SELECT time_id from time where year = 2010 and month = 11)
GROUP BY segment.segment_id
ORDER BY total_crimes DESC
LIMIT 10;