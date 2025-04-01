--select * from tab_novedades;

/*
**********************************
    Script Creacion Del Modelo
    CREADOR: Camilo Suarez
    FECHA: 06/03/2025
**********************************
*/

-- SECCIÓN DE BORRADO DE TABLAS, PARA INICIAR EL PROCESO
DROP TABLE IF EXISTS tab_novedades;
DROP TABLE IF EXISTS tab_nomina;
DROP TABLE IF EXISTS tab_emplea;
DROP TABLE IF EXISTS tab_cargos;
DROP TABLE IF EXISTS tab_pmtros;
DROP TABLE IF EXISTS tab_meses;
DROP TABLE IF EXISTS tab_conceptos;



/*  _        _                                      _             */
/* | |_ __ _| |__     ___ ___  _ __   ___ ___ _ __ | |_ ___  ___  */
/* | __/ _` | '_ \   / __/ _ \| '_ \ / __/ _ \ '_ \| __/ _ \/ __| */
/* | || (_| | |_) | | (_| (_) | | | | (_|  __/ |_) | || (_) \__ \ */
/*  \__\__,_|_.__/___\___\___/|_| |_|\___\___| .__/ \__\___/|___/ */
/*              |_____|                      |_|                  */
-- select * from tab_conceptos;
/*tab_conceptos almacena los diferentes conceptos que se pueden aplicar a la nómina (devengados o deducidos y si informmación especifica)*/
CREATE TABLE IF NOT EXISTS tab_conceptos
(
    id_concepto     DECIMAL(2)      NOT NULL,
    nom_concepto    VARCHAR         NOT NULL CHECK(LENGTH(nom_concepto)>=5),
    ind_operacion   BOOLEAN         NOT NULL, -- TRUE SUMA / FALSE RESTA  
    ind_perio_pago  CHAR(1)         NOT NULL DEFAULT 'Q' CHECK(ind_perio_pago = 'Q' OR ind_perio_pago = 'M'), -- Q QUINCENA /M MENSUAL
    neto_pagado     BOOLEAN         NOT NULL DEFAULT FALSE, --TRUE si equivale al NETO PAGADO / FALSE NO equivale al NETO PAGADO
    val_porcent     DECIMAL(3,0)    NOT NULL CHECK(val_porcent >= 0), -- Por si el concepto se aplica con un porcentaje. Si es 0 no aplica.
    val_fijo        DECIMAL(8,0)    NOT NULL CHECK(val_fijo >= 0), -- Por si el conbcepto debe llegar un valor fijo permanente. Puede cambiarlo el usuario
    ind_legal       BOOLEAN         NOT NULL, --TRUE OBLIGATORIO / FALSE NO OBLIGATORIO
    PRIMARY KEY (id_concepto)
);

--DATOS PA LLENAR
/*
--devengados obligatorios
INSERT INTO tab_conceptos VALUES(1, 'Salario Básico',                    TRUE,   'Q',    FALSE,  0,      0,      TRUE);
INSERT INTO tab_conceptos VALUES(2, 'Auxilio de Transporte',             TRUE,   'Q',    FALSE,  0,      0,      TRUE);

--deducciones obligatorias
INSERT INTO tab_conceptos VALUES(3, 'Entidad Prestadora de Salud (EPS)', FALSE,  'M',    FALSE,  4,      0,      TRUE);
INSERT INTO tab_conceptos VALUES(4, 'Administradora de Pensión (AFP)',   FALSE,  'M',    FALSE,  4,      0,      TRUE);

--que putas es esto?
INSERT INTO tab_conceptos VALUES(5, 'NETO PAGADO',                       FALSE,  'Q',    TRUE,   0,      0,      TRUE);

--devengados no obligatorios
INSERT INTO tab_conceptos VALUES(6, 'Bonificación por chismoso',         TRUE,   'M',    FALSE,  0,      100000, FALSE);
INSERT INTO tab_conceptos VALUES(7, 'Horas Extras Diurnas',              TRUE,   'Q',    FALSE,  25,     0,      FALSE);
INSERT INTO tab_conceptos VALUES(8, 'Horas Extras Nocturna',             TRUE,   'Q',    FALSE,  75,     0,      FALSE);
INSERT INTO tab_conceptos VALUES(9, 'Horas Extras Festivas Diurnas',     TRUE,   'Q',    FALSE,  100,    0,      FALSE);
INSERT INTO tab_conceptos VALUES(10,'Horas Extras Fetivas Nocturnas',    TRUE,   'Q',    FALSE,  150,    0,      FALSE);

--que putas es  esto la secuela
INSERT INTO tab_conceptos VALUES(11,'Descuento por Préstamo',            FALSE,  'M',    FALSE,  10,     0,      FALSE);

*/





