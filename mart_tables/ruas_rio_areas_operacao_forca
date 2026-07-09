CREATE OR REPLACE TABLE rj-civitas-dev.cpid_2026_06__diego.ruas_rio_areas_operacao_forca AS

SELECT
   rr.cod_trecho, 
   rr.nome_completo, 
   rr.bairro, 
   ARRAY_AGG(DISTINCT aof.id IGNORE NULLS) AS areas_operacao

FROM rj-civitas-dev.cpid_2026_06__diego.ruas_rio rr

INNER JOIN rj-civitas-dev.cpid_2026_06__diego.areas_operacao_forca aof
ON ST_INTERSECTS(rr.geography, aof.geography) 

GROUP BY 
    rr.cod_trecho,
    rr.nome_completo,
    rr.bairro