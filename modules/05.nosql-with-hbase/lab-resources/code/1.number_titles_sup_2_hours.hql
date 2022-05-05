SET hivevar:group=bda_1;

SELECT count(*) AS nb
FROM dsti_2022_spring_${group}.imdb_title_basics
WHERE runtimeminutes > 120;
