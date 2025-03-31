/*
========================================================
    toda la lógica bonita del programa se encuentra en esta función,
    es la uq ele va a decir al usuario la cantidad final de nomina y cuanto se le dió a cada empleado.
========================================================
*/



--SELECT fun_act_nomina(2025,1,1);
/*se inicia la función pidiendo el año, el mes y el periodo (M o Q) especifico del que se va a calcular la nomina*/
CREATE OR REPLACE FUNCTION fun_act_nomina(wano_nomina tab_nomina.ano_nomina%TYPE,wmes_nomina tab_nomina.mes_nomina%TYPE,
                                          wper_nomina tab_nomina.per_nomina%TYPE) RETURNS BOOLEAN AS
$$
    --record para almacenar la información de los parámetros
    DECLARE wreg_pmtros     RECORD;

    --cursor y record para manejar los datos del empleado y así poder iterar sobre cada uno
    DECLARE wcur_emplea     REFCURSOR;
    DECLARE wreg_emplea     RECORD;

    --cursor y record para manejar los datos del concepto y así poder iterar en base a la info del empleado
    DECLARE wcur_concep     REFCURSOR;
    DECLARE wreg_concep     RECORD;
    
    --cursor y record para la información de las novedades, que se iteraran después de calcular la nomina modelo
    DECLARE wcur_noveda     REFCURSOR;
    DECLARE wreg_noveda     RECORD;

    /*variable para almacenar la consulta que trae la información necesaria del empleado y no quemar código:
    SELECT a.id_emplea,a.nom_emplea,a.ape_emplea,a.val_sal_basico FROM tab_emplea a*/
    DECLARE wquery_empl     VARCHAR;

    /*variable para almacenar la consulta que trae la información necesaria del concepto  y no quemar código:
    SELECT a.id_concepto,a.nom_concepto,a.ind_operacion,a.val_porcent,a.val_fijo FROM tab_conceptos a WHERE a.neto_pagado = FALSE AND a.ind_legal = TRUE*/
    DECLARE wquery_conc     VARCHAR;

    --se declaran otras variables que vamos a utilizar en la lógica
    DECLARE wsum_devengado  tab_nomina.val_nomina%TYPE; --variable para almacenar el valor total de todos los devengados
    DECLARE wsum_deducido   tab_nomina.val_nomina%TYPE; --variable para almacenar el valor total de todos los deducidos
    DECLARE wval_netopagado tab_nomina.val_nomina%TYPE; -- ?? supongo que es para almacenar el valor que le corresponde a cada empleado 
    DECLARE wval_dias       tab_pmtros.num_diasmes%TYPE; --variable que almacena la cantidad de días del periodo,  15 si es Q - 30 si es M
    DECLARE wval_salario    tab_nomina.val_nomina%TYPE; 
    DECLARE wval_trans      tab_nomina.val_nomina%TYPE;
    DECLARE wval_concepto   tab_nomina.val_nomina%TYPE;


    BEGIN
-- TRAEMOS LA DATA DE LA TABLA DE PARÁMETROS PORQUE ES NECESARIO Y OBLIGATORIO
        SELECT a.id_empresa,a.nom_empresa,a.ind_perio_pago,a.val_smlv,a.val_auxtrans,a.ind_num_trans,a.ano_nomina,
               a.mes_nomina,a.num_diasmes,a.id_concep_sb,a.id_concep_at INTO wreg_pmtros FROM tab_pmtros a;
--        RAISE NOTICE '% % % % % % % % % % %',wreg_pmtros.id_empresa,wreg_pmtros.nom_empresa,wreg_pmtros.ind_perio_pago,wreg_pmtros.val_smlv,wreg_pmtros.val_auxtrans,wreg_pmtros.ind_num_trans,wreg_pmtros.ano_nomina,wreg_pmtros.mes_nomina,wreg_pmtros.num_diasmes,wreg_pmtros.id_concep_sb,wreg_pmtros.id_concep_at;

