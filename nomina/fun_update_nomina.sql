/*
========================================================
    función para actualizar registros de la nomina
    camilo suarez 
    24/03/2025
========================================================
*/

CREATE OR REPLACE FUNCTION fun_update_nomina(
/*PK*/wano_nom tab_nomina.ano_nom%TYPE,
/*PK*/wmes_nom tab_nomina.mes_nom%TYPE,
/*PK*/wper_nom tab_nomina.per_nom%TYPE,

/*FK*/wid_emplea tab_nomina.id_emplea%TYPE,
/*FK*/wid_concepto tab_nomina.id_concepto%TYPE,
      wval_dias_trab tab_nomina.val_dias_trab%TYPE,
      wval_nomina tab_nomina.val_nomina%TYPE
) RETURNS VOID AS
$$
    BEGIN
        UPDATE tab_nomina SET
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