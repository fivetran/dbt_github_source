[![Apache License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 
![dbt-core](https://img.shields.io/badge/dbt_core-version_>=1.0.0_<2.0.0-orange.svg)

# GitHub Source dbt Package
# 📣 What does this dbt package do?
This package cleans, tests, and preps GitHub data from [Fivetran's connector](https://fivetran.com/docs/applications/GitHub). It uses data in the format described by [this ERD](https://docs.google.com/presentation/d/1lx6ez7-x-s-n2JCnCi3SjG4XMmx9ysNUvaNCaWc3I_I/edit). For more details around what the source package does, I recommend you checkout our [Fivetran Source Data Model Docs](tbd). This package will materialize the following staging models in your warehouse:

| **Fivetran Source Table**                  | **Materialized Staging Model**   | **Description** |
| -------------------------- | ------------------------------------------------------------------------------ | -------------|
| issue_assignee | [stg_github__issue_assignee](https://fivetran.github.io/dbt_github_source/#!/model/model.github_source.stg_github__issue_assignee)   | Table with the current user(s) assigned to an issue  |
|issue_closed_history|[stg_github__issue_closed_history](https://fivetran.github.io/dbt_github_source/#!/model/model.github_source.stg_github__issue_closed_history)|Table to track when an issue is closed or re-opened |
|issue_comment|[stg_github__issue_comment](https://fivetran.github.io/dbt_github_source/#!/model/model.github_source.stg_github__issue_comment)|Table that contains comments made on issues |
|issue_label|[stg_github__issue_label](https://fivetran.github.io/dbt_github_source/#!/model/model.github_source.stg_github__issue_label)|The current labels attached to an issue |
|issue_merged|[stg_github__issue_merged](https://fivetran.github.io/dbt_github_source/#!/model/model.github_source.stg_github__issue_merged)|Table that tracks when an issue (always a pull request) is merged. |
|issue|[stg_github__issue](https://fivetran.github.io/dbt_github_source/#!/model/model.github_source.stg_github__issue)|Table that contains 1 entry for every issue created. Pull Requests also create an entry in this table, and there is a boolean field to determine if an entry is a pull request. |
|label|[stg_github__label](https://fivetran.github.io/dbt_github_source/#!/model/model.github_source.stg_github__label)|Table that contains labels that are used across your Github account within individual repositories. |
|pull_request_review|[stg_github__pull_request_review](https://fivetran.github.io/dbt_github_source/#!/model/model.github_source.stg_github__pull_request_review)|Table containing reviews made to pull requests. |
|pull_request|[stg_github__pull_request](https://fivetran.github.io/dbt_github_source/#!/model/model.github_source.stg_github__pull_request)|A special type of issue that is created when a user wants to merge one branch of code into another. |
|repo_team|[stg_github__repo_team](https://fivetran.github.io/dbt_github_source/#!/model/model.github_source.stg_github__repo_team)|Table representing the mapping relationships between repositories and teams. |
|repository|[stg_github__repository](https://fivetran.github.io/dbt_github_source/#!/model/model.github_source.stg_github__repository)|Table representing the file structure of a directory under git control. |
|requested_reviewer_history|[stg_github__requested_reviewer_history](https://fivetran.github.io/dbt_github_source/#!/model/model.github_source.stg_github__requested_reviewer_history)|Table containing when a user requests another user to review a pull request. |
|team|[stg_github__team](https://fivetran.github.io/dbt_github_source/#!/model/model.github_source.stg_github__team)|Table containing teams and team details. |
|user|[stg_github__user](https://fivetran.github.io/dbt_github_source/#!/model/model.github_source.stg_github__user)|Table representing contributors to a git project. |

# 🤔 Who is the target user of this dbt package?
This package is intended to be leveraged by **all** Fivetran customers who are leveraging the GitHub connector and dbt. This package is great for gaining a better understanding of the source data in your warehouse, testing the data for integrity, and lightly enriching and staging the data for further transformations in downstream models. The models within this package are easily referenced in your own data models and are intended to be part of your data transformation workflow. Think of this as a staging layer that you don't need to maintain!

Further, if you want to leverage pre-made data models that apply additional transformations on top of this package and create analytics ready models then I highly recommend you install our [GitHub Modeling dbt Package](https://github.com/fivetran/dbt_github)!

# 🎯 How do I use the dbt package?
To effectively install this package and leverage the pre-made models, you will want to follow the below steps:
## Step 1: Requirements 
### Connector
Have the Fivetran GitHub connector syncing data into your warehouse. 
  - Ensure all the source tables listed [above]() are being synced. FYI the tables necessary for use in this package should be synced by default.
### Database support
This package has been tested on BigQuery, Snowflake and Redshift. Ensure you are using one of these supported databases.

### dbt Version
This dbt package requires you have a functional dbt project that utilizes a dbt version within the respective range `>=1.0.0, <2.0.0`.
  - If you do not have dbt installed, I recommend you refer to the [dbt setup guide]() for details on how to get your first dbt project set up.

## Step 2: Installing the Package
Include the following github_source package version in your `packages.yml`

```yaml
packages:
  - package: fivetran/github_source
    version: [">=0.5.0", "<0.6.0"]
```
> Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

## Step 3: Configure Your Variables
### Database and Schema Variables
By default, this package will run using your target database and the `github` schema. If this is not where your GitHub data is (perhaps your gitHub schema is `Github_fivetran`), add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
config-version: 2

vars:
  github_source:
    github_database: your_database_name
    github_schema: your_schema_name 
```
### Disabling Model Variables
Your Github connector might not sync every table that this package expects. If your syncs exclude certain tables, it is because you either don't use that functionality in Github or have actively excluded some tables from your syncs.

If you do not have the `REPO_TEAM` table synced, add the following variable to your `dbt_project.yml` file:

```yml
# dbt_project.yml
config-version: 2

vars:
    github__using_repo_team: false # by default this is assumed to be true
```

*Note: This package only integrates the above variable. If you'd like to disable other models, please create an [issue](https://github.com/fivetran/dbt_github_source/issues) specifying which ones.*

## (Optional) Step 4: Additional Configurations
### Change the Build Schema
By default, this package builds the GitHub staging models within a schema titled (<target_schema> + `_stg_github`) in your target database. If this is not where you would like your GitHub staging data to be written to, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
models:
    github_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```

## Step 5: Finish Setup
Your dbt project is now setup to successfully run the dbt package models! You can now execute `dbt run` and `dbt test` to see the models materialize in your warehouse and execute the data integrity tests applied within the package.

## (Optional) Step 6: Orchestrate your package models with Fivetran
Fivetran offers the ability for you to orchestrate your dbt project through the [Fivetran Transformations for dbt Core](https://fivetran.com/docs/transformations/dbt) product. Refer to the linked docs for more information on how to setup your project for orchestration through Fivetran. 

# Package Dependency Matrix
This dbt package is dependent on the following dbt packages. For more information on the below packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
```
packages:
  - package: fivetran/fivetran_utils
    version: [">=0.3.0", "<0.4.0"]
  - package: dbt-labs/dbt_utils
    version: [">=0.8.0", "<0.9.0"]
```
> If you have any of these dependent packages in your own `packages.yml ` I highly recommend you remove them to ensure there are no package version conflicts.
# 🙌 Contributions and Maintenance
## Package Maintenance
The Fivetran team maintaining this package **only** maintains the latest version of the package. We highly recommend you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/github_source/latest/) of the package and refer to the [CHANGELOG](/CHANGELOG.md) and release notes for more information on changes across versions.

## Contributions
These dbt packages are developed by a small team of analytics engineers at Fivetran. However, the packages are made better by community contributions! We highly encourage and welcome contributions to this package. Please create issues if you have any questions, or feel free to fork the repo to apply your changes and open a PR against `main` if you would like to directly contribute. Check out 
[this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) on the best workflow for contributing to a package.

# 🏪 Resources
- If you encounter any questions or want to reach out for help, please refer to the [GitHub Issue](https://github.com/fivetran/dbt_github_source/issues/new/choose) section to find the right avenue of support for you.
