-- Source sheet: Site
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

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
WHEN d_827220437 = '181769837' THEN 'Other'
END AS RcrtES_Site_v1r0,
