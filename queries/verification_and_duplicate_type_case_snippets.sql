-- Source sheet: Verification Duplication
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

CASE
WHEN d_821247024 = '875007964' THEN 'Not yet verified'
WHEN d_821247024 = '197316935' THEN 'Verified'
WHEN d_821247024 = '219863910' THEN 'Cannot be verified'
WHEN d_821247024 = '922622075' THEN 'Duplicate'
WHEN d_821247024 = '160161595' THEN 'Outreach timed out'
WHEN d_821247024 = '290379732' THEN 'No Longer Enrolling'
END AS RcrtV_Verification_v1r0,



CASE
WHEN state_d_148197146 = '638335430' THEN 'Active recruit signed in as Passive recruit'
WHEN state_d_148197146 = '283434980' THEN 'Not Active recruit signed in as Passive recruit'
WHEN state_d_148197146 = '866029623' THEN 'Not Active recruit signed in as an Active recruit'
WHEN state_d_148197146 = '654558118' THEN 'Participant already enrolled'
WHEN state_d_148197146 = '979256174' THEN 'Passive recruit signed in as Active recruit'
WHEN state_d_148197146 = '696650324' THEN 'Change in Eligibility Status'
END AS Duplicate_Type,


CASE
WHEN d_512820379 = '180583933' THEN 'Not Active'
WHEN d_512820379 = '486306141' THEN 'Active'
WHEN d_512820379 = '854703046' THEN 'Passive'
END AS Recruit_Type,


CASE
WHEN state_d_793822265 = '132080040' THEN 'No Change Needed'
WHEN state_d_793822265 = '604663208' THEN 'Not Active to Passive'
WHEN state_d_793822265 = '854903954' THEN 'Passive to Active'
WHEN state_d_793822265 = '965707001' THEN 'Active to Passive'
END AS Update_Recruit_Type


d_471593703 as Recruitment_date
