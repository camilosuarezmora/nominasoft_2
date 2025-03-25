/*
=========================================================================
    función pa borrar las novedades :p
    camilo suarez 
    24/03/2025
=========================================================================
*/

CREATE OR REPLACE FUNCTION fun_delete_novedades(
    /*PK*/wano_nom tab_novedades.ano_nom%TYPE,
    /*PK*/wmes_nom tab_novedades.mes_nom%TYPE,
    /*PK*/wper_nom tab_novedades.per_nom%TYPE
) RETURNS VOID AS
$$
    BEGIN
        DELETE FROM tab_novedades WHERE 
            ano_nom = wano_nom AND
            mes_nom = wmes_nom AND
            per_nom = wper_nom;
    END;
$$

LANGUAGE PLPGSQL;