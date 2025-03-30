/*
======================================================
    función para eliminar un cargo
    camilo suárez
    22/03/2025
======================================================
*/

CREATE OR REPLACE FUNCTION fun_delete_cargos(wid_cargo tab_cargos.id_cargo%TYPE) RETURNS BOOLEAN AS
$BODY$
    BEGIN
    --Lógica
        DELETE FROM tab_cargos
        WHERE id_cargo = wid_cargo;

    --validaciones con if    
        --validaciones en el eliminado
        IF NOT FOUND THEN
            RAISE NOTICE 'El cargo con el id % fue eliminado', wid_cargo;
            RETURN TRUE;
        ELSE 
            RAISE NOTICE 'No se pudo borrar esa vuelta mano, paila';
            RETURN FALSE;
        END IF; 

        IF LENGTH(wid_cargo) > 2 THEN
            RAISE NOTICE 'El id ingresado es mayor a 2 dígitos';
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
$BODY$

LANGUAGE PLPGSQL