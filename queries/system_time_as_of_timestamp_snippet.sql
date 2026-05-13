-- Source sheet: TIMESTAMP
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

FROM `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants`
FOR SYSTEM_TIME AS OF TIMESTAMP('2025-05-30 18:34:40.654 UTC')
WHERE
