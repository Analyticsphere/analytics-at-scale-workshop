-- Source sheet: Biospec 990
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

SELECT
Connect_ID,
d_633640710_d_427719697 AS `Collection Cup Not Returned`,
d_633640710_d_309189173 AS `Collection Cup Leaked - Total Sample Loss`
FROM
`nih-nci-dceg-connect-prod-6d04.FlatConnect.kitAssembly`
WHERE
d_633640710_d_427719697 = "353358909"
OR d_633640710_d_309189173 = "353358909";


-- w/ named variables

SELECT
Connect_ID,
CASE
WHEN d_633640710_d_427719697 = "353358909" THEN "Yes"
WHEN d_633640710_d_427719697 = "104430631" THEN "No"
ELSE NULL
END AS `BioKit_CollCupNotRet_v1r0`,
/*
CASE
WHEN d_633640710_d_309189173 = "353358909" THEN "Yes"
WHEN d_633640710_d_309189173 = "104430631" THEN "No"
ELSE NULL
END AS `BioKit_CollCupLeakTotal_v1r0`,
*/
d_259846815 AS `BioKit_MWCupID_v1r0`,
d_826941471 AS `BioKit_KitRecdTm_v1r0`
FROM
`nih-nci-dceg-connect-prod-6d04.FlatConnect.kitAssembly`
WHERE
d_633640710_d_427719697 IN ("353358909")
-- OR d_633640710_d_309189173 IN ("353358909");
