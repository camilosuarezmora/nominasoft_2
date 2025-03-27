/*
    Por la fakin integridad referencial me toca hacer esto antes que la tab_novedades y tab_nomina xq al pareceer estar dos ultimas traen exactamente lo mismo 
==============================================================
    funcion para insertar empleados a la tab_emplea (TABLA PA LARGA MANO)
    camilo suarez 
    24/03/2024
==============================================================
*/

CREATE OR REPLACE FUNCTION fun_insert_emplea(
    wnom_emplea tab_emplea.nom_emplea%TYPE,
    wape_emplea tab_emplea.ape_emplea%TYPE,
    wind_genero tab_emplea.ind_genero%TYPE,
    wdir_emplea tab_emplea.dir_emplea%TYPE,
    wtel_emplea tab_emplea.tel_emplea%TYPE,
    wind_estrato tab_emplea.ind_estrato%TYPE,
    wind_est_civil tab_emplea.ind_est_civil%TYPE,
    wnum_hijos tab_emplea.num_hijos%TYPE,
    wval_tipo_sangre tab_emplea.val_tipo_sangre%TYPE,
    wval_edad tab_emplea.val_edad%TYPE,
    wid_cargo tab_emplea.id_cargo%TYPE,
    wval_sal_basico tab_emplea.val_sal_basico%TYPE,
    wfec_ingreso tab_emplea.fec_ingreso%TYPE
) RETURNS VOID AS
$$
    BEGIN
        INSERT INTO tab_emplea VALUES(
            (SELECT COALESCE(MAX(id_emplea),0)+1 FROM tab_emplea),
            wnom_emplea,
            wape_emplea,
            wind_genero,
            wdir_emplea,
            wtel_emplea,
            wind_estrato,
            wind_est_civil,
            wnum_hijos,
            wval_tipo_sangre,
            wval_edad,
            wid_cargo,
            wval_sal_basico,
            wfec_ingreso
        );
    END;
$$

LANGUAGE PLPGSQL;