-- Source sheet: Duplicate Tokens
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

SELECT token,
state_studyId,
CASE d_827220437
WHEN '125001209' THEN 'Kaiser Permanente Colorado'
WHEN '181769837' THEN 'Other'
WHEN '300267574' THEN 'Kaiser Permanente Hawaii'
WHEN '303349821' THEN 'Marshfield Clinic Health System'
WHEN '327912200' THEN 'Kaiser Permanente Georgia'
WHEN '452412599' THEN 'Kaiser Permanente Northwest'
WHEN '517700004' THEN 'National Cancer Institute'
WHEN '531629870' THEN 'HealthPartners'
WHEN '548392715' THEN 'Henry Ford Health System'
WHEN '657167265' THEN 'Sanford Health'
WHEN '809703864' THEN 'University of Chicago Medicine'
ELSE NULL
END AS Site,
COUNT(*) AS dup_count
FROM `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants`
GROUP BY token, state_studyId, Site
HAVING dup_count > 1

SELECT
d_827220437,
Connect_ID,
ARRAY_AGG(DISTINCT token) AS tokens,
COUNT(DISTINCT token) AS num_tokens
FROM
`nih-nci-dceg-connect-prod-6d04.FlatConnect.participants`
WHERE
Connect_ID IS NOT NULL AND d_827220437 IS NOT NULL
GROUP BY
d_827220437, Connect_ID
HAVING
COUNT(DISTINCT token) > 1


SELECT
Connect_ID,
ARRAY_AGG(DISTINCT token) AS tokens,
COUNT(DISTINCT token) AS num_tokens
FROM
`nih-nci-dceg-connect-prod-6d04.FlatConnect.participants`
WHERE
Connect_ID IS NOT NULL
GROUP BY
Connect_ID
HAVING
COUNT(DISTINCT token) > 1
