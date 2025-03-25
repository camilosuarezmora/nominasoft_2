/*
==================================================
    función para insertar meses a la tabla tab_meses
    pide "id_mes" y "nom_mes"
    camilo suarez 
    22/03/2025
==================================================
*/

CREATE OR REPLACE FUNCTION fun_insert_meses(wname_mes tab_meses.nom_mes%TYPE) RETURNS VARCHAR AS
$$ 
    BEGIN
        INSERT INTO tab_meses VALUES(
            (SELECT COALESCE(MAX(id_mes),0) + 1
            FROM tab_meses), wname_mes
        );

        IF FOUND THEN 
            RAISE NOTICE 'se insertó el nuevo mes %', wname_mes;
            RETURN 'todo bn';
        ELSE 
            RETURN 'paila mano, cambiese a derecho';
		END IF;
    END;
$$

LANGUAGE PLPGSQL;