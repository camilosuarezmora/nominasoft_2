--SELECT fun_act_nomina(2025,1,1);
CREATE OR REPLACE FUNCTION fun_act_nomina(wano_nomina tab_nomina.ano_nomina%TYPE,wmes_nomina tab_nomina.mes_nomina%TYPE,
                                          wper_nomina tab_nomina.per_nomina%TYPE) RETURNS BOOLEAN AS
$$
    DECLARE wreg_pmtros     RECORD;
    DECLARE wcur_emplea     REFCURSOR;
    DECLARE wreg_emplea     RECORD;
    DECLARE wcur_concep     REFCURSOR;
    DECLARE wreg_concep     RECORD;
    DECLARE wcur_noveda     REFCURSOR;
    DECLARE wreg_noveda     RECORD;
    DECLARE wquery_empl     VARCHAR;
    DECLARE wquery_conc     VARCHAR;
    DECLARE wsum_devengado  tab_nomina.val_nomina%TYPE;
    DECLARE wsum_deducido   tab_nomina.val_nomina%TYPE;
    DECLARE wval_netopagado tab_nomina.val_nomina%TYPE;
    DECLARE wval_dias       tab_pmtros.num_diasmes%TYPE;
    
    BEGIN
-- TRAEMOS LA DATA DE LA TABLA DE PARÁMETROS PORQUE ES NECESARIO Y OBLIGATORIO
        SELECT a.id_empresa,a.nom_empresa,a.ind_perio_pago,a.val_smlv,a.val_auxtrans,a.ind_num_trans,a.ano_nomina,
               a.mes_nomina,a.num_diasmes,a.id_concep_sb,a.id_concep_at INTO wreg_pmtros FROM tab_pmtros a;
        RAISE NOTICE '% % % % % % % % %',wreg_pmtros.id_empresa,wreg_pmtros.nom_empresa,wreg_pmtros.ind_perio_pago,
                                         wreg_pmtros.val_smlv,wreg_pmtros.val_auxtrans,wreg_pmtros.ind_num_trans,
                                         wreg_pmtros.ano_nomina,wreg_pmtros.mes_nomina,wreg_pmtros.num_diasmes;

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
        wquery_empl = 'SELECT a.id_emplea,a.nom_emplea,a.ape_emplea,a.val_sal_basico FROM tab_emplea a';
        wquery_conc = 'SELECT a.id_concepto,a.nom_concepto,a.ind_operacion,a.val_porcent,a.val_fijo FROM tab_conceptos a WHERE a.neto_pagado = FALSE AND a.ind_legal = TRUE';
        OPEN wcur_emplea FOR EXECUTE wquery_empl;
			FETCH wcur_emplea INTO wreg_emplea;
            WHILE FOUND LOOP
--			    RAISE NOTICE '% % % %',wreg_emplea.id_emplea,wreg_emplea.nom_emplea,wreg_emplea.ape_emplea,wreg_emplea.val_sal_basico;
-- ACÁ EMPEZAMOS A RECORRER LA TABLA DE CONCEPTOS PARA LIQUIDAR LA NÓMINA, UNO A UNO...
                wsum_devengado  = 0;
                wsum_deducido   = 0;
                wval_netopagado = 0;
                OPEN wcur_concep FOR EXECUTE wquery_conc;
                    FETCH wcur_concep INTO wreg_concep;
                    WHILE FOUND LOOP
--                        RAISE NOTICE '% % % % %',wreg_concep.id_concepto,wreg_concep.nom_concepto,wreg_concep.ind_operacion,
--                                          wreg_concep.val_porcent,wreg_concep.val_fijo;
                        IF wreg_concep.ind_operacion = TRUE THEN
                            IF wreg_concep.id_concepto = wreg_pmtros.id_concep_sb THEN
                                wsum_devengado = wsum_devengado + ((wreg_emplea.val_sal_basico / wreg_pmtros.num_diasmes) * wval_dias);
                                RAISE NOTICE 'Dias a pagar es % y el devengado va en:%',wval_dias,wsum_devengado;
                            END IF;
                            IF wreg_concep.id_concepto = wreg_pmtros.id_concep_at THEN
                                IF wreg_emplea.val_sal_basico <= (wreg_pmtros.val_smlv * wreg_pmtros.ind_num_trans) THEN
                                    wsum_devengado = wsum_devengado + wreg_pmtros.val_auxtrans;
                                    RAISE NOTICE 'Empleado: % Dias a pagar es %, Aux. Transp es % y el devengado va en:%',
                                                  wreg_emplea.id_emplea,wval_dias,wreg_pmtros.val_auxtrans,wsum_devengado;
                                END IF;
                            END IF;

                        ELSE
-- VOY ACÁ
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