/*
===============================================
=   FUNCIÓN PARA ACTUALIZAR UN CARGO
=   camilo suárez 
=   22/03/2025
==============================================
*/

/*La función pide el nombre id del cargo a alterar y el nuevo nombre del cargo*/
CREATE OR REPLACE FUNCTION fun_update_cargos(wid_cargo tab_cargos.id_cargo%TYPE, new_nom_cargo tab_cargos.nom_cargo%TYPE) RETURNS VARCHAR AS
$$
    BEGIN
        UPDATE tab_cargos SET 
      	nom_cargo = new_nom_cargo
        WHERE id_cargo = wid_cargo;

		RETURN 'se actualizó';
/*
se debe optimizar la comprobación, aqu+i solo lo hice con el return

		IF nom_cargo != new_nom_cargo THEN
			RETURN 'se actualizó, ahora el nombre del cargo será %', new_nom_cargo;
		ELSE
			RETURN 'pipipipi, no se actualizó nada, pipipipi';
		END IF;
        --espacio para ponerle una excepción como el if de la "fun_insert_cargos"
*/
        

    END;
$$


LANGUAGE PLPGSQL;