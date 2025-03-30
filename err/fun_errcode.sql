/*
===================================================================
    se crea la función que agarra el errcode y devuelve el nombre del error 
===================================================================
*/
create or replace FUNCTION fun_errcode(wcod_error tab_error.cod_error%TYPE) RETURNS VARCHAR AS
$$
    DECLARE wtexto_error VARCHAR;

    BEGIN
		SELECT name_error
		INTO wtexto_error
		FROM tab_error 
		WHERE cod_error = wcod_error;
        
        RETURN wtexto_error;
    END;
$$

LANGUAGE PLPGSQL;