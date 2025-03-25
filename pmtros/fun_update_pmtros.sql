/*
================================================================
    función para actualizar los datos de un parametro
    camilo suarez 
    24/03/2025
================================================================
*/

CREATE OR REPLACE FUNCTION fun_update_pmtros(
wid_empresa tab_pmtros.id_empresa%TYPE,
wnom_empresa tab_pmtros.nom_empresa%TYPE,
wind_perio_pago tab_pmtros.ind_perio_pago%TYPE,
wval_smlv tab_pmtros.val_smlv%TYPE,
wval_auxtrans tab_pmtros.val_auxtrans%TYPE,
wval_pagotrans tab_pmtros.val_pagotrans%TYPE,
wval_ano_nom tab_pmtros.val_ano_nom%TYPE,
wval_mes_nom tab_pmtros.val_mes_nom%TYPE,
wval_por_intces tab_pmtros.val_por_intces%TYPE,
wnum_diasmes tab_pmtros.num_diasmes%TYPE
) RETURNS VOID AS
$$
    BEGIN
        UPDATE tab_pmtros SET
        nom_empresa = wnom_empresa,
        ind_perio_pago = wind_perio_pago,
        val_smlv = wval_smlv,
        val_auxtrans = wval_auxtrans,
        val_pagotrans = wval_pagotrans,
        val_ano_nom = wval_ano_nom,
        val_mes_nom = wval_mes_nom,
        val_por_intces = wval_por_intces,
        num_diasmes = wnum_diasmes
        WHERE wid_empresa = id_empresa;
    END;
$$

LANGUAGE PLPGSQL;