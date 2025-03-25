/*
===============================
consola para probar todos los querys y esa vuelta
===============================
*/


--TABLA CARGOS

/*
para probar el fun_insert_cargos()
	SELECT fun_insert_cargos('developer');
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

/*
Prueba delete:
SELECT fun_delete_conceptos(4);
*/
--SELECT * FROM tab_conceptos;





--TABLA PMTROS
/*
insert:
select fun_insert_pmtros('MAYASOFT','Q',1420000,200000,2,2025,1,12,30);
*/

/*
UPDATE:
select fun_update_pmtros(2,'FC actualizada','Q',1420000,200000,2,2025,1,12,30);
*/

/*
DELETE
select fun_delete_pmtros(2);
*/
--select * from tab_pmtros;






--tab_emplea
/*
insert:
SELECT fun_insert_emplea('jhon','doe',false,'alabama av 58',123456789,3,0,0,'U-',58,1,42000000,'2007-03-25');
*/

/*update
SELECT fun_update_emplea(1,'camilo serio','suarez m',TRUE,'cra 30 # 14-08',3188477656,3,0,0,'O+',17,1,700000,'2025-03-25');

/*
DELETE

*/
*/

select * from tab_emplea;




--tab_novedades falta por probar porque no se ha creado la tab_emplea
/*
INSERT
SELECT fun_insert_novedades(2025,3,1,1,1,17,4500000)
*/
--select * from tab_novedades;