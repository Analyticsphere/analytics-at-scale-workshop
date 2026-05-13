-- Source sheet: Verification-by-Outreach status
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

WITH base AS (
SELECT
CASE
WHEN state_d_444699761 = '426360242' THEN 'Method Used'
WHEN state_d_444699761 = '734437214' THEN 'Method Not Used'
END AS Auto_Verif,

CASE
WHEN state_d_953614051 = '426360242' THEN 'Method Used'
WHEN state_d_953614051 = '734437214' THEN 'Method Not Used'
END AS Manual_Verif,

CASE
WHEN state_d_188797763 = '104430631' THEN 'No'
WHEN state_d_188797763 = '353358909' THEN 'Yes'
END AS Outreach_Required,

CASE
WHEN d_827220437 = '531629870' THEN 'HealthPartners'
WHEN d_827220437 = '548392715' THEN 'Henry Ford Health System'
WHEN d_827220437 = '125001209' THEN 'Kaiser Permanente Colorado'
WHEN d_827220437 = '327912200' THEN 'Kaiser Permanente Georgia'
WHEN d_827220437 = '300267574' THEN 'Kaiser Permanente Hawaii'
WHEN d_827220437 = '452412599' THEN 'Kaiser Permanente Northwest'
WHEN d_827220437 = '303349821' THEN 'Marshfield Clinic Health System'
WHEN d_827220437 = '657167265' THEN 'Sanford Health'
WHEN d_827220437 = '809703864' THEN 'University of Chicago Medicine'
WHEN d_827220437 = '517700004' THEN 'National Cancer Institute'
WHEN d_827220437 = '472940358' THEN 'Baylor Scott & White Health'
END AS Site

FROM `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants`
WHERE d_821247024 = '219863910' -- Verification status = cannot be verified
AND d_831041022 = '104430631' -- Data destroy = no
AND state_d_444699761 IS NOT NULL
AND state_d_953614051 IS NOT NULL
AND state_d_188797763 IS NOT NULL
),

counts AS (
SELECT
Site,
Auto_Verif,
Manual_Verif,
Outreach_Required,
COUNT(*) AS sample_counts
FROM base
GROUP BY Site, Auto_Verif, Manual_Verif, Outreach_Required
),

sites AS (
SELECT * FROM UNNEST([
'HealthPartners',
'Henry Ford Health System',
'Kaiser Permanente Colorado',
'Kaiser Permanente Georgia',
'Kaiser Permanente Hawaii',
'Kaiser Permanente Northwest',
'Marshfield Clinic Health System',
'Sanford Health',
'University of Chicago Medicine',
'National Cancer Institute',
'Baylor Scott & White Health'
]) AS Site
),

grid AS (
SELECT
s.Site,
Auto_Verif,
Manual_Verif,
Outreach_Required
FROM sites s
CROSS JOIN UNNEST(['Method Used','Method Not Used']) AS Auto_Verif
CROSS JOIN UNNEST(['Method Used','Method Not Used']) AS Manual_Verif
CROSS JOIN UNNEST(['Yes','No']) AS Outreach_Required
)

SELECT
g.Site,
g.Auto_Verif,
g.Manual_Verif,
g.Outreach_Required,
COALESCE(c.sample_counts, 0) AS sample_counts
FROM grid g
LEFT JOIN counts c
ON g.Site = c.Site
AND g.Auto_Verif = c.Auto_Verif
AND g.Manual_Verif = c.Manual_Verif
AND g.Outreach_Required = c.Outreach_Required
ORDER BY
Site,
Auto_Verif,
Manual_Verif,
Outreach_Required;










