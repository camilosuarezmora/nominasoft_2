/*
=========================================================
    funcion para updatear el mes
    camilo suarez 
    22/03/2025
=========================================================
*/

CREATE OR REPLACE FUNCTION fun_update_meses(wid_mes tab_meses.id_mes%TYPE, new_nom_mes tab_meses.nom_mes%TYPE ) RETURNS VOID AS
$$
    BEGIN
        UPDATE tab_meses
        SET nom_mes = new_nom_mes
        WHERE id_mes = wid_mes;
    END;
$$

LANGUAGE PLPGSQL;