/*  _        _                                      */
/* | |_ __ _| |__     ___ __ _ _ __ __ _  ___  ___  */
/* | __/ _` | '_ \   / __/ _` | '__/ _` |/ _ \/ __| */
/* | || (_| | |_) | | (_| (_| | | | (_| | (_) \__ \ */
/*  \__\__,_|_.__/___\___\__,_|_|  \__, |\___/|___/ */
/*              |_____|            |___/            */
-- select * from tab_cargos;
/*tab_cargos almacena los diferentes roles de los trabajadores en la empresa*/
CREATE TABLE IF NOT EXISTS tab_cargos
(
    id_cargo        DECIMAL(2,0)    NOT NULL,
    nom_cargo       VARCHAR         NOT NULL    CHECK(LENGTH(nom_cargo)>=5),     --el nombre del cargo debe ser mayor a 3 caracteres
    PRIMARY KEY(id_cargo)
);

/*
INSERT INTO tab_cargos VALUES(  1,      'Gerente General');
INSERT INTO tab_cargos VALUES(  2,      'Secretaria General');
INSERT INTO tab_cargos VALUES(  3,      'Gerente Comercial');
INSERT INTO tab_cargos VALUES(  4,      'Gerente Financiero');
INSERT INTO tab_cargos VALUES(  5,      'Gerente de TI');
INSERT INTO tab_cargos VALUES(  6,      'Gerente de Mercadeo');
INSERT INTO tab_cargos VALUES(  7,      'Director de Seguridad de la Información');
INSERT INTO tab_cargos VALUES(  8,      'Scrum Master');
INSERT INTO tab_cargos VALUES(  9,      'Desarrollador Front Senior');
INSERT INTO tab_cargos VALUES(  10,     'Desarrollador Front Junior');
INSERT INTO tab_cargos VALUES(  11,     'Desarrollador Back Senior');
INSERT INTO tab_cargos VALUES(  12,     'Desarrollador Back Junior');
INSERT INTO tab_cargos VALUES(  13,     'Diseñador');
INSERT INTO tab_cargos VALUES(  14,     'Tester');
INSERT INTO tab_cargos VALUES(  15,     'Documentador');
INSERT INTO tab_cargos VALUES(  16,     'Servicios Generales');
INSERT INTO tab_cargos VALUES(  17,     'Mensajero');
INSERT INTO tab_cargos VALUES(  18,     'Auxiliar Contable');
INSERT INTO tab_cargos VALUES(  19,     'Director Contable');
INSERT INTO tab_cargos VALUES(  20,     'Vigilante');
*/





/*  _        _                                       */
/* | |_ __ _| |__     _ __ ___   ___  ___  ___  ___  */
/* | __/ _` | '_ \   | '_ ` _ \ / _ \/ __|/ _ \/ __| */
/* | || (_| | |_) |  | | | | | |  __/\__ \  __/\__ \ */
/*  \__\__,_|_.__/___|_| |_| |_|\___||___/\___||___/ */
/*              |_____|                              */
-- select * from tab_meses;
/*información sobre los meses (id y nombre)*/
CREATE TABLE IF NOT EXISTS tab_meses
(
    id_mes          DECIMAL(2,0)    NOT NULL    CHECK(id_mes >= 1 AND id_mes <= 12), --numero único que identifica cada més
    nom_mes         VARCHAR         NOT NULL    CHECK(LENGTH(nom_mes) >= 4), --nombre del mes
    PRIMARY KEY(id_mes)
);

