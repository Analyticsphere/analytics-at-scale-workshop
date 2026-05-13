-- Source sheet: ReInvitation Campaign Type
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

SELECT token, d_280021666,d_439351436,d_471593703,
CASE
WHEN d_280021666 = '926338735' THEN "Random"
WHEN d_280021666 = '348281054' THEN "Screening appointment"
WHEN d_280021666 = '324692899' THEN "Non-screening appointment"
WHEN d_280021666 = '351257378' THEN "Demographic Group"
WHEN d_280021666 = '647148178' THEN "Aging out of study"
WHEN d_280021666 = '834544960' THEN "Geographic group"
WHEN d_280021666 = '682916147' THEN "Post-Screening Selection"
WHEN d_280021666 = '153365143' THEN "Technology adapters"
WHEN d_280021666 = '663706936' THEN "Low-income/health professional shortage areas"
WHEN d_280021666 = '208952854' THEN "Research Registry"
WHEN d_280021666 = '296312382' THEN "Pop up"
WHEN d_280021666 = '181769837' THEN "Other"
WHEN d_280021666 = '398561594' THEN "None of these apply"
END AS RcrtSI_RInvCampaignType_v1r0
FROM `nih-nci-dceg-connect-dev.FlatConnect.participants`
where token IN ()
