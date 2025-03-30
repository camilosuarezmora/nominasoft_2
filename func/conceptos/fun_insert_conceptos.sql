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
wind_perio_pago tab_conceptos.ind_perio_pago%TYPE,
wneto_pagado tab_conceptos.neto_pagado%TYPE,
wval_porcent tab_conceptos.val_porcent%TYPE,
wval_fijo tab_conceptos.val_fijo%TYPE,
wind_legal tab_conceptos.ind_legal%TYPE
) RETURNS BOOLEAN AS
$$
    BEGIN
    --logica
        INSERT INTO tab_conceptos (
			id_concepto,
			nom_concepto,
			ind_operacion,
			ind_perio_pago,
			neto_pagado,
			val_porcent,
			val_fijo,
			ind_legal
		) 
		VALUES(
            (SELECT COALESCE(MAX(id_concepto),0) + 1 FROM tab_conceptos),
            wnom_concepto,
            wind_operacion,
            wind_perio_pago,
            wneto_pagado,
            wval_porcent,
            wval_fijo,
            wind_legal                 
        );

    --validaciones
        IF FOUND THEN
            RAISE NOTICE 'Se agregó re bien parcerito tqm';
            RETURN TRUE;
        ELSE 
            RAISE NOTICE 'no se agregó nada gei';
            RETURN FALSE;
		END IF;

        IF LENGTH(wnom_concepto) < 5 THEN
            RAISE NOTICE 'ese nombre está muy cortico qcho';
            RETURN FALSE;
        END IF;

        IF wind_perio_pago <> 'Q' OR wind_perio_pago <> 'M' THEN
            RAISE NOTICE 'valor incorrecto, se debe escribir Q si va a pagar quincenal o M para mensual';
            RETURN FALSE;
        END IF;

        IF LENGTH(wval_porcent) < 0 AND LENGTH(wval_porcent) >= 3  THEN
            RAISE NOTICE 'el valor del porcentaje está fuera del alcance';
            RETURN FALSE; 
        END IF;

        IF LENGTH(wval_fijo) < 0 AND LENGTH(wval_fijo) >= 8 THEN
            RAISE NOTICE 'el valor fijo ingresado está fuera del alcance';
            RETURN FALSE; 
        END IF;

    --excepciones 
        EXCEPTION   
            WHEN SQLSTATE '23505' THEN
                RAISE NOTICE 'Está mandando un NULO en el ID... Sea serio';
			    RETURN FALSE;

            WHEN SQLSTATE '23514' THEN
                RAISE NOTICE 'El valor ingresado no cumple el check solicitado';
                RETURN FALSE;
            
            WHEN others THEN
                RAISE NOTICE 'Error desconocido al insertar el dato';
                RETURN FALSE;
    END;
$$

LANGUAGE PLPGSQL;