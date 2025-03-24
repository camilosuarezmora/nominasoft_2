/*
===============================
consola para probar todos los querys y esa vuelta
===============================
*/


--TABLA CARGOS

/*
para probar el fun_insert_cargos()
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



/*Probar fun_delete_cargo
SELECT fun_delete_cargos(1);
*/
--select * from tab_cargos;





--TABLA MESES

/*
func insert:
	SELECT fun_insert_meses('mayo');
*/

/*
funct delete:
	SELECT fun_delete_meses(1)
*/

/*
func update:
	SELECT fun_update_meses(4,'el mes del más lindo');
*/
--SELECT * FROM tab_meses;




--TABLA CONCEPTOS
/*
Prueba insert: 
SELECT fun_insert_conceptos('concepto3',FALSE,'Q',TRUE,0,1067625,TRUE);
*/
/*
Prueba update:
SELECT fun_update_conceptos(2, 'nombre cambiado del concepto 2',FALSE,'Q',TRUE,0,1067625,TRUE);
*/

SELECT * FROM tab_conceptos;

