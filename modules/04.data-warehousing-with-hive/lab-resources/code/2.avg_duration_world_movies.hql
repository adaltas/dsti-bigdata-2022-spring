SELECT avg(runtimeminutes) AS avg_duration
FROM dsti_2022_spring.imdb_title_basics
WHERE primarytitle RLIKE '(^| )[Ww]orld( |$)';
