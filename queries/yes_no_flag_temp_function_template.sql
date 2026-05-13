-- Source sheet: Yes_No_SQL_function
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

CREATE TEMP FUNCTION yes_no_flag(x STRING)
AS (
CASE
WHEN x = '104430631' THEN 'No'
WHEN x = '353358909' THEN 'Yes'
ELSE NULL
END
);

SELECT
Connect_ID,


yes_no_flag(d_685002411_d_994064239) AS HdRef_Basesrv_v1r0,
yes_no_flag(d_685002411_d_194410742) AS HdRef_Baseblood_v1r0,
yes_no_flag(d_685002411_d_949501163) AS HdRef_Baseurine_v1r0,
yes_no_flag(d_685002411_d_277479354) AS HdRef_Basesaliva_v1r0,
yes_no_flag(d_685002411_d_867203506) AS HdRef_Allsrv_v1r0,
yes_no_flag(d_685002411_d_352996056) AS HdRef_Allsample_v1r0,
yes_no_flag(d_685002411_d_217367618) AS HdRef_BlSpecSrv_v1r0,
yes_no_flag(d_747006172) AS HdWd_WdConsent_v1r0,
yes_no_flag(d_906417725) AS HdWd_Activepart_v1r0,
yes_no_flag(d_773707518) AS HdWd_HIPAArevoked_v1r0,
yes_no_flag(d_831041022) AS HdWd_Destroydata_v1r0,
yes_no_flag(d_987563196) AS HdWd_Deceased_v1r0
