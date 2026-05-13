-- Source sheet: Race groups
-- Generated from workbook: BigQuery_Data Queries_20260513.xlsx

/*
This sheet contains reference logic that is not SQL; content preserved as a block comment.

RACE CATEGORIES (updated Multi-Racial: March 2025)

race_columns <- c(
  "D_384191091_D_384191091_D_583826374",
  "D_384191091_D_384191091_D_636411467",
  "D_384191091_D_384191091_D_458435048",
  "D_384191091_D_384191091_D_706998638",
  "D_384191091_D_384191091_D_973565052",
  "D_384191091_D_384191091_D_586825330",
  "D_384191091_D_384191091_D_412790539",
  "D_384191091_D_384191091_D_807835037"
)

# All data is currently string values; convert "1" and "0" to numeric
# values before summarizing.
module1[race_columns] <- lapply(module1[race_columns], as.numeric)
module1$multi_racial <- ifelse(rowSums(module1[race_columns], na.rm = TRUE) > 1, 1, 0)

which_race <- module1 %>%
  mutate(
    race = case_when(
      multi_racial == 1 ~ "Multi-Racial",
      D_384191091_D_384191091_D_583826374 == 1 ~ "American Indian or Native American",
      D_384191091_D_384191091_D_636411467 == 1 ~ "Asian/Asian American",
      D_384191091_D_384191091_D_458435048 == 1 ~ "Black, African American, or African",
      D_384191091_D_384191091_D_706998638 == 1 ~ "Hispanic, Latino, or Spanish",
      D_384191091_D_384191091_D_973565052 == 1 ~ "Middle Eastern or North African",
      D_384191091_D_384191091_D_586825330 == 1 ~ "Hawaiian or Pacific Islander",
      D_384191091_D_384191091_D_412790539 == 1 ~ "White",
      D_384191091_D_384191091_D_807835037 == 1 |
        !is.na(D_384191091_D_747350323) ~ "Other",
      D_384191091_D_384191091_D_746038746 == 1 ~ "Prefer Not to Answer",
      D_384191091_D_384191091_D_178420302 == 1 ~ "Unknown",
      TRUE ~ "Skipped this question "
    )
  )

dt_all_races_summary <- which_race %>%
  dplyr::group_by(race) %>%
  dplyr::summarize(n = n(), percentage = 100 * n / nrow(.)) %>%
  dplyr::ungroup() %>%
  dplyr::select(race, n, percentage)

dt_all_races_summary %>%
  gt::gt(rowname_col = "row_lab") %>%
  fmt_number(columns = "percentage", decimals = 2) %>%
  tab_header(
    title = md("Race/Ethnicity of Participants Who Completed BOH Section of First Survey")
  ) %>%
  cols_label(
    n = md("**N**"),
    race = md("**Answer**"),
    percentage = md("**%**")
  ) %>%
  grand_summary_rows(
    columns = c(n, percentage),
    fns = ~sum(., na.rm = TRUE)
  ) |>
  tab_options(
    stub.font.weight = "bold"
  ) %>%
  tab_style(
    style = list(
      cell_text(weight = "bold")
    ),
    locations = cells_body(
      columns = race
    )
  )
*/
