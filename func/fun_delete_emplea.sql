/*
================================================================================
    función para borrar cositas de la tabla emplea
    camilo suarez
    24/03/2025 
================================================================================
*/
CREATE OR REPLACE FUNCTION fun_delete_emplea(wid_emplea tab_emplea.id_emplea%TYPE) RETURNS VOID AS 
$$
    BEGIN
        DELETE FROM tab_emplea 
        WHERE id_emplea = wid_emplea;
    END;
$$

LANGUAGE PLPGSQL;