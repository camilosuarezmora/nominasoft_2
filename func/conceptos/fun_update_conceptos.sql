/*
===================================================================
    función para actualizar la tabla conceptos
    camilo suárez 
    24/02/2025
===================================================================
*/

CREATE OR REPLACE FUNCTION fun_update_conceptos(
wid_concepto tab_conceptos.id_concepto%TYPE,
new_nom_concepto tab_conceptos.nom_concepto%TYPE,
new_ind_operacion tab_conceptos.ind_operacion%TYPE,
new_ind_perio_pago tab_conceptos.ind_perio_pago%TYPE,
new_neto_pagado tab_conceptos.neto_pagado%TYPE,
new_val_porcent tab_conceptos.val_porcent%TYPE,
new_val_fijo tab_conceptos.val_fijo%TYPE,
new_ind_legal tab_conceptos.ind_legal%TYPE
) RETURNS VOID AS
$$
    BEGIN
        UPDATE tab_conceptos SET
            nom_concepto = new_nom_concepto,
            ind_perio_pago = new_ind_perio_pago,
            ind_operacion = new_ind_operacion,
            neto_pagado = new_neto_pagado,
            val_porcent = new_val_porcent,
            val_fijo = new_val_fijo,
            ind_legal = new_ind_legal
        WHERE id_concepto = wid_concepto;
    END;
$$

LANGUAGE PLPGSQL