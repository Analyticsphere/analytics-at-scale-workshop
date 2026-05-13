-- Source sheet: DHQ3
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

SELECT *,
d_148184166 as DHQ3Username,
d_262294850 as DHQ3ProcessedTm,
d_196723965 as DHQ3StudyID,

FROM `nih-nci-dceg-connect-dev.Connect.dhqRawAnswers`


SELECT DISTINCT *,
FROM `nih-nci-dceg-connect-dev.Connect.dhqRawAnswers`
WHERE d_148184166 IS NOT NULL


SELECT DISTINCT d_148184166 AS DHQ3Username
FROM `nih-nci-dceg-connect-dev.Connect.dhqRawAnswers`
WHERE d_148184166 IS NOT NULL
ORDER BY DHQ3Username

SELECT DISTINCT d_262294850 AS DHQ3ProcessedTm
FROM `nih-nci-dceg-connect-dev.Connect.dhqRawAnswers`
WHERE d_262294850 IS NOT NULL

SELECT DISTINCT d_196723965 AS DHQ3StudyID
FROM `nih-nci-dceg-connect-dev.Connect.dhqRawAnswers`
WHERE d_196723965 IS NOT NULL


SELECT *,
d_148184166 as DHQ3Username,
d_262294850 as DHQ3ProcessedTm,
d_196723965 as DHQ3StudyID,

FROM `nih-nci-dceg-connect-dev.Connect.dhqDetailedAnalysis`


SELECT DISTINCT d_148184166 AS DHQ3Username
FROM `nih-nci-dceg-connect-dev.Connect.dhqDetailedAnalysis`
WHERE d_148184166 IS NOT NULL
ORDER BY DHQ3Username

SELECT DISTINCT d_262294850 AS DHQ3ProcessedTm
FROM `nih-nci-dceg-connect-dev.Connect.dhqDetailedAnalysis`
WHERE d_262294850 IS NOT NULL

SELECT DISTINCT d_196723965 AS DHQ3StudyID
FROM `nih-nci-dceg-connect-dev.Connect.dhqDetailedAnalysis`
WHERE d_196723965 IS NOT NULL


SELECT *,
d_148184166 as DHQ3Username,
d_262294850 as DHQ3ProcessedTm,
d_196723965 as DHQ3StudyID,

FROM `nih-nci-dceg-connect-dev.Connect.dhqAnalysisResults`

SELECT DISTINCT d_148184166 AS DHQ3Username
FROM `nih-nci-dceg-connect-dev.Connect.dhqAnalysisResults`
WHERE d_148184166 IS NOT NULL
ORDER BY DHQ3Username

SELECT DISTINCT d_262294850 AS DHQ3ProcessedTm
FROM `nih-nci-dceg-connect-dev.Connect.dhqAnalysisResults`
WHERE d_262294850 IS NOT NULL

SELECT DISTINCT d_196723965 AS DHQ3StudyID
FROM `nih-nci-dceg-connect-dev.Connect.dhqAnalysisResults`
WHERE d_196723965 IS NOT NULL
