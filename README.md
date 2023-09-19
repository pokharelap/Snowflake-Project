This Project mainly focused on data engineering and creating a data pipeline
Integrate AWS S3 with Snowflake, allowing access for Snowflake to read, change, edit, and delete files in the S3 bucket:

- **Database and Schema Creation:**
  - Created a Snowflake database named `DATAANALYTICS`.
  - Created a schema named `DATAANALYTICS_12345` within the database.

- **AWS S3 Integration Setup:**
  - Established an integration with AWS S3, named `aws_s3_integration`.
  - Configured it as an external stage with the `S3` storage provider.
  - Provided an AWS IAM role ARN (`arn:aws:iam::380460936039:role/dataanalyticsrole`) for authentication.
  - Enabled the integration and specified allowed S3 locations (`s3://dataanalytics787889/`).

- **File Format Definition:**
  - Defined a CSV file format named `DATAANALYTICS_FORMAT`.
  - Set the file format to use a pipe (`|`) as the field delimiter and skip the first header row.

- **Staging Setup:**
  - Created a stage named `dataanalytics_aws_stage`.
  - Associated this stage with the `aws_s3_integration` integration.
  - Specified the `DATAANALYTICS_FORMAT` file format.
  - Provided the S3 URL where data is stored (`s3://dataanalytics787889/`).

- **File Operations:**
  - Listed files in the `dataanalytics_aws_stage`.
  - Removed a specific file (`Diabetes.csv`) from the stage.

- **Table Creation:**
  - Created a table named `your_table_name` with multiple DATE columns.
  - Enclosed column names in double quotes to preserve case sensitivity.

- **File Format Re-definition:**
  - Created or replaced a file format named `my_csv_format` with similar CSV settings.

- **Data Copy:**
  - Copied data from an external file (`Visa.csv`) in the `dataanalytics_aws_stage` into the `visa` table.
  - Configured it to continue execution even if errors occurred during copying.

- **Data Analysis:**
  - Executed a query to count missing values in specific columns of the `visa` table.

Overall, these actions set up the environment for Snowflake to interact with AWS S3, allowing for data ingestion, manipulation, and analysis within the Snowflake database while leveraging data stored in the S3 bucket.
