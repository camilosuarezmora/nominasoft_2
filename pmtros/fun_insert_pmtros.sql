/*
==================================================================
    fnc para insertar valores en la tabla pmtros
    camilo suarez 
    24/03/2025
==================================================================
*/

CREATE OR REPLACE FUNCTION fun_insert_pmtros(
--El id se hace autoincremental entonces no es un parametro que se le pida al user
wnom_empresa tab_pmtros.nom_empresa%TYPE,
wind_perio_pago tab_pmtros.ind_perio_pago%TYPE,
wval_smlv tab_pmtros.val_smlv%TYPE,
wval_auxtrans tab_pmtros.val_auxtrans%TYPE,
wind_numtrans tab_pmtros.ind_numtrans%TYPE,
wval_ano_nom tab_pmtros.val_ano_nom%TYPE,
wval_mes_nom tab_pmtros.val_mes_nom%TYPE,
wval_por_intces tab_pmtros.val_por_intces%TYPE,
wnum_diasmes tab_pmtros.num_diasmes%TYPE
) RETURNS VOID AS
$$
	BEGIN
        INSERT INTO tab_pmtros VALUES(
            (SELECT COALESCE(MAX(id_empresa),0)+1 FROM tab_pmtros),
            wnom_empresa,
            wind_perio_pago,
            wval_smlv,
            wval_auxtrans,
            wind_numtrans,
            wval_ano_nom,
            wval_mes_nom,
            wval_por_intces,
            wnum_diasmes
        );
-- SI FALLA ES POR QUE FALTA ESPECIFICAR QUE COSAS SE VAN A AGREGAR CON EL PARENTESIS DESPUÉS DE "INSERT INTO tab_pmtros()"
    END;
$$

LANGUAGE PLPGSQL;