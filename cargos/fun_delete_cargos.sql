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
            RAISE NOTICE 'el cargo con el id % fue eliminado', wid_cargo;
            RETURN TRUE;
        ELSE 
            RAISE NOTICE 'no se pudo borrar esa vuelta mano, paila';
            RETURN FALSE;
        END IF; 

    --excepciones 
        EXCEPTION
        WHEN no_data_found THEN
            RAISE NOTICE 'el cargo con el id % no existe', wid_cargo;
            RETURNS FALSE;
        WHEN 
    

    END;
$BODY$

LANGUAGE PLPGSQL