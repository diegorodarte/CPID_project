CREATE TABLE rj-civitas-dev.cpid_2026_06__diego.ruas_rio AS (
  SELECT  cod_trecho,
          nome_completo,
          bairro,
          ST_GEOGFROMTEXT(geography) AS geography
  FROM rj-civitas-dev.cpid_2026_06__diego.staging_ruas_rio
)