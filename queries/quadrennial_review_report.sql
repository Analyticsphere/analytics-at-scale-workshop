-- Quadrennial Review Report
-- Request (via Email from Amelia to: Autumn Hullings, Nicole Gerlanc, Michelle Brotzman
-- Re: Quadrennial Review Data Request
-- Connect is required to complete a Quadrennial Review every 4 years for the project and we are preparing for the first submission. This is separate from the annual CIER data submission that Kelsey helps us provide the data for. For the Quadrennial Review, we are being asked to provide just a couple of data points. 
-- Date of first verified participant in Connect – we opened enrollment on 07/21/2021, so should be somewhere around that date but need the exact date.
-- Date we reached n=50,000 verified participants exactly – based on the weekly logs, this should be sometime near the week of 10/21/2024 but need the exact date.
-- For this data pull, I do not think it is necessary to exclude anyone who has withdrawn or requested data destruction. Let me know if you have any questions. Thank you!



-- START QUERY: Date of first verified participant and date verified participant count reached 50,000

WITH verified_participants AS (
  SELECT
    Connect_ID,
    SAFE_CAST(d_914594314 AS TIMESTAMP) AS verification_ts,
    DATE(SAFE_CAST(d_914594314 AS TIMESTAMP)) AS verification_date
  FROM `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants`
  WHERE Connect_ID IS NOT NULL
    AND d_821247024 = '197316935'
    AND d_914594314 IS NOT NULL
),

ranked_verified AS (
  SELECT
    Connect_ID,
    verification_ts,
    verification_date,
    ROW_NUMBER() OVER (
      ORDER BY verification_ts, Connect_ID
    ) AS verified_participant_number
  FROM verified_participants
)

SELECT
  'First verified participant' AS metric,
  Connect_ID,
  verification_ts,
  verification_date,
  verified_participant_number
FROM ranked_verified
WHERE verified_participant_number = 1

UNION ALL

SELECT
  '50,000th verified participant' AS metric,
  Connect_ID,
  verification_ts,
  verification_date,
  verified_participant_number
FROM ranked_verified
WHERE verified_participant_number = 50000

ORDER BY verified_participant_number;
