-- Source sheet: De-identified site data
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

/*
This sheet contains reference logic that is not SQL; content preserved as a block comment.

Race and Sex Data from Sites

race = case_when(state_d_684926335 == '635279662' |state_d_849518448 == '768826601' | 
                                                    state_d_119643471 == '635279662' | state_d_253532712=='723775357' ~ "White, Non-Hispanic" , 
                                                  state_d_684926335 %in% c('232334767', '401335456') |
                                                    state_d_849518448 == '181769837' |
                                                    state_d_253532712 %in% c('153444133','572474909','308427446',
                                                                             '211228524','277568192','611398522','181769837') |
                                                    state_d_119643471 %in% c('232334767','211228524','308427446','432722256',
                                                                             '232663805','785578696','200929978','490725843','965998904') ~ "Other",
                                                  state_d_684926335 == '178420302'  | 
                                                    state_d_849518448 == '178420302' | 
                                                    state_d_253532712 == '178420302' |
                                                    state_d_119643471  %in% c( '986445321','746038746','178420302') |
                                                    (is.na(state_d_119643471) & d_827220437 == '657167265') ~ "Unknown"),
sex = case_when(state_d_706256705 == '536341288' | state_d_435027713 == '536341288' ~ "Female",
                                                 state_d_706256705 == '654207589' | state_d_435027713 == '654207589' ~ "Male",
                                                 #state_d_706256705 == '830573274' ~ "Intersex or Other", # too small of a count for now, need to combine with unknown
*/
