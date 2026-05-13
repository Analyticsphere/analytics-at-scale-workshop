-- Source sheet: Twins
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

SELECT
p.Connect_ID,
m.D_992987417,
CASE
WHEN m.D_992987417 = "104430631" THEN 'No'
WHEN m.D_992987417 = "353358909" THEN 'Yes'
WHEN m.D_992987417 = "288105839" THEN 'Yes, fraternal twins (not identical)'
WHEN m.D_992987417 = "626558982" THEN 'Yes, triplets or higher multiple birth'
ELSE 'Unknown'
END AS D_992987417_label
FROM `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants` p
LEFT JOIN `nih-nci-dceg-connect-prod-6d04.FlatConnect.module1_v2` m
ON p.Connect_ID = m.Connect_ID
WHERE p.Connect_ID IN (
"",
"",
"",
""
);