/*
/*Llena tabla meses*/
INSERT INTO tab_meses VALUES(   1,      'Enero');
INSERT INTO tab_meses VALUES(   2,      'febrero');
INSERT INTO tab_meses VALUES(   3,      'Marzo');
INSERT INTO tab_meses VALUES(   4,      'Abril');
INSERT INTO tab_meses VALUES(   5,      'Mayo');
INSERT INTO tab_meses VALUES(   6,      'junio');
INSERT INTO tab_meses VALUES(   7,      'Julio');
INSERT INTO tab_meses VALUES(   8,      'Agosto');
INSERT INTO tab_meses VALUES(   9,      'Septiembre');
INSERT INTO tab_meses VALUES(   10,     'Octubre');
INSERT INTO tab_meses VALUES(   11,     'Noviembre');
INSERT INTO tab_meses VALUES(   12,     'Diciembre');
*/





/*  _        _                         _                  */
/* | |_ __ _| |__      _ __  _ __ ___ | |_ _ __ ___  ___  */
/* | __/ _` | '_ \    | '_ \| '_ ` _ \| __| '__/ _ \/ __| */
/* | || (_| | |_) |   | |_) | | | | | | |_| | | (_) \__ \ */
/*  \__\__,_|_.__/____| .__/|_| |_| |_|\__|_|  \___/|___/ */
/*              |_____|_|                                 */
-- select * from tab_pmtros;
CREATE TABLE IF NOT EXISTS tab_pmtros
(
    id_empresa      DECIMAL(10,0)   NOT NULL, -- ID de la empresa que liquida la nómina
    nom_empresa     VARCHAR         NOT NULL                    CHECK(LENGTH(nom_empresa) >= 5), -- Nombre de la empresa que liquida la nómina
    ind_perio_pago  CHAR(1)         NOT NULL    DEFAULT 'Q'     CHECK(ind_perio_pago = 'Q' OR ind_perio_pago = 'M'), --Q QUINCENAL /M MENSUAL
    val_smlv        DECIMAL(8,0)    NOT NULL                    CHECK(val_smlv > 0), -- Valor del salario mínimo legal vigente para el año según gobierno
    val_auxtrans    DECIMAL (7,0)   NOT NULL                    CHECK(val_auxtrans > 0 AND val_auxtrans < val_smlv), -- Vr. Aux. Transporte vigente para el año según gobierno
    ind_num_trans   DECIMAL(1)      NOT NULL    DEFAULT 2       CHECK(ind_num_trans > 0 AND ind_num_trans < 4), --NÚM. PARA MULTIPLICAR EL SALARAIO, PARA SABER SI PAGAMOS AUXILIO DE TRANSPORTE O NO 
    ano_nomina      DECIMAL(4,0)    NOT NULL    DEFAULT 2025, --AÑO VIGENTE
    mes_nomina      DECIMAL(2)      NOT NULL                    CHECK(mes_nomina >= 1 AND mes_nomina <= 12), --MES VIGENTE
    val_por_intces  DECIMAL(2,0)    NOT NULL    DEFAULT 12, -- Vr. porcentaje de intereses a la cesantía
    num_diasmes     DECIMAL(2,0)    NOT NULL    DEFAULT 30, -- Número de días del mes fiscal
    id_concep_sb    DECIMAL(2,0)    NOT NULL, -- FK para identificar si el concepto es el de salario básico
    id_concep_at    DECIMAL(2,0)    NOT NULL, -- FK para identificar si el concepto es el de auxilio de transporte



    PRIMARY KEY(id_empresa),
    FOREIGN KEY(mes_nomina)    REFERENCES tab_meses(id_mes)    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_concep_sb) REFERENCES tab_conceptos(id_concepto) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_concep_at) REFERENCES tab_conceptos(id_concepto) ON DELETE CASCADE ON UPDATE CASCADE
);

