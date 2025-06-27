-- Uniswap V2 Daily Trading Volume & Active Users (Last 30 Days)
SELECT
  block_time::date AS date,
  COUNT(DISTINCT sender) AS active_users,
  SUM(amount0In + amount1In + amount0Out + amount1Out) AS total_volume
FROM uniswap_v2."pair_evt_Swap"
WHERE block_time >= now() - interval '30 day'
GROUP BY 1
ORDER BY 1 DESC;
