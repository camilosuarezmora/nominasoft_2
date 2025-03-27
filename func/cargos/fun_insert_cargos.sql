/*
    *********************************************************
    *   Función para insertar cargos                        *
    *   CREADOR: Camilo Suarez                              *
    *   FECHA: 21/03/2025                                   *
    *********************************************************
*/

--crea o reemplaza la funcion para insertar cargos, y va a devolver un dato varchar



-- siempre debe existir un return, en caso tal de que no devuelva nada se devuelve void
create or replace function fun_insert_cargos(wnom_cargo tab_cargos.nom_cargo%TYPE) RETURNS BOOLEAN AS
/*"wnom_cargo tab_cargos.nom_cargo%TYPE" significa que quiero que "wnom_cargo" actue (haga casting) como "nom_cargo" de la tabla "tab_cargos"*/

--$BODY$ indica que ahí empezará el cuerpo (lógica) de la función (SP)
$BODY$
    BEGIN
        /*logica que inserta en la "tab_cargos" un "id_cargo" autoincrementado y el nuevo nombre del cargo que se almacena en "wnom_cargo"*/
        INSERT INTO tab_cargos VALUES((
            SELECT COALESCE(MAX(id_cargo),0) + 1
            FROM tab_cargos), wnom_cargo
        );

        --validacioón del nom_cargo
        IF LENGHT(wnom_cargo) < 3 OR LENGHT(wnom_cargo) > 20 THEN
            RAISE EXCEPTION 'El nombre del cargo debe tener entre 3 y 20 caracteres';
            RETURN FALSE;
        END IF;

        --validación de la inserción
        IF FOUND THEN
            RAISE NOTICE 'ESOOOOO, se insertó el % re bien',wnom_cargo;
            RETURN TRUE;
        ELSE
            RAISE NOTICE 'No se insertó una mondá';
            RETURN FALSE;
        END IF;
    END;
$BODY$

/*LANGUAGE indica el lenguaje en el que está escrito el cuerpo de la función porque en el motor POSTGREs se pueden escribir funciones en varios lenguajes*/
LANGUAGE PLPGSQL;