/*
INSERT INTO tab_pmtros VALUES(123456,'EMPRESA LA COSITA RICA','Q',1423500,200000,2,2025,1,12,30,1,2);
*/





/*  _        _                            _             */
/* | |_ __ _| |__     ___ _ __ ___  _ __ | | ___  __ _  */
/* | __/ _` | '_ \   / _ \ '_ ` _ \| '_ \| |/ _ \/ _` | */
/* | || (_| | |_) | |  __/ | | | | | |_) | |  __/ (_| | */
/*  \__\__,_|_.__/___\___|_| |_| |_| .__/|_|\___|\__,_| */
/*              |_____|            |_|                  */
-- select * from tab_emplea;
/* tab_emplea almacena toda la información de los empleados (trabajadores) */
CREATE TABLE IF NOT EXISTS tab_emplea
(
-- DATOS BÁSICOS DEL EMPLEADO
    id_emplea       DECIMAL(10)     NOT NULL,
    nom_emplea      VARCHAR         NOT NULL    CHECK (TRIM(nom_emplea) != '' AND LENGTH(nom_emplea)>=3), --el nombre debe ser mayor a 1 caracter
    ape_emplea      VARCHAR         NOT NULL    CHECK (TRIM(ape_emplea) != '' AND LENGTH(ape_emplea)>=2), --el apellido debe ser mayor a 1 caracter
    ind_genero      BOOLEAN         NOT NULL, -- TRUE = FEMENINO / FALSE = MASCULINO
    dir_emplea      VARCHAR         NOT NULL    CHECK (TRIM(dir_emplea) != '' AND LENGTH(dir_emplea)>=5), --la dirección debe ser mayor a 1 caracter,
    tel_emplea      DECIMAL(10,0)   NOT NULL    CHECK(tel_emplea = FLOOR(tel_emplea)), --el teléfono debe ser un número positivo
    ind_estrato     DECIMAL(1)      NOT NULL    CHECK(ind_estrato BETWEEN 1 AND 6),

-- DATOS PERSONALES
    ind_est_civil   DECIMAL(1)      NOT NULL    CHECK(ind_est_civil BETWEEN 0 AND 4), -- 0:Soltero / 1:Casado / 2:Divorciado / 3:Viudo / 4:Otro
    num_hijos       DECIMAL(1,0)    NOT NULL    CHECK(num_hijos >= 0 AND num_hijos = FLOOR(num_hijos)), --número de hijos
    val_tipo_sangre VARCHAR         NOT NULL,

/*se debería calcular la edad del empleado en vez de decirlo directamente*/
    val_edad        DECIMAL(2,0)    NOT NULL    CHECK(val_edad >= 16),
-- DATOS LABORALES
    id_cargo        DECIMAL(2,0)    NOT NULL, --FK de la taqbla cargos
    val_sal_basico  DECIMAL(8)      NOT NULL    CHECK(val_sal_basico >= 0), --salario básico del empleado
    fec_ingreso     DATE            NOT NULL,
    PRIMARY KEY(id_emplea),
    FOREIGN KEY(id_cargo)   REFERENCES tab_cargos(id_cargo) ON DELETE CASCADE ON UPDATE CASCADE
);


