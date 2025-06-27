-- JSON Parsing Example for Dune
SELECT
  event_inputs.amount0In::numeric,
  event_inputs.to::text,
  event_inputs.token::text
FROM uniswap_v2."pair_evt_Swap"
WHERE block_time > now() - interval '1 day';