-- VALIDAMOS LAS ENTRADAS PARA QUE N HAYAN GOLES DESPUÉS
		IF wano_nomina <> wreg_pmtros.ano_nomina THEN
            RAISE EXCEPTION USING ERRCODE = 22008;
        END IF;
		IF wmes_nomina <> wreg_pmtros.mes_nomina THEN
            RAISE EXCEPTION USING ERRCODE = 22008;
        END IF;
		IF wper_nomina > 2 THEN
            RAISE EXCEPTION USING ERRCODE = 22008;
        END IF;

        IF wreg_pmtros.ind_perio_pago = 'Q' THEN
            wval_dias = wreg_pmtros.num_diasmes / 2;
        ELSE
            wval_dias = wreg_pmtros.num_diasmes;
        END IF;

-- EMPIEZA EL BAILE ACÁ
        --declara las querys necesarias
        wquery_empl =   'SELECT a.id_emplea,a.nom_emplea,a.ape_emplea,a.val_sal_basico FROM tab_emplea a';
        wquery_conc =   'SELECT a.id_concepto,a.nom_concepto,a.ind_operacion,a.val_porcent,a.val_fijo 
                        FROM tab_conceptos a 
                        WHERE a.neto_pagado = FALSE AND a.ind_legal = TRUE';
        
-- BORRAMOS LA NÓMINA DEL PERÍODO QUE SE VA A EJECUTAR para que se reinvente cada vez;
        DELETE FROM tab_nomina
        WHERE ano_nomina = wano_nomina AND
              mes_nomina = wmes_nomina AND
              per_nomina = wper_nomina;
        IF NOT FOUND THEN
	        RAISE Notice 'No hay registros... Seguimos en la fiesta';
        END IF;  

        --se abre el primer cursor para iterar sobre los empleados
        OPEN wcur_emplea FOR EXECUTE wquery_empl;
			FETCH wcur_emplea INTO wreg_emplea;
            WHILE FOUND LOOP
--			    RAISE NOTICE '% % % %',wreg_emplea.id_emplea,wreg_emplea.nom_emplea,wreg_emplea.ape_emplea,wreg_emplea.val_sal_basico;

-- ACÁ EMPEZAMOS A RECORRER LA TABLA DE CONCEPTOS PARA LIQUIDAR LA NÓMINA, UNO A UNO...
                wsum_devengado  = 0;
                wsum_deducido   = 0;
                wval_netopagado = 0;
                
                --se abre el segundo cursor para iterar cada concepto por empleado
                OPEN wcur_concep FOR EXECUTE wquery_conc;
                    FETCH wcur_concep INTO wreg_concep;
                    WHILE FOUND LOOP
                       --RAISE NOTICE '% % % % %',wreg_concep.id_concepto,wreg_concep.nom_concepto,wreg_concep.ind_operacion,wreg_concep.val_porcent,wreg_concep.val_fijo;

                    --validar la cantidad de días a pagar según el periodo    
                       IF wreg_pmtros.ind_perio_pago = 'Q' THEN
                            wval_salario = wreg_emplea.val_sal_basico / 2;
                        ELSE
                            wval_salario = wreg_emplea.val_sal_basico;
                        END IF;

                        IF wreg_concep.ind_operacion = TRUE THEN
                            IF wreg_concep.id_concepto = wreg_pmtros.id_concep_sb THEN
                                wsum_devengado = wsum_devengado + ((wval_salario / wreg_pmtros.num_diasmes) * wval_dias);

                                RAISE NOTICE 'Dias a pagar es % y el devengado va en:%',wval_dias,wsum_devengado;

                                INSERT INTO tab_nomina VALUES(wano_nomina,wmes_nomina,wper_nomina,wreg_emplea.id_emplea,wreg_concep.id_concepto,wval_dias,wval_salario);

                                IF NOT FOUND THEN
			                  		RAISE EXCEPTION USING ERRCODE = 'P0001';
		                        END IF;
                            END IF;
                            IF wreg_concep.id_concepto = wreg_pmtros.id_concep_at THEN

                            /*************************************************************************/
                                IF wreg_emplea.val_sal_basico <= (wreg_pmtros.val_smlv * wreg_pmtros.ind_num_trans) THEN
                                    IF wreg_pmtros.ind_perio_pago = 'Q' THEN
                                        wval_trans = wreg_pmtros.val_auxtrans / 2;
                                    ELSE
                                        wval_trans = wreg_pmtros.val_auxtrans;
                                    END IF;

                                    --wsum_devengado = wsum_devengado + wreg_pmtros.val_auxtrans;

                                    RAISE NOTICE 'Empleado: % Dias a pagar es %, Aux. Transp es % y el devengado va en:%',wreg_emplea.id_emplea,wval_dias,wval_trans,wsum_devengado;

                                    INSERT INTO tab_nomina VALUES(wano_nomina,wmes_nomina,wper_nomina,wreg_emplea.id_emplea,wreg_concep.id_concepto,wval_dias,wval_trans);

                                    IF NOT FOUND THEN
			                  		    RAISE EXCEPTION USING ERRCODE = 'P0001';
		                            END IF; 
                                END IF;
                            END IF;
