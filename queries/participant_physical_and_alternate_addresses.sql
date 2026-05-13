-- Source sheet: Physical Address
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

SELECT

Connect_ID,

d_284580415 as Alternative_address_line1,
d_728926441 as Alternative_address_line2,
d_907038282 as Alternative_address_city,
d_970839481 as Alternative_address_state,
d_379899229 as Alternative_address_zip,
d_810747471 as Alternate_address_PObox,

d_207908218 as Phys_Address_line1,
d_224392018 as Phys_address_line2,
d_451993790 as Physical_address_city,
d_187799450 as Physical_address_state,
d_449168732 as Physical_address_zipcode,


FROM `nih-nci-dceg-connect-stg-5519.FlatConnect.participants`

WHERE Connect_ID =
