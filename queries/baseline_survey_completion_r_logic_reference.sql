-- Source sheet: Completions
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

/*
This sheet contains reference logic that is not SQL; content preserved as a block comment.

Baseline Survey Completions

process = case_when(d_100767870 == 353358909 ~ "All",
d_949302066 != 231311385 ~ "None",
d_949302066 == 231311385 & d_536735468 == 231311385 & d_976570371 == 231311385 ~ "BOH, MRE, and SAS Sections",
d_949302066 == 231311385 & d_976570371 == 231311385 & d_663265240 == 231311385  ~ "BOH, SAS, and LAW Sections",
d_949302066 == 231311385 & d_536735468 == 231311385 & d_663265240 == 231311385  ~ "BOH, MRE, and LAW Sections",
d_949302066 == 231311385 & d_536735468 == 231311385 ~ "BOH and MRE Sections",
d_949302066 == 231311385 & d_976570371 == 231311385 ~ "BOH and SAS Sections",
d_949302066 == 231311385 & d_663265240 == 231311385 ~ "BOH and LAW Sections",
d_949302066 == 231311385 ~ "BOH Section only"),
BL_comp = case_when(d_100767870==353358909 ~ "All",
process=="None" ~ "None",
process=="BOH Section only" ~ "BOH Only",
TRUE ~ "2 or 3 Sections")
BSL_compl = case_when(d_100767870==353358909 ~ "All Baseline Modules Completed",
TRUE ~ "One or More Baseline Modules Not Completed")
*/
