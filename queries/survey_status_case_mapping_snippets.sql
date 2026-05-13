-- Source sheet: Survey Statuses
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

CASE
WHEN d_949302066 = '972455046' THEN 'Not Started'
WHEN d_949302066 = '615768760' THEN 'Started'
WHEN d_949302066 = '231311385' THEN 'Submitted'
END AS SrvBOH_BaseStatus_v1r0,

D_205553981 AS SrvBOH_TmStart_v1r0,
D_517311251 AS SrvBOH_TmComplete_v1r0,

-- MRE: Medications, Reproductive Health, Exercise, Sleep
CASE

WHEN d_536735468 = '615768760' THEN 'Started'
WHEN d_536735468 = '231311385' THEN 'Submitted'
END AS SrvMRE_BaseStatus_v1r0,

D_541836531 AS SrvMRE_TmStart_v1r0,
D_832139544 AS SrvMRE_TmComplete_v1r0,

-- SAS: Smoking, Alcohol, Sun Exposure
CASE
WHEN d_976570371 = '972455046' THEN 'Not Started'
WHEN d_976570371 = '615768760' THEN 'Started'
WHEN d_976570371 = '231311385' THEN 'Submitted'
END AS SrvSAS_BaseStatus_v1r0,

D_386488297 AS SrvSAS_TmStart_v1r0,
D_770257102 AS SrvSAS_TmComplete_v1r0,

-- LAW: Where You Live and Work
CASE
WHEN d_663265240 = '972455046' THEN 'Not Started'
WHEN d_663265240 = '615768760' THEN 'Started'
WHEN d_663265240 = '231311385' THEN 'Submitted'
END AS SrvLAW_BaseStatus_v1r0,

d_452942800 AS SrvLAW_TmStart_v1r0,
d_264644252 AS SrvLAW_TmComplete_v1r0,

-- 

-- BIOSPECIMEN DATA:

-- Blood/Urine/Mouthwash (BLM):
CASE
WHEN d_265193023 = '972455046' THEN 'Not Started'
WHEN d_265193023 = '615768760' THEN 'Started'
WHEN d_265193023 = '231311385' THEN 'Submitted'
END AS SrvBLM_ResSrvCompl_v1r0,

d_822499427 as SrvBLM_TmStart_v1r0,
d_222161762 as SrvBLM_TmComplete_v1r0,

-- Blood/Urine (BLU):
CASE
WHEN d_253883960 = '972455046' THEN 'Not Started'
WHEN d_253883960 = '615768760' THEN 'Started'
WHEN d_253883960 = '231311385' THEN 'Submitted'
END AS SrvBlU_BaseComplete_v1r0,

d_534669573 as SrvBlU_TmStart_v1r0,
d_764863765 as SrvBlU_TmComplete_v1r0,

-- Mouthwash (MW):
CASE
WHEN d_547363263 = '972455046' THEN 'Not Started'
WHEN d_547363263 = '615768760' THEN 'Started'
WHEN d_547363263 = '231311385' THEN 'Submitted'
END AS SrvMtW_BaseComplete_v1r0,

d_286191859 as SrvMtW_TmStart_v1r0,
d_195145666 as SrvMtW_TmComplete_v1r0,

-- 

-- MENSTRAL CYCLE:
CASE
WHEN d_459098666 = '972455046' THEN 'Not Started'
WHEN d_459098666 = '615768760' THEN 'Started'
WHEN d_459098666 = '231311385' THEN 'Submitted'
END AS SrvMC_BaseComplete_v1r0,

d_844088537 AS SrvMC_TmStart_v1r0,
d_217640691 AS SrvMC_TmComplete_v1r0,

-- 

-- COVID:
CASE
WHEN d_220186468 = '972455046' THEN 'Not Started'
WHEN d_220186468 = '615768760' THEN 'Started'
WHEN d_220186468 = '231311385' THEN 'Submitted'
END AS SrvCOV_BaseComplete_v1r0,

d_268176409 AS SrvCOV_TmStart_v1r0,
d_784810139 AS SrvCOV_TmComplete_v1r0,

-- 

-- QOL/PROMIS:
CASE
WHEN d_320303124 = '972455046' THEN 'Not Started'
WHEN d_320303124 = '615768760' THEN 'Started'
WHEN d_320303124 = '231311385' THEN 'Submitted'
END AS SrvQOL_3moStatus_v1r0,

d_870643066 AS SrvQOL_3moTmStart_v1r0,
d_843688458 AS SrvQOL_3moTmComplete_v1r0,

-- 

-- CES:
CASE
WHEN d_956490759 = '972455046' THEN 'Not Started'
WHEN d_956490759 = '615768760' THEN 'Started'
WHEN d_956490759 = '231311385' THEN 'Submitted'
END AS SrvCoE_ConExpStatus_v1r0,

d_263355177 as SrvCoE_ConExpTmStart_v1r0,
d_199471989 as SrvCoE_ConExpTmCompl_v1r0,

-- 

-- CSH: Cancer Screening History
CASE
WHEN d_176068627 = '972455046' THEN 'Not Started'
WHEN d_176068627 = '615768760' THEN 'Started'
WHEN d_176068627 = '231311385' THEN 'Submitted'
END AS SrvScr_CancScrnStatus_v1r0,

d_609630315 as SrvScr_CancScrnTmStart_v1r0,
d_389890053 as SrvScr_CancScrnTmCompl_v1r0,

-- 

-- SSN:
CASE
WHEN d_126331570 = '972455046' THEN 'Not Started'
WHEN d_126331570 = '615768760' THEN 'Started'
WHEN d_126331570 = '231311385' THEN 'Submitted'
END AS SrvSS_SSNSurvey_v1r0,

d_943232079 AS SrvSS_TmStart_v1r0,
d_315032037 AS SrvSS_TmComplete_v1r0,

-- 

-- DHQ3 (internal):
CASE
WHEN d_692560814 = '972455046' THEN 'Not Started'
WHEN d_692560814 = '615768760' THEN 'Started'
WHEN d_692560814 = '231311385' THEN 'Submitted'
END AS SrvDHQ3_6moStatus_v1r0,

d_109610692 as SrvDHQ3_6moTmStart_v1r0,
d_610227793 as SrvDHQ3_6moTmComplete_v1r0,

-- 

-- 2026 ROI:
CASE
WHEN d_278023676 = '972455046' THEN 'Not Started'
WHEN d_278023676 = '615768760' THEN 'Started'
WHEN d_278023676 = '231311385' THEN 'Submitted'
END AS SrvROI_PrefStatus_v1r0,

d_993557295 AS SrvROI_PrefTmStart_v1r0,
d_543379310 AS SrvROI_PrefTmComplete_v1r0,
