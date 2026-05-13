-- Source sheet: Survey Completion by Age
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

SELECT
IFNULL(age_group, 'Total') AS age_group,
COUNTIF(completion = 'Completed Survey and Sample(s)') AS completed_survey_and_samples,
COUNTIF(completion = 'Completed Survey, No Sample(s)') AS completed_survey_no_samples,
COUNTIF(completion = 'Completed Sample(s), No Survey') AS completed_samples_no_survey,
COUNTIF(completion = 'Completed Neither') AS completed_neither,
COUNT(Connect_ID) AS total
FROM (
SELECT
Connect_ID,
CASE
WHEN EXTRACT(YEAR FROM TIMESTAMP(d_914594314)) = 2022 THEN '2022'
WHEN EXTRACT(YEAR FROM TIMESTAMP(d_914594314)) = 2023 THEN '2023'
WHEN EXTRACT(YEAR FROM TIMESTAMP(d_914594314)) = 2024 THEN '2024'
WHEN EXTRACT(YEAR FROM TIMESTAMP(d_914594314)) = 2025 AND EXTRACT(MONTH FROM TIMESTAMP(d_914594314)) BETWEEN 1 AND 3 THEN 'January - March 2025'
WHEN EXTRACT(YEAR FROM TIMESTAMP(d_914594314)) = 2025 AND EXTRACT(MONTH FROM TIMESTAMP(d_914594314)) BETWEEN 4 AND 7 THEN 'April - July 2025'
ELSE 'Other'
END AS time_category,
CASE
WHEN d_100767870 = "353358909" AND
(d_878865966 = "353358909" OR d_684635302 = "353358909" OR d_167958071 = "353358909")
THEN "Completed Survey and Sample(s)"
WHEN d_100767870 = "353358909"
THEN "Completed Survey, No Sample(s)"
WHEN d_878865966 = "353358909" OR d_684635302 = "353358909" OR d_167958071 = "353358909"
THEN "Completed Sample(s), No Survey"
ELSE "Completed Neither"
END AS completion,

CASE
WHEN state_d_934298480 = '713781738' THEN '30-34'
WHEN state_d_934298480 = '631272782' THEN '35-39'
WHEN state_d_934298480 = '124276120' THEN '40-45'
WHEN state_d_934298480 = '450985724' THEN '46-50'
WHEN state_d_934298480 = '363147933' THEN '51-55'
WHEN state_d_934298480 = '636706443' THEN '56-60'
WHEN state_d_934298480 = '771230670' THEN '61-65'
WHEN state_d_934298480 = '722846087' THEN '66-70'
ELSE 'Unknown'
END AS age_group

FROM `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants_JP`
WHERE
d_827220437 = '809703864' -- UChicago
AND d_821247024 = '197316935' -- Verified
AND EXTRACT(YEAR FROM TIMESTAMP(d_914594314)) = 2025
AND EXTRACT(MONTH FROM TIMESTAMP(d_914594314)) BETWEEN 4 AND 7
)

GROUP BY ROLLUP(age_group)
ORDER BY
CASE
WHEN age_group IS NULL THEN 999 -- Total row goes last
WHEN age_group = 'Unknown' THEN 998
ELSE CAST(SUBSTR(age_group, 1, 2) AS INT64)
END;