-- /*Llena tabla*/
/*
INSERT INTO tab_emplea VALUES(91423627,     'Carlos Eduardo',   'Perez Rueda',          FALSE,      'Calle 20',                 3503421739,4,0,3,'A+',61,5, 10000000,   '2024-01-01');
INSERT INTO tab_emplea VALUES(1032505813,   'Laura Juliana',    'Perez Barrera',        TRUE,       'Calle 138 Carrera 54',     3102454737,5,0,0,'A+',25,3, 8000000,    '2024-10-01');
INSERT INTO tab_emplea VALUES(1014182933,   'Maria camila',     'Perez Barrera',        TRUE,       'San Agustin de Guadalix',  3122241234,5,1,1,'O+',27,4, 8500000,    '2024-02-01');
INSERT INTO tab_emplea VALUES(1067062169,   'Paula Sofia',      'Perez Moscoso',        TRUE,       'Arboretto Piedecuesta',    3133216625,4,0,0,'O+',16,8, 6500000,    '2024-01-01');
INSERT INTO tab_emplea VALUES(1015000000,   'Carlos Chaparro',  'Perez Moscoso',        FALSE,      'Girón',                    3102222222,4,0,0,'O+',40,9, 6000000,    '2024-01-01');
INSERT INTO tab_emplea VALUES(1015000001,   'Esteban Francisco','Janiot Rivera',        FALSE,      'Avda. Q. Seca San Alonso', 3103333333,4,0,1,'O+',26,9, 6000000,    '2024-01-01');
INSERT INTO tab_emplea VALUES(1015000002,   'Juan Pablo',       'Lopez Bobito',         FALSE,      'Piedecuesta',              3104444444,4,0,1,'A+',18,12,5000000,    '2024-01-01');
INSERT INTO tab_emplea VALUES(1015000003,   'Joan',             'Portilla',             FALSE,      'Piedecuesta Molino',       3105555555,4,0,1,'A-',18,9, 5500000,    '2024-01-01');
INSERT INTO tab_emplea VALUES(1015000004,   'Juana',            'La Loca',              TRUE,       'Calle 28 Cra. 18',         3106666666,3,0,3,'A-',25,16,2500000,    '2024-01-01');
INSERT INTO tab_emplea VALUES(1015000005,   'Pedro',            'El Escamoso',          FALSE,      'Lebrija',                  3107777777,3,0,2,'A+',35,20,2000000,    '2024-01-01');
INSERT INTO tab_emplea VALUES(1015000006,   'Juanito',          'Alimaña',              FALSE,      'Piedecuesta Barro Blanco', 3108888888,2,0,4,'O-',40,20,2000000,    '2024-01-01');
INSERT INTO tab_emplea VALUES(1015000007,   'Yoshitomo',        'Cacaito',              FALSE,      'Rionegro',                 3109999999,2,0,5,'A+',28,16,2500000,    '2024-01-01');
INSERT INTO tab_emplea VALUES(1015000008,   'Yessenya Vanessa', 'Sanabria de Janiot',   TRUE,       'San Miguel Casa 20',       3111111111,3,0,1,'A-',25,13,4500000,    '2024-01-01');

*/

/*Indices del emplea(do) xq sí*/
-- CREATE INDEX idx_nom_emplea      ON tab_emplea(nom_emplea);
-- CREATE INDEX idx_ape_emplea      ON tab_emplea(ape_emplea);
-- CREATE INDEX idx_ind_estrato     ON tab_emplea(ind_estrato);
-- CREATE INDEX idx_val_tipo_sangre ON tab_emplea(val_tipo_sangre);










