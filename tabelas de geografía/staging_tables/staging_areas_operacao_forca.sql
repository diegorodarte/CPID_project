CREATE OR REPLACE EXTERNAL TABLE `rj-civitas-dev.cpid_2026_06__diego.staging_areas_operacao_forca`
(
    id STRING,
    geography STRING,  
)
OPTIONS (
    format = 'CSV',
    uris = ['gs://rj-civitas-dev/diego/areas_operacao_forca/areas_operacao_forca.csv'],
    skip_leading_rows = 1
    );