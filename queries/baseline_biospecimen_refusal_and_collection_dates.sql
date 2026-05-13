-- Source sheet: Biospecimen 1525
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

SELECT
Connect_ID,
d_685002411_d_217367618 AS `Refused Baseline Specimen Surveys`,
d_657475009 AS `Refused Baseline specimen surveys date`,
d_561681068 AS `Research collection of Baseline blood sample date`,
d_173836415_d_266600170_d_982213346 AS `Clinical collection of Baseline blood sample date`,
d_847159717 AS `Research collection of Baseline urine sample date`,
d_173836415_d_266600170_d_139245758 AS `Clinical collection of Baseline urine sample date`,
d_448660695 AS `Research collection of Baseline MW sample date`

FROM `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants`

WHERE

d_685002411_d_217367618 = "353358909"





WITH refusals AS (
SELECT
Connect_ID,
-- refusal indicator and date
d_685002411_d_217367618 AS refused_biospec_survey,
d_657475009 AS refusal_date,

-- specimen collection dates
d_561681068 AS research_blood_date,
d_173836415_d_266600170_d_982213346 AS clinical_blood_date,
d_847159717 AS research_urine_date,
d_173836415_d_266600170_d_139245758 AS clinical_urine_date,
d_448660695 AS research_mw_date
FROM `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants`
WHERE d_685002411_d_217367618 = "353358909" -- refused
),

classified AS (
SELECT
*,
-- earliest specimen date across blood, urine, and mouthwash
LEAST(
research_blood_date,
clinical_blood_date,
research_urine_date,
clinical_urine_date,
research_mw_date
) AS earliest_specimen_date,

-- determine whether refusal happened before specimen donation
CASE
WHEN refusal_date IS NOT NULL
AND (
research_blood_date > refusal_date OR research_blood_date IS NULL
)
AND (
clinical_blood_date > refusal_date OR clinical_blood_date IS NULL
)
AND (
research_urine_date > refusal_date OR research_urine_date IS NULL
)
AND (
clinical_urine_date > refusal_date OR clinical_urine_date IS NULL
)
AND (
research_mw_date > refusal_date OR research_mw_date IS NULL
)
THEN 1
ELSE 0
END AS refused_before_any_specimen
FROM refusals
)

SELECT
COUNT(*) AS total_refused, -- denominator
SUM(refused_before_any_specimen) AS refused_before_specimen, -- numerator
SAFE_DIVIDE(SUM(refused_before_any_specimen), COUNT(*)) AS proportion_refused_before_specimen
FROM classified;




AUTUMN'S CODE

-- CALCULATE DENOMINATOR:
SELECT count(*) as denominator_count
FROM `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants`
WHERE
d_685002411_d_217367618 = "353358909" --refused biospecimen survey

--- separate run
-- CALCULATE NUMERATOR:
-- Subset participant data as 'Timestamp_Flags' to create flags:
WITH Timestamp_Flags as (
SELECT
Connect_ID,
d_657475009,
d_685002411_d_217367618,
d_173836415_d_266600170_d_561681068 AS research_blood_dt,
d_173836415_d_266600170_d_982213346 AS clinical_blood_dt,
d_173836415_d_266600170_d_847159717 AS research_urine_dt,
d_173836415_d_266600170_d_139245758 AS clinical_urine_dt,
d_173836415_d_266600170_d_448660695 AS research_MW_dt,
-- Create a flag for whenever collection occurred after refusal:
CASE WHEN d_173836415_d_266600170_d_561681068 > d_657475009 THEN "Yes" ELSE "No" END
AS research_blood_after_refusal,
CASE WHEN d_173836415_d_266600170_d_982213346 > d_657475009 THEN "Yes" ELSE "No" END
AS clinical_blood_after_refusal,
CASE WHEN d_173836415_d_266600170_d_847159717 > d_657475009 THEN "Yes" ELSE "No" END
AS research_urine_after_refusal,
CASE WHEN d_173836415_d_266600170_d_139245758 > d_657475009 THEN "Yes" ELSE "No" END
AS clinical_urine_after_refusal,
CASE WHEN d_173836415_d_266600170_d_448660695 > d_657475009 THEN "Yes" ELSE "No" END
AS research_MW_after_refusal
FROM `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants`
)
-- Select from Timestamp_Flags data:
SELECT
Connect_ID,
CASE WHEN d_685002411_d_217367618 = "353358909" THEN "Yes" ELSE "No"
END AS `Refused Baseline Specimen Survey`,
d_657475009 AS `Refused Baseline Specimen Survey Date`,
-- Include timestamp flag variables
research_blood_dt,
clinical_blood_dt,
research_urine_dt,
clinical_urine_dt,
research_MW_dt
FROM Timestamp_Flags
WHERE
d_685002411_d_217367618 = "353358909" --refused biospecimen survey
AND (
research_blood_after_refusal = "Yes"
OR clinical_blood_after_refusal = "Yes"
OR research_urine_after_refusal = "Yes"
OR clinical_urine_after_refusal = "Yes"
OR research_MW_after_refusal = "Yes"
);