/*  _        _                                 _           _            */
/* | |_ __ _| |__     _ __   _____   _____  __| | __ _  __| | ___  ___  */
/* | __/ _` | '_ \   | '_ \ / _ \ \ / / _ \/ _` |/ _` |/ _` |/ _ \/ __| */
/* | || (_| | |_) |  | | | | (_) \ V /  __/ (_| | (_| | (_| |  __/\__ \ */
/*  \__\__,_|_.__/___|_| |_|\___/ \_/ \___|\__,_|\__,_|\__,_|\___||___/ */
/*              |_____|                                                 */
-- select * from tab_novedades;
/*novedades en la nomina, cambios o ajustes que se le hacen a la nomina*/
CREATE TABLE IF NOT EXISTS tab_novedades
(
--PKs
    ano_nomina		DECIMAL(4,0)    NOT NULL, --año actual
    mes_nomina		DECIMAL(2)      NOT NULL, --mes actual
    per_nomina		DECIMAL(1)      NOT NULL, --QUINCENAL O MENSUIAL
    id_emplea		DECIMAL(10)     NOT NULL, --FK para identificar un empleado
    id_concepto		DECIMAL(2)      NOT NULL, --FK para saber a que concepto viene relacionada la novedad

    val_dias_trab  	DECIMAL(2)      NOT NULL 	CHECK(val_dias_trab >= 1 AND val_dias_trab <= 30), 
    val_horas_trab 	DECIMAL(2)   	NOT NULL 	CHECK(val_horas_trab >= 1 AND val_horas_trab <= 24),
    PRIMARY KEY(ano_nomina,mes_nomina,per_nomina,id_emplea,id_concepto),
    FOREIGN KEY(id_emplea)      REFERENCES tab_emplea(id_emplea)        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_concepto)    REFERENCES tab_conceptos(id_concepto)   ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(mes_nomina)     REFERENCES tab_meses(id_mes)            ON DELETE CASCADE ON UPDATE CASCADE
);

/*
-- NOVEDADES PARA ENERO QUINCENA 1
INSERT INTO tab_novedades VALUES(2025,  1,  1,  91423627,     6,  15, 1);
INSERT INTO tab_novedades VALUES(2025,  1,  1,  1032505813,   6,  15, 1);
INSERT INTO tab_novedades VALUES(2025,  1,  1,  1067062169,   6,  15, 1);
INSERT INTO tab_novedades VALUES(2025,  1,  1,  1015000000,   7,  15, 5);
INSERT INTO tab_novedades VALUES(2025,  1,  1,  1015000001,   9,  15, 10);
INSERT INTO tab_novedades VALUES(2025,  1,  1,  1015000004,   6,  15, 1);
INSERT INTO tab_novedades VALUES(2025,  1,  1,  1015000004,   10, 15, 10);
*/






/*  _        _                              _              */
/* | |_ __ _| |__     _ __   ___  _ __ ___ (_)_ __   __ _  */
/* | __/ _` | '_ \   | '_ \ / _ \| '_ ` _ \| | '_ \ / _` | */
/* | || (_| | |_) |  | | | | (_) | | | | | | | | | | (_| | */
/*  \__\__,_|_.__/___|_| |_|\___/|_| |_| |_|_|_| |_|\__,_| */
/*              |_____|                                    */
-- select * from tab_nomina;
/*resultado de la nomina, recopilación del resto de información en un solo documento de nomina*/
CREATE TABLE IF NOT EXISTS tab_nomina
(
    ano_nomina      DECIMAL(4,0)    NOT NULL, --numero del año actual
    mes_nomina      DECIMAL(2)      NOT NULL, --mes en la que se está haciendo la nomina 
    per_nomina      DECIMAL(1)      NOT NULL, --periodo de la nomina
    id_emplea       DECIMAL(10)     NOT NULL, --FK que referencia al empleado al que se le hace la nomina
    id_concepto     DECIMAL(2)      NOT NULL, --Fk que especifica los detalles legales y económicos 
    val_dias_trab   DECIMAL(2)      NOT NULL    CHECK(val_dias_trab BETWEEN 1 AND 30), --cantidad de días habiles trabajados
    val_nomina      DECIMAL(8)      NOT NULL    CHECK (val_nomina >= 0), --valor final y total de la nomina
    PRIMARY KEY(ano_nomina,mes_nomina,per_nomina,id_emplea,id_concepto),
    FOREIGN KEY(id_emplea)      REFERENCES tab_emplea(id_emplea)        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_concepto)    REFERENCES tab_conceptos(id_concepto)   ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(mes_nomina)        REFERENCES tab_meses(id_mes)        ON DELETE CASCADE ON UPDATE CASCADE
);