SET hivevar:group=bda_1;

SELECT avg(runtimeminutes) AS avg_duration
FROM dsti_2022_spring_${group}.imdb_title_basics
WHERE originaltitle RLIKE '(^| )[Ww]orld';
