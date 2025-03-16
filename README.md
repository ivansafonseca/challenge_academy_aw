# AdventureWorks dbt Project

## Overview

This project focuses on transforming raw data from Snowflake into refined, analytics-ready models using dbt Cloud. The aim is to boost processing efficiency, streamline maintainability, and strengthen data governance across our data pipelines.

## Business Context and Objectives

- **Accelerated Insights:** Minimize the time needed to convert raw data into actionable insights.
- **Streamlined Transformations:** Simplify the complex process of transforming raw data.
- **Improved Maintainability:** Ensure our data models are clear, manageable, and easy to update.

## Why dbt Cloud?

AdventureWorks leverages dbt Cloud and its ecosystem to:
- **Simplify Transformations:** Implement SQL-based transformations with clarity.
- **Automate Workflows:** Benefit from automated pipeline executions.
- **Enhance Governance:** Maintain strict oversight of data operations.
- **Facilitate Collaboration:** Enable seamless team-based development.
- **Track Versions:** Keep detailed records of model changes for easy rollback and audit.

## Project Structure

Our project is organized into distinct directories to keep the code modular and maintainable:

- **Macros:** Reusable SQL snippets for common tasks.
- **Models:** Contains all SQL models for data transformation:
  - **Staging:** Prepares raw data by applying type casts, renaming columns, and enforcing baseline tests.
  - **Intermediate:** Implements additional business logic, filtering, and joining of data.
  - **Marts:** Finalizes the data into a dimensional (star schema) model optimized for reporting and analytics.
- **Seeds:** Static data files (e.g., CSV) used as reference data.
- **Snapshots:** (Optional) Archives historical changes in data over time.
- **Tests:** Houses unit and integration tests to ensure data quality and functionality.
- **dbt_project.yml:** Core configuration file for the dbt project.
- **packages.yml:** Lists all dbt packages in use.
- **README.md:** This documentation file, detailing project setup, usage, and context.

## Coding Standards and Best Practices

- **Naming Conventions:**
  - Use `stg_` for staging models.
  - Use `int_` for intermediate models.
  - Use `dim_` for dimension tables.
  - Use `fct_` for fact tables.
  - Use `agg_` for aggregate models derived from fact tables.

## Git Workflow

We maintain a structured Git workflow:

- **Master:** The branch containing production-ready code.
- **Feature:** Branches for new developments, prefixed with `feature/` (e.g., `feature/add_customer_dim`).

**Pull Requests (PRs):** Every change is submitted via a PR and reviewed using our standard template.  
**Commit Messages:** Write clear, descriptive commit messages summarizing your changes.

Below is a diagram outlining our Git workflow:

<img 
  src="https://wac-cdn.atlassian.com/dam/jcr:cc0b526e-adb7-4d45-874e-9bcea9898b4a/04%20Hotfix%20branches.svg?cdnVersion=2518" 
  alt="Git Workflow Diagram" 
  width="500" 
/>

## Development Environment

Developers can work in one of two environments:
1. **dbt Cloud Web Interface:** Access dbt Cloud directly in your browser.
2. **dbt Cloud CLI + VSCode:** Integrate the dbt Cloud CLI with VSCode for a more conventional development.

## Frameworks & Plugins

### dbt Packages

- **dbt-utils:** Offers a suite of helpful macros for routine tasks.
- **codegen:** Automates the generation of dbt models and scaffolding code.

### Recommended VSCode Extensions

- Power User for dbt
- vscode-dbt

## Testing Practices

Our testing strategy includes:
- **Generic Data Tests:** Validate individual models using `dbt test`.
- **Custom Tests:** Develop specific tests to verify complex model logic.
