CREATE OR REPLACE EXTERNAL TABLE `rj-civitas-dev.cpid_2026_06__diego.staging_roubos_furtos_2024`
(
    rgocronu STRING,
    ano STRING,
    data STRING,
    hora STRING,
    delito STRING,
    longitude STRING,
    latitude STRING,
    desc_delito STRING
)
OPTIONS (
    format = 'CSV',
    uris = ['gs://rj-civitas-dev/diego/roubos_furtos_2024/roubos_furtos_2024.csv'],
    skip_leading_rows = 1
    );
