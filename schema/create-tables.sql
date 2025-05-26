CREATE TABLE crime (
  segment_id STRING,
  time_id STRING,
  crime_type STRING,
  count INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;

CREATE TABLE segment (
  segment_id STRING,
  start_vertex STRING,
  end_vertex STRING,
  one_way BOOLEAN,
  length FLOAT
);

CREATE TABLE vertice (
  vertex_id STRING,
  district_id STRING,
  neighborhood_id STRING,
  zone STRING
);

CREATE TABLE district (
  district_id STRING,
  name STRING,
  geometry STRING
);

CREATE TABLE neighborhood (
  neighborhood_id STRING,
  name STRING,
  geometry STRING
);

CREATE TABLE time (
  time_id STRING,
  `date` DATE,
  year INT,
  month INT,
  day_of_week STRING,
  weekend BOOLEAN
);
