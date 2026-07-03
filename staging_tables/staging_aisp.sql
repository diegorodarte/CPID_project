CREATE OR REPLACE EXTERNAL TABLE `rj-civitas-dev.cpid_2026_06__diego.staging_aisp`
(
    id STRING,
    name STRING, 
    geometry STRING
)
OPTIONS (
    format = 'CSV',
    uris = ['gs://rj-civitas-dev/diego/aisp/aisp.csv'],
    skip_leading_rows = 1
    );