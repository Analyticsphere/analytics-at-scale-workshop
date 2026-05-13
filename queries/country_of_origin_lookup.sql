-- Source sheet: Country of Origin
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

SELECT

Connect_ID,

CASE
WHEN d_837244890_integer = '360734594' then 'France'
WHEN d_837244890_integer = '602510992' then 'Portugal'
WHEN d_837244890_integer = '581659944' then 'Thailand'
END as country_new_integer,


d_837244890_integer as country_new_integer,

d_384576626 as country_old,
d_876546260 as birth_city,
d_337485417 as birth_state,
d_384576626 as birth_country,

FROM `nih-nci-dceg-connect-dev.FlatConnect.participants`
WHERE Connect_ID in (






)

ORDER BY CASE Connect_ID
WHEN '' THEN 1
WHEN '' THEN 2
WHEN '' THEN 3
WHEN '' THEN 4
WHEN '' THEN 5
ELSE 6
END;
