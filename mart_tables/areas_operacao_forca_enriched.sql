CREATE OR REPLACE TABLE rj-civitas-dev.cpid_2026_06__diego.areas_operacao_forca_enriched AS

WITH 


----aisp----

aisp_counts AS (
    SELECT  
        op.id AS area_id,
        a.name,
        COUNT(DISTINCT cd.numero_referencia) AS request_count
  
    FROM rj-civitas-dev.cpid_2026_06__diego.areas_operacao_forca op

    LEFT JOIN rj-civitas-dev.cpid_2026_06__diego.aisp a
    ON ST_INTERSECTS(op.geography, a.geometry)

    LEFT JOIN rj-civitas.cerco_digital.vw_controle_demandas_operacional cd
    ON cd.requisitante
    LIKE CONCAT(a.name,'ª DP%')

    GROUP BY  
        op.id, 
        a.name        
),

aisp_requests AS (
    SELECT  
        area_id,
        ARRAY_AGG(
            STRUCT(
                name AS name,
                request_count AS request_count
            ) 
        ) AS aisp_requests

    FROM aisp_counts

    GROUP BY area_id
),


----cisp----

cisp_counts AS (
    SELECT  
        op.id AS area_id,
        c.name,
        COUNT(DISTINCT cd.numero_referencia) AS request_count
  
    FROM rj-civitas-dev.cpid_2026_06__diego.areas_operacao_forca op

    LEFT JOIN rj-civitas-dev.cpid_2026_06__diego.cisp c
    ON ST_INTERSECTS(op.geography, c.geometry)

    LEFT JOIN rj-civitas.cerco_digital.vw_controle_demandas_operacional cd
    ON cd.requisitante
    LIKE CONCAT(c.name,'º BPM%')

    GROUP BY  
        op.id, 
        c.name        
),

cisp_requests AS (
    SELECT  
        area_id,
        ARRAY_AGG(
            STRUCT(
                name AS name,
                request_count AS request_count
            ) 
    ) AS cisp_requests

    FROM cisp_counts

    GROUP BY area_id
),


----risp----

risp_info AS (
    SELECT
        op.id AS area_id,
        ARRAY_AGG(DISTINCT r.name IGNORE NULLS) AS risp_names

    FROM rj-civitas-dev.cpid_2026_06__diego.areas_operacao_forca op

    LEFT JOIN rj-civitas-dev.cpid_2026_06__diego.risp r
    ON ST_INTERSECTS(op.geography, r.geometry)

    GROUP BY op.id

),


----digital.cameras----

cam_info AS (
    SELECT
        op.id AS area_id,
        ARRAY_AGG(
            STRUCT(
                cm.codigo_camera,
                cm.latitude,
                cm.longitude,
                cm.sistema_origem,
                cm.responsavel
                
            )
            IGNORE NULLS
        ) AS cameras

    FROM rj-civitas-dev.cpid_2026_06__diego.areas_operacao_forca op

    LEFT JOIN rj-civitas.cerco_digital.cameras cm
    ON ST_INTERSECTS(
        op.geography, 
        ST_GEOGPOINT(cm.longitude, cm.latitude)
    )
    AND cm.camera_interna = FALSE

    GROUP BY op.id

),


----digital.equipamento---

equip_info AS (
    SELECT
        op.id AS area_id,
        ARRAY_AGG(
            STRUCT(
                e.codigo_equipamento,
                e.latitude,
                e.longitude,
                e.local,
                e.origem_equipamento
            )
        ) AS equipamento

    FROM rj-civitas-dev.cpid_2026_06__diego.areas_operacao_forca op

    LEFT JOIN rj-civitas.cerco_digital.equipamento e
    ON ST_INTERSECTS(op.geography, e.geography)

    GROUP BY op.id

)


----areas_operacao_forca_enriched----

SELECT
    op.*,
    ar.aisp_requests,
    cr.cisp_requests,
    ri.risp_names,
    ci.cameras,
    eq.equipamento

FROM rj-civitas-dev.cpid_2026_06__diego.areas_operacao_forca op

LEFT JOIN aisp_requests ar
ON op.id = ar.area_id

LEFT JOIN cisp_requests cr
ON op.id = cr.area_id

LEFT JOIN risp_info ri
ON op.id = ri.area_id

LEFT JOIN cam_info ci
ON op.id = ci.area_id

LEFT JOIN equip_info eq
ON op.id = eq.area_id