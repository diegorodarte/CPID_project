CREATE OR REPLACE EXTERNAL TABLE `rj-civitas-dev.cpid_2026_06__diego.staging_ruas_rio`
(
    cod_trecho STRING,
    nome_completo STRING, 
    bairro STRING,
    geography STRING   
)
OPTIONS (
    format = 'CSV',
    uris = ['gs://rj-civitas-dev/diego/ruas_rio/ruas_rio.csv'],
    skip_leading_rows = 1,
    allow_quoted_newlines = TRUE
    );