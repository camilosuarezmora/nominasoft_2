/*
===============================================
    función para insertar nomina
    camilo suarez 
    24/03/2025
===============================================
*/

CREATE OR REPLACE FUNCTION fun_insert_nomina(
/*PK*/wano_nom tab_nomina.ano_nom%TYPE,
/*PK*/wmes_nom tab_nomina.mes_nom%TYPE,
/*PK*/wper_nom tab_nomina.per_nom%TYPE,

/*FK*/wid_emplea tab_nomina.id_emplea%TYPE, /*hay que crear la primero*/
/*FK*/wid_concepto tab_nomina.id_concepto%TYPE,

      wval_dias_trab tab_nomina.val_dias_trab%TYPE,
      wval_nomina tab_nomina.val_nomina%TYPE
) RETURNS VOID AS
$$
    BEGIN
        INSERT INTO tab_nomina VALUES(
        wano_nom,
        wmes_nom,
        wper_nom,
        wid_emplea,
        wid_concepto,
        wval_dias_trab,
        wval_nomina);	
    END;
$$

LANGUAGE PLPGSQL;