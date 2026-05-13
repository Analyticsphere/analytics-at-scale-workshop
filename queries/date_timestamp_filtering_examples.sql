-- Source sheet: DATE vs. DATE(TIMESTAMP)
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

WHERE
DATE(TIMESTAMP(d_914594314)) <= DATE('2025-08-01')



-- EXAMPLE 2:
"Both groups will have the below conditionality:
RcrtV_Verification_v1r0 = 1  
AND HdWd_Activepart_v1r0 = 0  
AND  HdRef_Allsrv_v1r0 = 0 
AND HdWd_Deceased_v1r0 =0 
AND HdWd_WdConsent_v1r0 = 0 
 
Group 1 addtl conditionality:
AND RcrtV_VerificationTm_V1R0 LE 07/07/2024 
 
Group 2 addtl conditionality:
AND RcrtV_VerificationTm_V1R0 GE 07/08/2024 AND LE 08/01/2025  "


WHERE
d_821247024 = '197316935'
AND d_906417725 = '104430631'
AND d_685002411_d_867203506 = '104430631'
AND d_987563196 = '104430631'
AND d_747006172 = '104430631'
-- AND DATE(TIMESTAMP(d_914594314)) <= DATE('2024-07-07')
AND DATE(TIMESTAMP(d_914594314)) >= DATE('2024-07-08')
AND DATE(TIMESTAMP(d_914594314)) <= DATE('2025-08-01')
