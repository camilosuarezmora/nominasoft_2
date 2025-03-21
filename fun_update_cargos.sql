/*FUNCIÓN PARA ACTUALIZAR UN CARGO*/

CREATE OR REPLACE FUNCTION fun_update_cargos(wnom_cargo tab_cargos.nom_cargo%TYPE) RETURNS VARCHAR AS
$$
    BEGIN
        UPDATE INTO tab_cargos VALUES((
            SELECT COALESCE(MAX(id_cargo),0) + 1
            FROM tab_cargos), wnom_cargo
        );
    END;
$$