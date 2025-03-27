/*
=============================================================================================================
    función para modificar la tabla emplea por si alguien es tan pendejo como escribir el nombre y el apellido en la sección de nombre 
    Camilo suárez 
    24/03/2025
=============================================================================================================
*/

CREATE OR REPLACE FUNCTION fun_update_emplea(
    wid_emplea tab_emplea.id_emplea%TYPE,
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
        UPDATE tab_emplea SET
            nom_emplea = wnom_emplea, 
            ape_emplea = wape_emplea, 
            ind_genero = wind_genero, 
            dir_emplea = wdir_emplea, 
            tel_emplea = wtel_emplea, 
            ind_estrato = wind_estrato, 
            ind_est_civil = wind_est_civil, 
            num_hijos = wnum_hijos, 
            val_tipo_sangre = wval_tipo_sangre, 
            val_edad = wval_edad, 
            id_cargo = wid_cargo, 
            val_sal_basico = wval_sal_basico, 
            fec_ingreso = wfec_ingreso 
        WHERE id_emplea = wid_emplea;
    END;
$$

LANGUAGE PLPGSQL;