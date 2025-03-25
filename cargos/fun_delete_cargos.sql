/*
======================================================
    función para eliminar un cargo
    camilo suárez
    22/03/2025
======================================================
*/

CREATE OR REPLACE FUNCTION fun_delete_cargos(wid_cargo tab_cargos.id_cargo%TYPE) RETURNS VARCHAR AS
$BODY$
    BEGIN
        DELETE FROM tab_cargos
        WHERE id_cargo = wid_cargo;

        /*no estoy seguto si FOUND se puede usar así, 
        pero aqui le pido que si no encuentra el cargo que borramos diga que si se cumplió el borrado
        IF not FOUND(SELECT id_cargo FROM tab_cargos;) THEN
            RAISE NOTICE 'el cargo con el id % fue eliminado', wid_cargo;
            RETURN 'CARGO ELIMINADO';
        ELSE 
            RETURN 'no se pudo borrar esa vuelta mano, paila';
        END IF;
		*/

		RETURN 'borrado exitoso';
    END;
$BODY$

LANGUAGE PLPGSQL