WITH base AS (
SELECT
CASE
WHEN state_d_444699761 = '426360242' THEN 'Method Used'
WHEN state_d_444699761 = '734437214' THEN 'Method Not Used'
WHEN state_d_444699761 IS NULL then 'Auto Verif Missing'
END AS Auto_Verif,

CASE
WHEN state_d_953614051 = '426360242' THEN 'Method Used'
WHEN state_d_953614051 = '734437214' THEN 'Method Not Used'
WHEN state_d_953614051 IS NULL then 'Manual Verif Missing'
END AS Manual_Verif,

CASE
WHEN state_d_188797763 = '104430631' THEN 'No'
WHEN state_d_188797763 = '353358909' THEN 'Yes'
WHEN state_d_188797763 IS NULL THEN 'Outreach Required Missing'
END AS Outreach_Required,

CASE
WHEN d_827220437 = '531629870' THEN 'HealthPartners'
WHEN d_827220437 = '548392715' THEN 'Henry Ford Health System'
WHEN d_827220437 = '125001209' THEN 'Kaiser Permanente Colorado'
WHEN d_827220437 = '327912200' THEN 'Kaiser Permanente Georgia'
WHEN d_827220437 = '300267574' THEN 'Kaiser Permanente Hawaii'
WHEN d_827220437 = '452412599' THEN 'Kaiser Permanente Northwest'
WHEN d_827220437 = '303349821' THEN 'Marshfield Clinic Health System'
WHEN d_827220437 = '657167265' THEN 'Sanford Health'
WHEN d_827220437 = '809703864' THEN 'University of Chicago Medicine'
WHEN d_827220437 = '517700004' THEN 'National Cancer Institute'
WHEN d_827220437 = '472940358' THEN 'Baylor Scott & White Health'
END AS Site

FROM `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants`
WHERE d_821247024 = '197316935' -- Verification status = verified
AND d_831041022 = '104430631' -- Data destroy = no
-- AND state_d_444699761 IS NOT NULL
-- AND state_d_953614051 IS NOT NULL
-- AND state_d_188797763 IS NOT NULL
),

counts AS (
SELECT
Site,
Auto_Verif,
Manual_Verif,
Outreach_Required,
COUNT(*) AS sample_counts
FROM base
GROUP BY Site, Auto_Verif, Manual_Verif, Outreach_Required
),

sites AS (
SELECT * FROM UNNEST([
'HealthPartners',
'Henry Ford Health System',
'Kaiser Permanente Colorado',
'Kaiser Permanente Georgia',
'Kaiser Permanente Hawaii',
'Kaiser Permanente Northwest',
'Marshfield Clinic Health System',
'Sanford Health',
'University of Chicago Medicine',
'National Cancer Institute',
'Baylor Scott & White Health'
]) AS Site
),

grid AS (
SELECT
s.Site,
Auto_Verif,
Manual_Verif,
Outreach_Required
FROM sites s
CROSS JOIN UNNEST(['Method Used','Method Not Used', 'Auto Verif Missing']) AS Auto_Verif
CROSS JOIN UNNEST(['Method Used','Method Not Used', 'Manual Verif Missing']) AS Manual_Verif
CROSS JOIN UNNEST(['Yes','No', 'Outreach Required Missing']) AS Outreach_Required
)

SELECT
g.Site,
g.Auto_Verif,
g.Manual_Verif,
g.Outreach_Required,
COALESCE(c.sample_counts, 0) AS sample_counts
FROM grid g
LEFT JOIN counts c
ON g.Site = c.Site
AND g.Auto_Verif = c.Auto_Verif
AND g.Manual_Verif = c.Manual_Verif
AND g.Outreach_Required = c.Outreach_Required
ORDER BY
Site,

-- Auto_Verif order
CASE g.Auto_Verif
WHEN 'Method Not Used' THEN 1
WHEN 'Method Used' THEN 2
WHEN 'Auto Verif Missing' THEN 3
END,

-- Manual_Verif order
CASE g.Manual_Verif
WHEN 'Method Not Used' THEN 1
WHEN 'Method Used' THEN 2
WHEN 'Manual Verif Missing' THEN 3
END,

-- Outreach_Required order
CASE g.Outreach_Required
WHEN 'No' THEN 1
WHEN 'Yes' THEN 2
WHEN 'Outreach Required Missing' THEN 3
END;
