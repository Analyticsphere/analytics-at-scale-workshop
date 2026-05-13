-- Source sheet: EHR Age Counts
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

WITH combined AS (
SELECT
'ehr_healthpartners' AS source,
year_of_birth,
month_of_birth,
day_of_birth,
birth_datetime
FROM `nih-nci-dceg-connect-prod-6d04.ehr_healthpartners.person`

UNION ALL
SELECT
'ehr_henry_ford' AS source,
year_of_birth,
month_of_birth,
day_of_birth,
birth_datetime
FROM `nih-nci-dceg-connect-prod-6d04.ehr_henry_ford.person`

UNION ALL
SELECT
'ehr_kp_colorado' AS source,
year_of_birth,
month_of_birth,
day_of_birth,
birth_datetime
FROM `nih-nci-dceg-connect-prod-6d04.ehr_kp_colorado.person`

UNION ALL
SELECT
'ehr_kp_georgia' AS source,
year_of_birth,
month_of_birth,
day_of_birth,
birth_datetime
FROM `nih-nci-dceg-connect-prod-6d04.ehr_kp_georgia.person`

UNION ALL
SELECT
'ehr_kp_hawaii' AS source,
year_of_birth,
month_of_birth,
day_of_birth,
birth_datetime
FROM `nih-nci-dceg-connect-prod-6d04.ehr_kp_hawaii.person`

UNION ALL
SELECT
'ehr_kp_northwest' AS source,
year_of_birth,
month_of_birth,
day_of_birth,
birth_datetime
FROM `nih-nci-dceg-connect-prod-6d04.ehr_kp_northwest.person`

UNION ALL
SELECT
'ehr_marshfield' AS source,
year_of_birth,
month_of_birth,
day_of_birth,
birth_datetime
FROM `nih-nci-dceg-connect-prod-6d04.ehr_marshfield.person`

UNION ALL
SELECT
'ehr_uchicago' AS source,
year_of_birth,
month_of_birth,
day_of_birth,
birth_datetime
FROM `nih-nci-dceg-connect-prod-6d04.ehr_uchicago.person`
),

with_age AS (
SELECT
source,
year_of_birth,
month_of_birth,
day_of_birth,
birth_datetime,
SAFE.PARSE_DATE(
'%Y-%m-%d',
FORMAT('%04d-%02d-%02d', year_of_birth, COALESCE(month_of_birth, 1), COALESCE(day_of_birth, 1))
) AS DOB,
DATE_DIFF(
CURRENT_DATE(),
SAFE.PARSE_DATE(
'%Y-%m-%d',
FORMAT('%04d-%02d-%02d', year_of_birth, COALESCE(month_of_birth, 1), COALESCE(day_of_birth, 1))
),
YEAR
) AS age,
CASE
WHEN DATE_DIFF(CURRENT_DATE(), SAFE.PARSE_DATE('%Y-%m-%d', FORMAT('%04d-%02d-%02d', year_of_birth, COALESCE(month_of_birth, 1), COALESCE(day_of_birth, 1))), YEAR) < 30 THEN '<30'
WHEN DATE_DIFF(CURRENT_DATE(), SAFE.PARSE_DATE('%Y-%m-%d', FORMAT('%04d-%02d-%02d', year_of_birth, COALESCE(month_of_birth, 1), COALESCE(day_of_birth, 1))), YEAR) BETWEEN 30 AND 39 THEN '30-39'
WHEN DATE_DIFF(CURRENT_DATE(), SAFE.PARSE_DATE('%Y-%m-%d', FORMAT('%04d-%02d-%02d', year_of_birth, COALESCE(month_of_birth, 1), COALESCE(day_of_birth, 1))), YEAR) BETWEEN 40 AND 49 THEN '40-49'
WHEN DATE_DIFF(CURRENT_DATE(), SAFE.PARSE_DATE('%Y-%m-%d', FORMAT('%04d-%02d-%02d', year_of_birth, COALESCE(month_of_birth, 1), COALESCE(day_of_birth, 1))), YEAR) BETWEEN 50 AND 59 THEN '50-59'
WHEN DATE_DIFF(CURRENT_DATE(), SAFE.PARSE_DATE('%Y-%m-%d', FORMAT('%04d-%02d-%02d', year_of_birth, COALESCE(month_of_birth, 1), COALESCE(day_of_birth, 1))), YEAR) BETWEEN 60 AND 69 THEN '60-69'
WHEN DATE_DIFF(CURRENT_DATE(), SAFE.PARSE_DATE('%Y-%m-%d', FORMAT('%04d-%02d-%02d', year_of_birth, COALESCE(month_of_birth, 1), COALESCE(day_of_birth, 1))), YEAR) BETWEEN 70 AND 79 THEN '70-79'
WHEN DATE_DIFF(CURRENT_DATE(), SAFE.PARSE_DATE('%Y-%m-%d', FORMAT('%04d-%02d-%02d', year_of_birth, COALESCE(month_of_birth, 1), COALESCE(day_of_birth, 1))), YEAR) >= 80 THEN '80+'
ELSE NULL
END AS age_group
FROM combined
)

-- 1️⃣ Count by source and age_group
, counts_by_source AS (
SELECT
source,
age_group,
COUNT(*) AS person_count
FROM with_age
WHERE age_group IS NOT NULL
GROUP BY source, age_group
)

-- 2️⃣ Count by age_group overall
, counts_overall AS (
SELECT
age_group,
COUNT(*) AS total_persons
FROM with_age
WHERE age_group IS NOT NULL
GROUP BY age_group
)

-- Final output: combine both summaries
SELECT
'By Source' AS summary_type,
source,
age_group,
person_count AS count
FROM counts_by_source

UNION ALL

SELECT
'Overall' AS summary_type,
NULL AS source,
age_group,
total_persons AS count
FROM counts_overall

ORDER BY summary_type, source, age_group;
