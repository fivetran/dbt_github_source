# Github Source dbt Package ([Docs](https://fivetran.github.io/dbt_github_source/))

<p align="left">
    <a alt="License"
        href="https://github.com/fivetran/dbt_github_source/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_Core™_version->=1.3.0_<2.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
    <a alt="Fivetran Quickstart Compatible"
        href="https://fivetran.com/docs/transformations/dbt/quickstart">
        <img src="https://img.shields.io/badge/Fivetran_Quickstart_Compatible%3F-yes-green.svg" /></a>
</p>

## What does this dbt package do?
<!--section="github_source_model"-->
- Materializes [Github staging tables](https://fivetran.github.io/dbt_github_source/#!/overview/github_source/models/?g_v=1&g_e=seeds) which leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/github/#schemainformation). These staging tables clean, test, and prepare your Github data from [Fivetran's connector](https://fivetran.com/docs/applications/github) for analysis by doing the following:
  - Name columns for consistency across all packages and for easier analysis
  - Adds freshness tests to source data
    - dbt Core >= 1.9.6 is required to run freshness tests out of the box
  - Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
- Generates a comprehensive data dictionary of your Github data through the [dbt docs site](https://fivetran.github.io/dbt_github_source/).
- These tables are designed to work simultaneously with our [Github transformation package](https://github.com/fivetran/dbt_github).
<!--section-end-->

## How do I use the dbt package?
### Step 1: Prerequisites
To use this dbt package, you must have the following:
- At least one Fivetran Github connection syncing data into your destination.
- A **BigQuery**, **Snowflake**, **Redshift**, **PostgreSQL** or **Databricks**  destination.

#### Databricks Dispatch Configuration
If you are using a Databricks destination with this package you will need to add the below (or a variation of the below) dispatch configuration within your `dbt_project.yml`. This is required in order for the package to accurately search for macros within the `dbt-labs/spark_utils` then the `dbt-labs/dbt_utils` packages respectively.
```yml
dispatch:
  - macro_namespace: dbt_utils
    search_order: ['spark_utils', 'dbt_utils']
```

### Step 2: Install the package (skip if also using the `github` transformation package)
Include the following github_source package version in your `packages.yml` file.
> TIP: Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yaml
packages:
  - package: fivetran/github_source
    version: [">=0.9.0", "<0.10.0"] # we recommend using ranges to capture non-breaking changes automatically
```

### Step 3: Define database and schema variables
By default, this package runs using your destination and the `github` schema. If this is not where your github data is (for example, if your github schema is named `github_fivetran`), add the following configuration to your root `dbt_project.yml` file:

```yml
vars:
    github_database: your_destination_name
    github_schema: your_schema_name 
```

### Step 4: Disable models for non-existent sources
Your Github connection might not sync every table that this package expects. If your syncs exclude certain tables, it is because you either don't use that functionality in Github or have actively excluded some tables from your syncs.

If you do not have the `TEAM`, `REPO_TEAM`, `ISSUE_ASSIGNEE`, `ISSUE_LABEL`, `LABEL`, or `REQUESTED_REVIEWER_HISTORY` tables synced and are not running the package via Fivetran Quickstart, add the following variables to your `dbt_project.yml` file:

```yml
vars:
    github__using_repo_team: false # by default this is assumed to be true. Set to false if missing TEAM or REPO_TEAM
    github__using_issue_assignee: false # by default this is assumed to be true
    github__using_issue_label: false # by default this is assumed to be true
    github__using_label: false # by default this is assumed to be true
    github__using_requested_reviewer_history: false # by default this is assumed to be true
```
*Note: This package only integrates the above variables. If you'd like to disable other models, please create an [issue](https://github.com/fivetran/dbt_github_source/issues) specifying which ones.*

### (Optional) Step 5: Additional configurations
<details open><summary>Expand/collapse configurations</summary>

#### Change the build schema
By default, this package builds the github staging models within a schema titled (`<target_schema>` + `_github_source`) in your destination. If this is not where you would like your github staging data to be written, add the following configuration to your root `dbt_project.yml` file:

```yml
models:
    github_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```
#### Change the source table references
If an individual source table has a different name than the package expects, add the table name as it appears in your destination to the respective variable:
> IMPORTANT: See this project's [`dbt_project.yml`](https://github.com/fivetran/dbt_github_source/blob/main/dbt_project.yml) variable declarations to see the expected names.
    
```yml
vars:
    github_<default_source_table_name>_identifier: your_table_name 
```
    
</details>

### (Optional) Step 5: Orchestrate your models with Fivetran Transformations for dbt Core™
<details><summary>Expand for more details</summary>

Fivetran offers the ability for you to orchestrate your dbt project through [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt). Learn how to set up your project for orchestration through Fivetran in our [Transformations for dbt Core™ setup guides](https://fivetran.com/docs/transformations/dbt#setupguide).
    
</details>

### Does this package have dependencies?
This dbt package is dependent on the following dbt packages. These dependencies are installed by default within this package. For more information on the following packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> IMPORTANT: If you have any of these dependent packages in your own `packages.yml` file, we highly recommend that you remove them from your root `packages.yml` to avoid package version conflicts.
    
```yml
packages:
    - package: fivetran/fivetran_utils
      version: [">=0.4.0", "<0.5.0"]

    - package: dbt-labs/dbt_utils
      version: [">=1.0.0", "<2.0.0"]

    - package: dbt-labs/spark_utils
      version: [">=0.3.0", "<0.4.0"]

```
## How is this package maintained and can I contribute?
### Package Maintenance
The Fivetran team maintaining this package _only_ maintains the latest version of the package. We highly recommend that you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/github_source/latest/) of the package and refer to the [CHANGELOG](https://github.com/fivetran/dbt_github_source/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.

### Contributions
A small team of analytics engineers at Fivetran develops these dbt packages. However, the packages are made better by community contributions.

We highly encourage and welcome contributions to this package. Check out [this dbt Discourse article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) to learn how to contribute to a dbt package.

## Are there any resources available?
- If you have questions or want to reach out for help, see the [GitHub Issue](https://github.com/fivetran/dbt_github_source/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran or would like to request a new dbt package, fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).
