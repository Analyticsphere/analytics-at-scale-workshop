-- List all recruits with Recruit Type (CID 512820379) = Not active (CID 180583933)
-- Dictionary lookup source: MasterSurveyComb_20260501
--   RcrtSI_RecruitType_v1r0: Participants Table Not nested (d_512820379)
--   RcrtES_Site_v1r0: Participants Table Not nested (d_827220437)
--   RcrtV_Verification_v1r0: Participants Table Not nested (d_821247024)

SELECT
  token,
  CASE d_827220437
    WHEN '125001209' THEN 'Kaiser Permanente Colorado'
    WHEN '327912200' THEN 'Kaiser Permanente Georgia'
    WHEN '300267574' THEN 'Kaiser Permanente Hawaii'
    WHEN '452412599' THEN 'Kaiser Permanente Northwest'
    WHEN '531629870' THEN 'HealthPartners'
    WHEN '548392715' THEN 'Henry Ford Health System'
    WHEN '303349821' THEN 'Marshfield Clinic Health System'
    WHEN '657167265' THEN 'Sanford Health'
    WHEN '809703864' THEN 'University of Chicago Medicine'
    WHEN '517700004' THEN 'National Cancer Institute'
    WHEN '472940358' THEN 'Baylor Scott & White Health'
    WHEN '181769837' THEN 'Other'
  END AS Site,
  CASE d_512820379
    WHEN '180583933' THEN 'Not Active'
    WHEN '486306141' THEN 'Active'
    WHEN '854703046' THEN 'Passive'
  END AS Recruit_Type,
  CASE d_821247024
    WHEN '875007964' THEN 'Not yet verified'
    WHEN '197316935' THEN 'Verified'
    WHEN '219863910' THEN 'Cannot be verified'
    WHEN '922622075' THEN 'Duplicate'
    WHEN '160161595' THEN 'Outreach timed out'
    WHEN '290379732' THEN 'No Longer Enrolling'
  END AS Verification_Status
FROM `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants`
WHERE d_512820379 = '180583933' -- Recruit Type = Not active
ORDER BY
  Site,
  token;


SELECT
  CASE d_827220437
    WHEN '125001209' THEN 'Kaiser Permanente Colorado'
    WHEN '327912200' THEN 'Kaiser Permanente Georgia'
    WHEN '300267574' THEN 'Kaiser Permanente Hawaii'
    WHEN '452412599' THEN 'Kaiser Permanente Northwest'
    WHEN '531629870' THEN 'HealthPartners'
    WHEN '548392715' THEN 'Henry Ford Health System'
    WHEN '303349821' THEN 'Marshfield Clinic Health System'
    WHEN '657167265' THEN 'Sanford Health'
    WHEN '809703864' THEN 'University of Chicago Medicine'
    WHEN '517700004' THEN 'National Cancer Institute'
    WHEN '472940358' THEN 'Baylor Scott & White Health'
    WHEN '181769837' THEN 'Other'
  END AS Site,
  COUNT(*) AS Not_Active_Recruit_Count
FROM `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants`
WHERE d_512820379 = '180583933' -- Recruit Type = Not active
GROUP BY
  Site
ORDER BY
  Site;
