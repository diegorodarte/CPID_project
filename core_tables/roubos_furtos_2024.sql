CREATE TABLE rj-civitas-dev.cpid_2026_06__diego.roubos_furtos_2024 AS (
  SELECT  rgocronu,
          SAFE_CAST(ano AS INT64) AS ano,
          SAFE_CAST(data AS DATE) AS data,
          SAFE_CAST(hora AS TIME) AS hora,
          SAFE_CAST(delito AS INT64) AS delito,
          SAFE_CAST(longitude AS float64) AS longitude,
          SAFE_CAST(latitude AS float64) AS latitude,
          desc_delito
  FROM rj-civitas-dev.cpid_2026_06__diego.staging_roubos_furtos_2024
)