CREATE OR REPLACE EXTERNAL TABLE `rj-civitas-dev.cpid_2026_06__diego.staging_risp`
(
    id STRING,
    name STRING, 
    geometry STRING    
)
OPTIONS (
    format = 'CSV',
    uris = ['gs://rj-civitas-dev/diego/risp/risp.csv'],
    skip_leading_rows = 1
    );