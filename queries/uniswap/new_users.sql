-- Find new Uniswap V2 users per day (first-time swap users)
WITH first_swaps AS (
  SELECT
    sender,
    MIN(block_time::date) AS first_day
  FROM uniswap_v2."pair_evt_Swap"
  GROUP BY sender
)
SELECT
  first_day AS date,
  COUNT(*) AS new_users
FROM first_swaps
WHERE first_day >= now() - interval '14 day'
GROUP BY 1
ORDER BY 1 DESC;
