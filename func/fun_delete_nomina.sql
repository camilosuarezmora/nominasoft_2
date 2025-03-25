/*
=========================================================================
    función pa borrar las nominas
    camilo suarez 
    24/03/2025
=========================================================================
*/

CREATE OR REPLACE FUNCTION fun_delete_nomina(
    /*PK*/wano_nom tab_nomina.ano_nom%TYPE,
    /*PK*/wmes_nom tab_nomina.mes_nom%TYPE,
    /*PK*/wper_nom tab_nomina.per_nom%TYPE
) RETURNS VOID AS
$$
    BEGIN
        DELETE FROM tab_nomina WHERE 
            ano_nom = wano_nom AND
            mes_nom = wmes_nom AND
            per_nom = wper_nom;
    END;
$$

LANGUAGE PLPGSQL;