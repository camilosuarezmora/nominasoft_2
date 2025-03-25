/*
==================================================
resulta que el códigoqueda desnudo sí no le pongo titulo así bien bonito entonces
función para eliminar de la fila registros 
==================================================
*/

CREATE OR REPLACE FUNCTION fun_delete_pmtros(wid_empresa tab_pmtros.id_empresa%TYPE) RETURNS VOID AS
$$
    BEGIN
        DELETE FROM tab_pmtros
        WHERE id_empresa = wid_empresa; 
    END;
$$
LANGUAGE PLPGSQL;