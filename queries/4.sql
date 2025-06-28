-- 4. Qual o total de crimes por tipo em vias de mão única da cidade durante o ano de 2012?
SELECT SUM(crime.total_feminicide)              as soma_total_feminicide,
      SUM(crime.total_homicide)                as soma_total_homicide,
      SUM(crime.total_felony_murder)           as soma_total_felony_murder,
      SUM(crime.total_bodily_harm)             as soma_total_bodily_harm,
      SUM(crime.total_theft_cellphone)         as soma_total_theft_cellphone,
      SUM(crime.total_armed_robbery_cellphone) as soma_total_armed_robbery_cellphone,
      SUM(crime.total_theft_auto)              as soma_total_theft_auto,
      SUM(crime.total_armed_robbery_auto)      as soma_total_armed_robbery_auto
FROM crime
          JOIN segment ON segment.id = crime.segment_id
WHERE segment.oneway = 'yes'
  and crime.time_id IN (SELECT id from `time` where year = 2012);