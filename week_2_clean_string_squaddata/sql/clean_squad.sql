/* task two */

-- show rows do not have title inside context
SELECT 
  title,
  context,
  INSTR(context, title)
FROM staging.squad
WHERE NOT regexp_matches(context, title); -- two arguments are string and substring

/* task three */

-- show rows if context starting with title

-- use LIKE operator with wildcard%
SELECT * FROM staging.squad
WHERE context LIKE CONCAT(title,'%'); 
-- check results, the results not okey, because wildcard _

-- regular expression functions will make underscore be a literal character
SELECT * FROM staging.squad
WHERE regexp_matches(context, CONCAT('^', title));

/* task four */

-- show a new column, frist answer from AI model

SELECT
  answers[18:], -- slicing
  answers[19], -- indexing
  CASE
    WHEN answers[19] = ' ' THEN NULL
    ELSE answers[18:]
  END AS striped_answer,
  INSTR(striped_answer, '''') AS first_quotiation_index, 
  -- singel quation ''' needs to be '''' to work
  striped_answer[:first_quotiation_index-1] AS first_answer,
--  striped_answer[:6],
  answers
FROM staging.squad;

/* task five */

-- generate same resualt as four, with patern matching

SELECT 
  -- don't allow singel ' 
  regexp_extract(answers, '''([^'']+)'',') AS first_answer,
  -- allow upper and lower case, digit, space, comma
  regexp_extract(answers, '''([A-Za-z0-9 ,]+)'',') AS first_answer_1,
  -- use the grouping argument in regexp_extract 
  regexp_extract(answers, '''([A-Za-z0-9 ,]+)'',',1) AS first_answer_2,
  answers
FROM staging.squad;
