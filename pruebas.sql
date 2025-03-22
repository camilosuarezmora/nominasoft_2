/*
===============================
consola para probar todos los querys y esa vuelta
===============================
*/

--para probar el fun_insert_cargos()
/*
SELECT fun_insert_cargos('cargo de super mega jefe pro');

*/	
select * from tab_cargos;

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