/*
===============================================
=   FUNCIÓN PARA ACTUALIZAR UN CARGO
=   camilo suárez 
=   22/03/2025
==============================================
*/

/*La función pide el nombre id del cargo a alterar y el nuevo nombre del cargo*/
CREATE OR REPLACE FUNCTION fun_update_cargos(wid_cargo tab_cargos.id_cargo%TYPE, new_nom_cargo tab_cargos.nom_cargo%TYPE) RETURNS BOOLEAN AS
$$
    BEGIN

	--lógica
        UPDATE tab_cargos SET 
      	nom_cargo = new_nom_cargo
        WHERE id_cargo = wid_cargo;

	--VALIDACIONES
		IF FOUND THEN 
			RAISE NOTICE 'Se actualizó exitosamente';
			RETURN TRUE;
		ELSE 
			RAISE NOTICE 'No se pido actualizar'
			RETURN FALSE;

	--EXCEPCIONES
		EXCEPTION
	    WHEN SQLSTATE '23505' THEN
            RAISE NOTICE 'Está mandando un NULO en el ID... Sea serio';
		    RETURN FALSE;
		
		WHEN SQLSTATE '23514' THEN
            RAISE NOTICE 'El valor ingresado no cumple el check solicitado';
            RETURN FALSE;

		WHEN SQLSTATE '02000' THEN
            RAISE NOTICE 'el cargo con el id % no existe', wid_cargo;
            RETURN FALSE;
		
		WHEN SQLSTATE '23502' THEN 
            RAISE NOTICE 'Se intentó ingresar un valor nulo';
            RETURN FALSE;

		WHEN others THEN
            RAISE NOTICE 'Error desconocido al insertar el dato';
            RETURN FALSE;
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