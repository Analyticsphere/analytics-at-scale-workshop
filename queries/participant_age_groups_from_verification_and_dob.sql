-- Source sheet: Age Groups from Participants
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

WITH typed AS (
SELECT
-- Verification date: ISO 8601 format (e.g., 2020-07-17T15:21:26.763Z)
DATE(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S%Ez', CAST(d_914594314 AS STRING))) AS verif_date,
-- DOB: yyyymmdd format (string or int)
SAFE.PARSE_DATE('%Y%m%d', CAST(d_371067537 AS STRING)) AS dob
FROM `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants`
WHERE d_821247024 = "197316935"
),
ages AS (
SELECT
DATE_DIFF(verif_date, dob, YEAR) AS age_years
FROM typed
WHERE verif_date IS NOT NULL AND dob IS NOT NULL
)
SELECT
CASE
WHEN age_years BETWEEN 30 AND 39 THEN '30-39'
WHEN age_years BETWEEN 40 AND 49 THEN '40-49'
WHEN age_years BETWEEN 50 AND 59 THEN '50-59'
WHEN age_years BETWEEN 60 AND 69 THEN '60-69'
WHEN age_years BETWEEN 70 AND 79 THEN '70-79'
ELSE 'Other'
END AS age_group,
COUNT(*) AS count
FROM ages
GROUP BY age_group
ORDER BY
CASE age_group
WHEN '30-39' THEN 1
WHEN '40-49' THEN 2
WHEN '50-59' THEN 3
WHEN '60-69' THEN 4
WHEN '70-79' THEN 5
ELSE 6
END;
