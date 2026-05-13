-- Source sheet: AB Variable
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

SELECT
token,
state_d_956485028,
CASE
WHEN state_d_956485028 = '562663942' THEN 'Altruism Personal'
WHEN state_d_956485028 = '686986259' THEN 'Altruism General'
WHEN state_d_956485028 = '477331464' THEN 'Cancer Connection Personal'
WHEN state_d_956485028 = '935486262' THEN 'Cancer Connection General'
WHEN state_d_956485028 = '518814501' THEN 'Research Personal'
WHEN state_d_956485028 = '307763550' THEN 'Research General'
ELSE NULL
END
AS RcrtSI_ABMessage_v1r0
FROM
`nih-nci-dceg-connect-stg-5519.FlatConnect.participants`
WHERE
token IN ( )
