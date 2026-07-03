CREATE TABLE rj-civitas-dev.cpid_2026_06__diego.areas_operacao_forca AS (
  SELECT  id,
          ST_GEOGFROMTEXT(geography) AS geography
  FROM rj-civitas-dev.cpid_2026_06__diego.staging_areas_operacao_forca
)