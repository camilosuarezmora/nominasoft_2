/*
===============================
consola para probar todos los querys y esa vuelta
===============================
*/

--para probar el fun_insert_cargos()
/*
SELECT fun_insert_cargos('cargo de noob');
*/	

/*
Probar la lógica del update:
UPDATE tab_cargos SET 
    nom_cargo = 'cargo developer'
    WHERE id_cargo = 1
*/

/*
Probar el update de cargos:
SELECT fun_update_cargos (1,'cargo actualizado');
*/


select * from tab_cargos;

/*Probar fun_delete_cargo
SELECT fun_delete_cargos(1);
*/