-- ACÁ VA EL RESTO DE CONCEPTOS QUE SUMAN Y NO SON OBLIGATORIOS (VIENEN DE NOVEDADES)...
                        ELSE
-- ACÁ VAN LOS CONCEPTOS QUE RESTAN A LA NÓMINA (DEDUCIDOS)
                    
                        IF wreg_concep.val_porcent <> 0 THEN
                                wval_concepto = (wreg_emplea.val_sal_basico * wreg_concep.val_porcent) / 100;
                                IF wreg_pmtros.ind_perio_pago = 'Q' THEN
                                    wval_concepto = wval_concepto / 2;
                                END IF;
                                INSERT INTO tab_nomina VALUES(wano_nomina,wmes_nomina,wper_nomina,wreg_emplea.id_emplea,
                                                              wreg_concep.id_concepto,wval_dias,wval_concepto);
                                IF NOT FOUND THEN
		                  		    RAISE EXCEPTION USING ERRCODE = 'P0001';
	                            END IF;
                                wsum_deducido = wsum_deducido + wval_concepto;
                            END IF;

                            IF wreg_concep.val_fijo <> 0 THEN
                                wval_concepto = (wreg_emplea.val_sal_basico + wreg_concep.val_fijo);
                                IF wreg_pmtros.ind_perio_pago = 'Q' THEN
                                    wval_concepto = wval_concepto / 2;
                                END IF;
                                INSERT INTO tab_nomina VALUES(wano_nomina,wmes_nomina,wper_nomina,wreg_emplea.id_emplea,
                                                              wreg_concep.id_concepto,wval_dias,wval_concepto);
                                IF NOT FOUND THEN
		                  		    RAISE EXCEPTION USING ERRCODE = 'P0001';
	                            END IF;
                                wsum_deducido = wsum_deducido + wval_concepto;
                            END IF;
                            
                        END IF;
                        FETCH wcur_concep INTO wreg_concep;
                    END LOOP;
                CLOSE wcur_concep;
-- HASTA ACÁ EMPEZAMOS VA EL RECORRIDO DE CONCEPTOS...
			    FETCH wcur_emplea INTO wreg_emplea;
            END LOOP;
		CLOSE wcur_emplea;
        RETURN TRUE;

-- VALIDACIÓN DE LAS EXCEPCIONES. VIENE DE LAS CONDICIONES DE ARRIBA
		EXCEPTION
            WHEN SQLSTATE '22008' THEN
                RAISE NOTICE 'El año, o el mes, o el período no corresponden al de PMTROS... Arréglelo Bestia';
				RETURN FALSE;

            WHEN SQLSTATE '23502' THEN
                RAISE NOTICE 'Está mandando un NULO en el ID... Sea serio';
				RETURN FALSE;

			WHEN SQLSTATE '23503' THEN  
                RAISE NOTICE 'El Cargo no existe... Créelo y vuelva, o ni se aparezca más por acá';
				RETURN FALSE;

			WHEN SQLSTATE '23505' THEN  
               RAISE NOTICE 'El registro ya existe.. Trabaje bien o ábrase llaveee';
				RETURN FALSE;

            WHEN SQLSTATE '22001' THEN  
                RAISE NOTICE 'El nombre es muy corto.. Es de su abuelita?';
				RETURN FALSE;

--			WHEN SQLSTATE 'P0001' THEN
--				ROLLBACK;
				
--			WHEN OTHERS THEN
--					RAISE NOTICE 'Esta vaina se totió.. Y no fue de la risa.. Déjeme trabajar';
--					RETURN FALSE;
    END;
$$
LANGUAGE PLPGSQL;