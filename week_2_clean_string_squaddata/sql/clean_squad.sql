/* task two */

-- show rows do not have title inside context
SELECT 
  title,
  context,
  INSTR(context, title)
FROM staging.squad
WHERE NOT regexp_matches(context, title); -- two arguments are string and substring

/* task three*/

-- show rows if context starting with title

