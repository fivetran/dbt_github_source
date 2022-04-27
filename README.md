<p align="center">
    <a alt="License"
        href="https://github.com/fivetran/dbt_github_source/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="Fivetran-Release"
        href="https://fivetran.com/docs/getting-started/core-concepts#releasephases">
        <img src="https://img.shields.io/badge/Fivetran Release Phase-_Beta-orange.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_core-version_>=1.0.0_<2.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
</p>

# GitHub Source dbt Package ([Docs](https://fivetran.github.io/dbt_github_source/))
# 📣 What does this dbt package do?
- Cleans, tests, and prepares your GitHub data from [Fivetran's connector](https://fivetran.com/docs/applications/github) for analysis.
- Generates a comprehensive data dictionary of your Jira data via the [dbt docs site](https://fivetran.github.io/dbt_github_source/)
- Materializes staging tables which leverage data in the format described by [this ERD](https://docs.google.com/presentation/d/1lx6ez7-x-s-n2JCnCi3SjG4XMmx9ysNUvaNCaWc3I_I/) and is intended to work simultaneously with our [GitHub modeling package](https://github.com/fivetran/dbt_github)
    - Refer to our [Docs site](https://fivetran.github.io/dbt_jira_source/#!/overview/github_source/models/?g_v=1) for more details about these materialized models. 

# 🤔 Who is the target user of this dbt package?
- You use Fivetran's [GitHub connector](https://fivetran.com/docs/applications/GitHub)
- You use dbt
- You want a staging layer that cleans, tests, and prepares your GitHub data for analysis
- (Optional) You want to make use of the [GitHub Modeling dbt Package](https://github.com/fivetran/dbt_github)
# 🎯 How do I use the dbt package?
To effectively install this package and leverage the pre-made models, you will follow the below steps:
## Step 1: Pre-Requisites
You will need to ensure you have the following before leveraging the dbt package.
- **Connector**: Have the Fivetran GitHub connector syncing data into your warehouse. 
- **Database support**: This package has been tested on **BigQuery**, **Snowflake**, **Redshift**, and **Postgres**. Ensure you are using one of these supported databases.
- **dbt Version**: This dbt package requires you have a functional dbt project that utilizes a dbt version within the respective range `>=1.0.0, <2.0.0`.
## Step 2: Installing the Package
Include the following github_source package version in your `packages.yml`
> Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yaml
packages:
  - package: fivetran/github_source
    version: [">=0.5.0", "<0.6.0"]
```
## Step 3: Configure Your Variables
### Database and Schema Variables
By default, this package will run using your target database and the `github` schema. If this is not where your GitHub data is (perhaps your gitHub schema is `github_fivetran`), add the following configuration to your `dbt_project.yml` file:

```yml
vars:
  github_database: your_database_name
  github_schema: your_schema_name 
```
### Disabling Components
Your Github connector might not sync every table that this package expects. If you do not have the `REPO_TEAM` table synced, add the following variable to your `dbt_project.yml` file:

```yml
vars:
  github__using_repo_team: false # by default this is assumed to be true
```
## (Optional) Step 4: Additional Configurations
### Change the Build Schema
By default, this package builds the GitHub staging models within a schema titled (<target_schema> + `_stg_github`) in your target database. If this is not where you would like your GitHub staging data to be written to, add the following configuration to your `dbt_project.yml` file:

```yml
models:
    github_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```

## Step 5: Finish Setup
Your dbt project is now setup to successfully run the dbt package models! You can now execute `dbt run` and `dbt test` to have the models materialize in your warehouse and execute the data integrity tests applied within the package.

## (Optional) Step 6: Orchestrate your package models with Fivetran
Fivetran offers the ability for you to orchestrate your dbt project through the [Fivetran Transformations for dbt Core](https://fivetran.com/docs/transformations/dbt) product. Refer to the linked docs for more information on how to setup your project for orchestration through Fivetran. 

# 🔍 Does this package have dependencies?
This dbt package is dependent on the following dbt packages. For more information on the below packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> **If you have any of these dependent packages in your own `packages.yml` I highly recommend you remove them to ensure there are no package version conflicts.**
```yml
packages:
    - package: fivetran/fivetran_utils
      version: [">=0.3.0", "<0.4.0"]

    - package: dbt-labs/dbt_utils
      version: [">=0.8.0", "<0.9.0"]
```
# 🙌 How is this package maintained and can I contribute?
## Package Maintenance
The Fivetran team maintaining this package **only** maintains the latest version of the package. We highly recommend you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/github_source/latest/) of the package and refer to the [CHANGELOG](https://github.com/fivetran/dbt_github_source/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.

## Contributions
These dbt packages are developed by a small team of analytics engineers at Fivetran. However, the packages are made better by community contributions! 

We highly encourage and welcome contributions to this package. Check out [this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) on the best workflow for contributing to a package!

# 🏪 Are there any resources available?
- If you encounter any questions or want to reach out for help, please refer to the [GitHub Issue](https://github.com/fivetran/dbt_github_source/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran, or would like to request a future dbt package to be developed, then feel free to fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).
- Have questions or want to just say hi? Book a time during our office hours [here](https://calendly.com/fivetran-solutions-team/fivetran-solutions-team-office-hours) or send us an email at solutions@fivetran.com.
