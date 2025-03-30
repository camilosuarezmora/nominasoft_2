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
) RETURNS BOOLEAN AS
$$
    BEGIN

    --lógica
        UPDATE tab_conceptos SET
            nom_concepto = new_nom_concepto,
            ind_perio_pago = new_ind_perio_pago,
            ind_operacion = new_ind_operacion,
            neto_pagado = new_neto_pagado,
            val_porcent = new_val_porcent,
            val_fijo = new_val_fijo,
            ind_legal = new_ind_legal
        WHERE id_concepto = wid_concepto;


    -- validaciones con el if 

        IF FOUND THEN
            RAISE NOTICE 'Se ha actualizado correctamente la tabla yeyyy';
            RETURN TRUE;
        ELSE
            RAISE NOTICE 'NO SE ENCONTRO LA ACUALIZACIÓN pipipi';
            RETURN FALSE;  
        END IF;

        IF LENGTH(wnom_concepto) < 5 THEN
            RAISE NOTICE 'El nombre ingresado es muy corto, debe ser mayor a 5 digitos';
            RETURN FALSE; 
        END IF;

        IF wind_perio_pago NOT IN ('Q','M')  THEN
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
        WHEN SQLSTATE '23503' THEN
            RAISE EXCEPTION 'La llave foranea ingresada no existe en la tabla hija';
            RETURN FALSE;

        WHEN SQLSTATE '23505' THEN
            RAISE EXCEPTION 'Error: violación de restricción única';
            RETURN FALSE;

        WHEN SQLSTATE '23514' THEN
            RAISE EXCEPTION ' valor no cumple restricciones de la tabla';
            RETURN FALSE;

        WHEN SQLSTATE '22001' THEN
            RAISE EXCEPTION 'El valor ingresado excede la longuitud permitida';
            RETURN FALSE;

        WHEN SQLSTATE '22P02' THEN
            RAISE EXCEPTION 'el tipo de dato ingresado no corresponde con el pactado';
            RETURN FALSE;

        WHEN OTHERS THEN
            RAISE EXCEPTION 'Error desconocido: %', SQLERRM;
            RETURN FALSE;
    END;
$$

LANGUAGE PLPGSQL