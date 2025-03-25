/*
=================================================
FUNCIÓN PARA insertar registros en la tab_novedades
camilo suarez 
24/03/2025
=================================================
*/

CREATE OR REPLACE FUNCTION fun_insert_novedades(
/*PK*/wano_nom tab_novedades.ano_nom%TYPE,
/*PK*/wmes_nom tab_novedades.mes_nom%TYPE,
/*PK*/wper_nom tab_novedades.per_nom%TYPE,

/*FK*/wid_emplea tab_novedades.id_emplea%TYPE, /*hay que crear la primero*/
/*FK*/wid_concepto tab_novedades.id_concepto%TYPE,

      wval_dias_trab tab_novedades.val_dias_trab%TYPE,
      wval_nomina tab_novedades.val_nomina%TYPE
) RETURNS VOID AS
$$
    BEGIN
        INSERT INTO tab_novedades VALUES(
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