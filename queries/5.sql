-- 5. Qual o total de roubos de carro e celular em todos os segmentos durante o ano de 2017?
SELECT
    (SUM(crime.total_theft_cellphone) + SUM(crime.total_armed_robbery_cellphone) )         as soma_total_cellphone,
    (SUM(crime.total_theft_auto) + SUM(crime.total_armed_robbery_auto) )            as soma_total_theft_auto
FROM crime
          JOIN segment ON segment.segment_id = crime.segment_id
WHERE crime.time_id IN (SELECT time_id from `time` where year = 2017);