/*

=======================================================================
    función para crear/insertar conceptos
    camilo suarez 
    22/03/2025
=======================================================================
*/

/*declaro todos los parametros de la función excepto el id porque no lo voy a necesitar, el valor del id se crea y se inserta solo con el "coalesce"*/
CREATE OR REPLACE FUNCTION fun_insert_conceptos(
wnom_concepto tab_conceptos.nom_concepto%TYPE,
wind_operacion tab_conceptos.ind_operacion%TYPE,
wind_pereo_pago tab_conceptos.ind_pereo_pago%TYPE,
wneto_pagado tab_conceptos.neto_pagado%TYPE,
wval_porcent tab_conceptos.val_porcent%TYPE,
wval_fijo tab_conceptos.val_fijo%TYPE,
wind_legal tab_conceptos.ind_legal%TYPE
) RETURNS VOID AS
$$
    BEGIN
        INSERT INTO tab_conceptos (
			id_concepto,
			nom_concepto,
			ind_operacion,
			ind_pereo_pago,
			neto_pagado,
			val_porcent,
			val_fijo,
			ind_legal
		) 
		VALUES(
            (SELECT COALESCE(MAX(id_concepto),0) + 1 FROM tab_conceptos),
            wnom_concepto,
            wind_operacion,
            wind_pereo_pago,
            wneto_pagado,
            wval_porcent,
            wval_fijo,
            wind_legal                 
        );
    END;
$$

LANGUAGE PLPGSQL;