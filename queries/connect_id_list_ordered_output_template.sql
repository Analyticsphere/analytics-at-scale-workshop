-- Source sheet: ORDER BY CONNECTID
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

WITH id_list AS (
SELECT id AS Connect_ID, offset
FROM UNNEST([
*Add list of ConnectIDs here
]) AS id WITH OFFSET
)

SELECT
t.Connect_ID,

CASE
WHEN t.d_878865966 = '104430631' THEN 'No'
WHEN t.d_878865966 = '353358909' THEN 'Yes'
END AS BioFin_BaseBloodCol_v1r0,

CASE
WHEN t.d_684635302 = '104430631' THEN 'No'
WHEN t.d_684635302 = '353358909' THEN 'Yes'
END AS BioFin_BaseMouthCol_v1r0,

CASE
WHEN t.d_167958071 = '104430631' THEN 'No'
WHEN t.d_167958071 = '353358909' THEN 'Yes'
END AS BioFin_BaseUrineCol_v1r0

FROM `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants` t
JOIN id_list i
ON t.Connect_ID = i.Connect_ID

ORDER BY i.offset
