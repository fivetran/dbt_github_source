# dbt_github_source v0.5.0

## 🚨  Breaking Changes 🚨 
- Addition of the `label` source table. This was necessary as the `issue_label` depreciated the `label` column. The respective label information will now be synced within the `label` table. ([#22](https://github.com/fivetran/dbt_github_source/pull/22))
  - If you do not have the new `label` table in your source, we highly recommend you enable schema changes on your connector and kick off a resync to see the new tables reflected in your source.
# dbt_github_source v0.4.1

## Fixes
- Added the `{{ dbt_utils.type_timestamp() }}` cast function to timestamp fields within the staging models. This is required for Redshift users that have the fields originally synced as `timestamptz`. Without the casting of fields the downstream date functions will fail. ([#19](https://github.com/fivetran/dbt_github_source/pull/19))

# dbt_github_source v0.4.0
🎉 dbt v1.0.0 Compatibility 🎉
## 🚨 Breaking Changes 🚨
- Adjusts the `require-dbt-version` to now be within the range [">=1.0.0", "<2.0.0"]. Additionally, the package has been updated for dbt v1.0.0 compatibility. If you are using a dbt version <1.0.0, you will need to upgrade in order to leverage the latest version of the package.
  - For help upgrading your package, I recommend reviewing this GitHub repo's Release Notes on what changes have been implemented since your last upgrade.
  - For help upgrading your dbt project to dbt v1.0.0, I recommend reviewing dbt-labs [upgrading to 1.0.0 docs](https://docs.getdbt.com/docs/guides/migration-guide/upgrading-to-1-0-0) for more details on what changes must be made.
- Upgrades the package dependency to refer to the latest `dbt_fivetran_utils`. The latest `dbt_fivetran_utils` package also has a dependency on `dbt_utils` [">=0.8.0", "<0.9.0"].
  - Please note, if you are installing a version of `dbt_utils` in your `packages.yml` that is not in the range above then you will encounter a package dependency error.

# dbt_github_source v0.1.0 -> v0.3.0
Refer to the relevant release notes on the Github repository for specific details for the previous releases. Thank you!
