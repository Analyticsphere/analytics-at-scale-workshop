-- Source sheet: M1_M2_Sex
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

SELECT
CASE
WHEN m1v1.d_407056417 = '536341288' OR m1v2.d_407056417 = '536341288' THEN 'Female'
WHEN m1v1.d_407056417 = '654207589' OR m1v2.d_407056417 = '654207589' THEN 'Male'
WHEN m1v1.d_407056417 IN ('576796184','830573274') OR m1v2.d_407056417 IN ('576796184','830573274') THEN 'Intersex/Other'
WHEN m1v1.d_407056417 IS NULL OR m1v2.d_407056417 IS NULL THEN 'N/A'
END AS Sex_Reported,
COALESCE(m1v2.Connect_ID, m1v1.Connect_ID) AS Connect_ID,
COALESCE(m1v2.D_407056417, m1v1.D_407056417) AS sr_sex
FROM
`nih-nci-dceg-connect-prod-6d04.FlatConnect.module1_v2_JP` m1v2
FULL OUTER JOIN
`nih-nci-dceg-connect-prod-6d04.FlatConnect.module1_v1_JP` m1v1
ON
m1v1.Connect_ID = m1v2.Connect_ID
WHERE
COALESCE(m1v2.Connect_ID, m1v1.Connect_ID) IN (
