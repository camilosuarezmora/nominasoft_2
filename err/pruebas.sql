

create or replace function fun_insert_err(
    wcod_error tab_error.cod_error%TYPE,
    wname_error tab_error.name_error%TYPE
) returns void as
$$
    DECLARE     errcode     varchar;

    BEGIN
        insert into tab_error values(
            wcod_error,
            wname_error
        );

        GET DIAGNOSTICS errcode = RETURNED_SQLSTATE

        EXCEPTION 
            WHEN SQLSTATE errcode THEN 
            RAISE EXCEPTION fun_errcode(errcode);
            
            WHEN others THEN
            RAISE EXCEPTION 'HA OCURRIDO UN ERROR DESCONOCIDO';
    END;
$$

language plpgsql;