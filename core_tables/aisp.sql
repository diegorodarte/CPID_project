CREATE TABLE rj-civitas-dev.cpid_2026_06__diego.aisp AS (
  SELECT  id,
          name,
          ST_GEOGFROMTEXT(geometry) AS geometry
  FROM rj-civitas-dev.cpid_2026_06__diego.staging_aisp
)