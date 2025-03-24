/*
=======================================================
    función para eliminar conceptos
    camilo suárez 
    24/03/2025
=======================================================
*/

CREATE OR REPLACE FUNCTION fun_delete_conceptos(wid_concepto tab_conceptos.id_concepto%TYPE) RETURNS VOID AS:
$$
    BEGIN
        DELETE FROM tab_conceptos
        WHERE id_concepto = wid_concepto;
    END;
$$

LANGUAGE PLPGSQL;