# Using Authorized Views for Project-Specific Pseudo IDs in BigQuery

This tutorial shows you how to maintain a single "master" table with real Connect_ID values while exposing project-specific pseudo_IDs through authorized views. This approach avoids duplicating data across projects and ensures that each project sees only its own pseudo_IDs. The tutorial covers:

1.  Creating the master table.
2.  Creating a UDF for project-specific pseudo_ID generation.
3.  Creating a project-specific authorized view.
4.  Key maintenance and governance points.

------------------------------------------------------------------------

## Step 1: Create the Master Table

Store your original data with real Connect_ID values in a master table. Limit access to this table so that only trusted service accounts or administrators can query it directly.

``` sql
CREATE OR REPLACE TABLE your_project.master_dataset.master_table AS
SELECT
  Connect_ID,
  field_a,
  field_b
FROM
  source_of_truth;
```

*Note:* Be sure to set proper access controls on `master_table` to prevent unauthorized access to real IDs.

------------------------------------------------------------------------

## Step 2: Create a UDF for Project-Specific Hashing

Create a user-defined function that converts the real Connect_ID into a pseudo_ID. This function incorporates a project-specific salt to generate unique pseudo_IDs per project.

``` sql
CREATE OR REPLACE FUNCTION your_project.your_dataset.func_project_pseudo_id(
  real_id STRING,
  project_name STRING
) RETURNS STRING AS (
  SAFE_CONVERT_BYTES_TO_STRING(
    SHA256(CONCAT(real_id, '_SECRET_SALT_FOR_', project_name))
  )
);
```

*Key Points:*

-   Adjust the salt (`'_SECRET_SALT_FOR_'`) per project as needed.

-   Ensure that the salt values are stored and managed securely.

-   This function ensures the same real Connect_ID will yield different pseudo_IDs for different projects.

------------------------------------------------------------------------

## Step 3: Create a Project-Specific Authorized View

Create a view for each project that selects data from the master table and applies the UDF to transform the Connect_ID into a pseudo_ID. Only grant users access to this view—not to the master table.

For example, for "ProjectA":

``` sql
CREATE OR REPLACE VIEW your_project.projectA_dataset.view_projectA AS
SELECT
  your_project.your_dataset.func_project_pseudo_id(master_table.Connect_ID, 'ProjectA') AS pseudo_ID,
  master_table.field_a,
  master_table.field_b
FROM
  your_project.master_dataset.master_table;
```

*Key Considerations:* - Grant the appropriate permissions so that ProjectA users only have access to `view_projectA`. - Each project can have a similar view but with a project-specific salt or project name.

------------------------------------------------------------------------

## Maintenance and Governance

When implementing this approach, consider the following maintenance and governance aspects:

-   **Single Source of Truth:**\
    Maintain only one master table, minimizing data duplication and the risk of inconsistencies.

-   **Access Control:**\
    Ensure that only authorized users have access to the master table. Each project should only access its authorized view.

-   **Data Updates:**\
    As the master table is updated, the authorized views remain valid and reflect the latest data without additional modifications.

-   **Security Reviews:**\
    Regularly review the security policies surrounding the mapping function and view access. Rotate salts or update security practices as necessary.

-   **Compliance:**\
    Ensure that your setup complies with your organization's data governance policies and any relevant privacy regulations.

------------------------------------------------------------------------

By following these steps, you can keep a secure master dataset while exposing project-specific pseudo_IDs via authorized views. This approach limits the risk of cross-project re-identification and adheres to best practices in data security and governance.

## Internal Example:

NCCR - state registry

-   Johanna

-   Use a CBIIT-blessed algorithm

-   
