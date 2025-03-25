--SELECT fun_listar_emplea(91423627,1000000000);
CREATE OR REPLACE FUNCTION fun_listar_emplea(wid_emplea tab_emplea.id_emplea%TYPE,
											  wwid_emplea tab_emplea.id_emplea%TYPE) RETURNS BOOLEAN AS
$$
	DECLARE wreg_emplea	RECORD;
	
    BEGIN
		IF wid_emplea < 11111111 THEN
			RAISE NOTICE 'Don´t be brutation... Go back to the elementary school, asshole';
			RETURN FALSE;
		END IF;
		SELECT a.id_emplea,a.nom_emplea,a.ape_emplea,a.ind_genero,a.dir_emplea,a.tel_emplea,ind_estrato,
			   a.ind_est_civil,a.num_hijos,a.val_tipo_sangre,a.val_edad,a.id_cargo,b.nom_cargo,
			   a.val_sal_basico,a.fec_ingreso
		INTO wreg_emplea FROM tab_emplea a,tab_cargos b
		WHERE (a.id_emplea BETWEEN wid_emplea AND wwid_emplea) AND
		 	  a.id_cargo = b.id_cargo;
		IF FOUND THEN
			RAISE NOTICE '%,%,%,%,%,%,%,%,%,%,%,%,%,%,%',wreg_emplea.id_emplea,wreg_emplea.nom_emplea,
			wreg_emplea.ape_emplea,wreg_emplea.ind_genero,wreg_emplea.dir_emplea,wreg_emplea.tel_emplea,
			wreg_emplea.ind_estrato,wreg_emplea.ind_est_civil,wreg_emplea.num_hijos,wreg_emplea.val_tipo_sangre,
			wreg_emplea.val_edad,wreg_emplea.id_cargo,wreg_emplea.nom_cargo,wreg_emplea.val_sal_basico,
			wreg_emplea.fec_ingreso;
		END IF;
		RETURN TRUE;
    END;
$$
LANGUAGE PLPGSQL;