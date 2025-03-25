/*
========================================================
    función para actualizar las novedades
    camilo suarez 
    24/03/2025
========================================================
*/

CREATE OR REPLACE FUNCTION fun_update_novedades(
/*PK*/wano_nom tab_novedades.ano_nom%TYPE,
/*PK*/wmes_nom tab_novedades.mes_nom%TYPE,
/*PK*/wper_nom tab_novedades.per_nom%TYPE,

/*FK*/wid_emplea tab_novedades.id_emplea%TYPE,
/*FK*/wid_concepto tab_novedades.id_concepto%TYPE,
      wval_dias_trab tab_novedades.val_dias_trab%TYPE,
      wval_nomina tab_novedades.val_nomina%TYPE
) RETURNS VOID AS
$$
    BEGIN
        UPDATE tab_novedades SET
            id_emplea = wid_emplea,
            id_concepto = wid_concepto,
            val_dias_trab = wval_dias_trab,
            val_nomina = wval_nomina
        WHERE 
            ano_nom = wano_nom AND
            mes_nom = wmes_nom AND
            per_nom = wper_nom;
    END;
$$

LANGUAGE PLPGSQL;

/*Cuando se actualiza un registro con valores diferentes a los que conforman la PK, se crea otro registro. 
no debería pasar JAKSJKASJ*/