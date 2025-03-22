/*
=====================================================================
    Función para eliminar registros de la tabla meses
        se borrará el nombre del més que tenga el id que le pase
    
    camilo suarez 
    22/03/2025
=====================================================================
*/

CREATE OR REPLACE FUNCTION fun_delete_meses(wid_mes tab_meses.id_mes%TYPE) RETURNS VARCHAR AS
$$
    BEGIN
        DELETE FROM tab_meses 
        WHERE id_mes = wid_mes;

        RETURN'si se pudo, crack';
    END;
$$

LANGUAGE PLPGSQL