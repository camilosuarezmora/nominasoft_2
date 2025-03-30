/*
=======================================================
    función para eliminar conceptos
    camilo suárez 
    24/03/2025
=======================================================
*/

CREATE OR REPLACE FUNCTION fun_delete_conceptos(wid_concepto tab_conceptos.id_concepto%TYPE) RETURNS BOOLEAN AS
$$
    BEGIN

    --logica
        DELETE FROM tab_conceptos
        WHERE id_concepto = wid_concepto;

    --if
        IF NOT FOUND THEN
            RAISE NOTICE 'el concepto con el id % fue eliminado', wid_cargo;
            RETURN TRUE;
        ELSE 
            RAISE NOTICE 'No se pudo borrar esa vuelta mano, paila';
            RETURN FALSE;
        END IF; 
        
    --excepciones
        EXCEPTION
            WHEN SQLSTATE '02000' THEN
                RAISE NOTICE 'el cargo con el id % no existe', wid_cargo;
                RETURN FALSE; 
        
            WHEN SQLSTATE '23502' THEN 
                RAISE NOTICE 'Se intentó ingresar un valor nulo';
                RETURN FALSE;

            WHEN SQLSTATE '22003' THEN
                RAISE NOTICE 'No se pudo insertar, el número es demasiado grande';
                RETURN FALSE;

            WHEN SQLSTATE '22P02' THEN
                RAISE NOTICE 'No se pudo insertar, el formato del dato es incorrecto';
                RETURN FALSE;

            WHEN OTHERS THEN
                RAISE NOTICE 'Ocurrió un error desconocido';
                RETURN FALSE;
    END;
$$

LANGUAGE PLPGSQL;