-- Source sheet: EHR Counts
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

WITH base AS (
SELECT DISTINCT Connect_ID
FROM `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants`
WHERE d_821247024 = '197316935'
AND d_747006172 = '104430631'
AND d_773707518 = '104430631'
),
counts AS (
SELECT 'ehr_healthpartners' AS ehr_source,
COUNT(DISTINCT b.Connect_ID) AS distinct_count
FROM base b
JOIN `nih-nci-dceg-connect-prod-6d04.ehr_healthpartners.person` p
ON CAST(p.person_id AS NUMERIC) = CAST(b.Connect_ID AS NUMERIC)

UNION ALL
SELECT 'ehr_henry_ford',
COUNT(DISTINCT b.Connect_ID)
FROM base b
JOIN `nih-nci-dceg-connect-prod-6d04.ehr_henry_ford.person` p
ON CAST(p.person_id AS NUMERIC) = CAST(b.Connect_ID AS NUMERIC)

UNION ALL
SELECT 'ehr_kp_colorado',
COUNT(DISTINCT b.Connect_ID)
FROM base b
JOIN `nih-nci-dceg-connect-prod-6d04.ehr_kp_colorado.person` p
ON CAST(p.person_id AS NUMERIC) = CAST(b.Connect_ID AS NUMERIC)

UNION ALL
SELECT 'ehr_kp_georgia',
COUNT(DISTINCT b.Connect_ID)
FROM base b
JOIN `nih-nci-dceg-connect-prod-6d04.ehr_kp_georgia.person` p
ON CAST(p.person_id AS NUMERIC) = CAST(b.Connect_ID AS NUMERIC)

UNION ALL
SELECT 'ehr_kp_hawaii',
COUNT(DISTINCT b.Connect_ID)
FROM base b
JOIN `nih-nci-dceg-connect-prod-6d04.ehr_kp_hawaii.person` p
ON CAST(p.person_id AS NUMERIC) = CAST(b.Connect_ID AS NUMERIC)

UNION ALL
SELECT 'ehr_kp_northwest',
COUNT(DISTINCT b.Connect_ID)
FROM base b
JOIN `nih-nci-dceg-connect-prod-6d04.ehr_kp_northwest.person` p
ON CAST(p.person_id AS NUMERIC) = CAST(b.Connect_ID AS NUMERIC)

UNION ALL
SELECT 'ehr_marshfield',
COUNT(DISTINCT b.Connect_ID)
FROM base b
JOIN `nih-nci-dceg-connect-prod-6d04.ehr_marshfield.person` p
ON CAST(p.person_id AS NUMERIC) = CAST(b.Connect_ID AS NUMERIC)

UNION ALL
SELECT 'ehr_sanford',
COUNT(DISTINCT b.Connect_ID)
FROM base b
JOIN `nih-nci-dceg-connect-prod-6d04.ehr_sanford.person` p
ON CAST(p.person_id AS NUMERIC) = CAST(b.Connect_ID AS NUMERIC)

UNION ALL
SELECT 'ehr_uchicago',
COUNT(DISTINCT b.Connect_ID)
FROM base b
JOIN `nih-nci-dceg-connect-prod-6d04.ehr_uchicago.person` p
ON CAST(p.person_id AS NUMERIC) = CAST(b.Connect_ID AS NUMERIC)
)

SELECT *
FROM counts
ORDER BY ehr_source;
