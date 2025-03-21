/*
    *********************************************************
    *   Función para insertar cargos                        *
    *   CREADOR: Camilo Suarez                              *
    *   FECHA: 06/03/2025                                   *
    *********************************************************
*/

--crea o reemplaza la funcion para insertar cargos, y va a devolver un dato varchar
-- siempre debe existir un return, en caso tal de que no devuelva nada se devuelve void
create or replace function fun_insert_cargos(wnom_cargo tab_cargos.nom_cargo%TYPE) RETURNS VARCHAR AS
                                                        /*wnom_cargo tab_cargos.nom_cargo%TYPE significa que quiero que "wnom_cargo" actue como "nom_cargo" de la tabla "tab_cargos"*/
--$BODY$ indica que ahí empezará el cuerpo (lógica) de la función (SP)
$BODY$
    BEGIN
        INSERT INTO tab_cargos VALUES(
            SELECT COALESCE(MAX(id_cargo),0) + 1
            FROM tab_cargos, wnom_cargo
        );
        IF FOUND THEN
            RETURN 'Cargo insertado correctamente';
        ELSE
            RETURN 'Error al insertar el cargo';
        END IF;
    END;
$BODY$

LANGUAGE PLPGSQL;