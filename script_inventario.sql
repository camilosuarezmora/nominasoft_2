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
DROP TABLE IF EXISTS tab_conceptos;
DROP TABLE IF EXISTS tab_pmtros;
DROP TABLE IF EXISTS tab_meses;

-- SECCIÓN DE CREACIÓN DE TABLAS, PARA INICIAR EL PROCESO
CREATE TABLE IF NOT EXISTS tab_pmtros
(
    id_empresa      DECIMAL(10,0)   NOT NULL, -- ID de la empresa que liquida la nómina
    nom_empresa     VARCHAR         NOT NULL                    CHECK(LENGTH(nom_empresa) >= 5), -- Nombre de la empresa que liquida la nómina
    ind_perio_pago  CHAR(1)         NOT NULL    DEFAULT 'Q'     CHECK(ind_perio_pago = 'Q' OR ind_perio_pago = 'M'), --Q QUINCENAL /M MENSUAL
    val_smlv        DECIMAL(8,0)    NOT NULL                    CHECK(val_smlv > 0), -- Valor del salario mínimo legal vigente para el año según gobierno
    val_auxtrans    DECIMAL (7,0)   NOT NULL                    CHECK(val_auxtrans > 0 AND val_auxtrans < val_smlv), -- Vr. Aux. Transporte vigente para el año según gobierno
    ind_num_trans   DECIMAL(1)      NOT NULL    DEFAULT 2       CHECK(ind_num_trans > 0 AND ind_num_trans < 4), --NÚM. PARA MULTIPLICAR EL SALARAIO, PARA SABER SI PAGAMOS AUXILIO DE TRANSPORTE O NO 
    ano_nom         DECIMAL(4,0)    NOT NULL    DEFAULT 2025, --AÑO VIGENTE
    mes_nom         DECIMAL(2)      NOT NULL                    CHECK(mes_nom >= 1 AND mes_nom <= 12), --MES VIGENTE
    val_por_intces  DECIMAL(2,0)    NOT NULL    DEFAULT 12, -- Vr. porcentaje de intereses a la cesantía
    num_diasmes     DECIMAL(2,0)    NOT NULL    DEFAULT 30, -- Número de días del mes fiscal
    PRIMARY KEY(id_empresa) 
    FOREIGN KEY(mes_nom)    REFERENCES tab_meses(id_mes)    ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tab_pmtros VALUES(123456,'EMPRESA LA COSITA RICA','Q',1423500,200000,2,2025,1,12,30);





/*tab_cargos almacena los diferentes roles de los trabajadores en la empresa*/
CREATE TABLE IF NOT EXISTS tab_cargos
(
    id_cargo        DECIMAL(2,0)    NOT NULL,
    nom_cargo       VARCHAR         NOT NULL    CHECK(LENGTH(nom_cargo) BETWEEN 3 AND 20),     --el nombre del cargo debe ser mayor a 3 caracteres
    PRIMARY KEY(id_cargo)
);

/*inserciones de la tabla cargos*/
select fun_insert_cargos('Gerente General');
select fun_insert_cargos('Gerente de Ventas');
select fun_insert_cargos('Gerente de TI');
select fun_insert_cargos('Gerente de RRHH');
select fun_insert_cargos('Gerente comercial');
select fun_insert_cargos('Asistente de gerencia');
select fun_insert_cargos('Subgerente de Seguridad de la información (CISO)');
select fun_insert_cargos('Secretaría General');
select fun_insert_cargos('Webmaster');
select fun_insert_cargos('Desarrollador Senior');
select fun_insert_cargos('Desarrollador Junior');
select fun_insert_cargos('Tester');
select fun_insert_cargos('Documentador');
select fun_insert_cargos('Scrum Master');
select fun_insert_cargos('Diseñador');
select fun_insert_cargos('Vendedor');
select fun_insert_cargos('Quality Officer');
select fun_insert_cargos('Servicios Generales');
select fun_insert_cargos('Vigilante');
select fun_insert_cargos('Mensajero');

/* tab_emplea almacena toda la información de los empleados (trabajadores) */
CREATE TABLE IF NOT EXISTS tab_emplea
(
-- DATOS BÁSICOS DEL EMPLEADO
    id_emplea       DECIMAL(10)     NOT NULL,
    nom_emplea      VARCHAR         NOT NULL    CHECK (length(nom_emplea) >= 1 AND TRIM(nom_emplea) != '' AND LENGTH(nom_emplea)>=3), --el nombre debe ser mayor a 1 caracter
    ape_emplea      VARCHAR         NOT NULL    CHECK (length(ape_emplea) >= 1 AND TRIM(nom_emplea) != '' AND LENGTH(ape_emplea)>=2), --el apellido debe ser mayor a 1 caracter
    ind_genero      BOOLEAN         NOT NULL, -- TRUE = FEMENINO / FALSE = MASCULINO
    dir_emplea      VARCHAR         NOT NULL    CHECK (length(nom_emplea) >= 1 AND TRIM(nom_emplea) != '' AND LENGTH(nom_cargo)>=5), --la dirección debe ser mayor a 1 caracter,
    tel_emplea      DECIMAL(10,0)   NOT NULL    CHECK(tel_emplea = FLOOR(tel_emplea) AND ), --el teléfono debe ser un número positivo
    ind_estrato     DECIMAL(1)      NOT NULL    CHECK(ind_estrato BETWEEN 1 AND 6),

-- DATOS PERSONALES
    ind_est_civil   DECIMAL(1)      NOT NULL    CHECK(ind_est_civil BETWEEN 0 AND 4), -- 0:Soltero / 1:Casado / 2:Divorciado / 3:Viudo / 4:Otro
    num_hijos       DECIMAL(1,0)    NOT NULL    CHECK(num_hijos >= 0 AND num_hijos = FLOOR()num_hijos), --número de hijos
    val_tipo_sangre VARCHAR         NOT NULL,
    val_edad        DECIMAL(2,0)    NOT NULL    CHECK(val_edad >= 16),
-- DATOS LABORALES
    id_cargo        DECIMAL(2,0)    NOT NULL, --FK de la taqbla cargos
    val_sal_basico  DECIMAL(8)      NOT NULL    CHECK(val_sal_basico >= 0), --salario básico del empleado
    fec_ingreso     DATE            NOT NULL,
    PRIMARY KEY(id_emplea),
    FOREIGN KEY(id_cargo)   REFERENCES tab_cargos(id_cargo) ON DELETE CASCADE ON UPDATE CASCADE
);

/*Llena tabla*/
INSERT INTO tab_emplea VALUES(91423627,'Carlos Eduardo','Perez Rueda',FALSE,'Calle 20',3503421739,4,0,3,'A+',61,1,10000000,'2024-01-01');
INSERT INTO tab_emplea VALUES(1032505813,'Laura Juliana','Perez Barrera',TRUE,'Calle 138 Carrera 54',3102454737,5,0,0,'A+',25,2,8000000,'2024-10-01');
INSERT INTO tab_emplea VALUES(1014182933,'Maria camila','Perez Barrera',TRUE,'San Agustin de Guadalix',3122241234,5,1,1,'O+',27,3,9000000,'2024-02-01');

/*Indices del emplea(do) xq sí*/
CREATE INDEX idx_nom_emplea      ON tab_emplea(nom_emplea);
CREATE INDEX idx_ape_emplea      ON tab_emplea(ape_emplea);
CREATE INDEX idx_ind_estrato     ON tab_emplea(ind_estrato);
CREATE INDEX idx_val_tipo_sangre ON tab_emplea(val_tipo_sangre);





/*tab_conceptos almacena los diferentes conceptos que se pueden aplicar a la nómina (devengados o deducidos y si informmación especifica)*/
CREATE TABLE IF NOT EXISTS tab_conceptos
(
    id_concepto     DECIMAL(2)      NOT NULL,
    nom_concepto    VARCHAR         NOT NULL CHECK(LENGTH(nom_concepto)>=5),
    ind_operacion   BOOLEAN         NOT NULL, -- TRUE SUMA / FALSE RESTA  
    ind_pereo_pago  CHAR(1)         NOT NULL DEFAULT 'Q' CHECK(ind_perio_pago = 'Q' OR ind_perio_pago = 'M'), -- Q QUINCENA /M MENSUAL
    neto_pagado     BOOLEAN         NOT NULL DEFAULT FALSE, --TRUE NETO PAGADO/ FALSE NO NETO PAGADO
    val_porcent     DECIMAL(2,0)    NOT NULL CHECK(val_porcent >= 0), -- Por si el concepto se aplica con un porcentaje. Si es 0 no aplica.
    val_fijo        DECIMAL(8,0)    NOT NULL CHECK(val_fijo >= 0), -- Por si el conbcepto debe llegar un valor fijo permanente. Puede cambiarlo el usuario
    ind_legal       BOOLEAN         NOT NULL, --TRUE OBLIGATORIO / FALSE NO OBLIGATORIO
    PRIMARY KEY (id_concepto)
);





/*información sobre los meses (id y nombre)*/
CREATE TABLE IF NOT EXISTS tab_meses
(
    id_mes          DECIMAL(2,0)    NOT NULL    CHECK(id_mes >= 1 AND id_mes <= 12), --numero único que identifica cada més
    nom_mes         VARCHAR         NOT NULL    CHECK(LENGTH(nom_mes) >= 4), --nombre del mes
    PRIMARY KEY(id_mes)
);

/*Llena tabla meses*/
INSERT INTO tab_meses VALUES(1,'Enero');
INSERT INTO tab_meses VALUES(2,'febrero');
INSERT INTO tab_meses VALUES(3,'Marzo');
INSERT INTO tab_meses VALUES(4,'Abril');
INSERT INTO tab_meses VALUES(5,'Mayo');
INSERT INTO tab_meses VALUES(6,'junio');
INSERT INTO tab_meses VALUES(7,'Julio');
INSERT INTO tab_meses VALUES(8,'Agosto');
INSERT INTO tab_meses VALUES(9,'Septiembre');
INSERT INTO tab_meses VALUES(10,'Octubre');
INSERT INTO tab_meses VALUES(11,'Noviembre');
INSERT INTO tab_meses VALUES(12,'Diciembre');




/*resultado de la nomina, recopilación del resto de información en un solo documento de nomina*/
CREATE TABLE IF NOT EXISTS tab_nomina
(
    ano_nom         DECIMAL(4,0)    NOT NULL, --numero del año actual
    mes_nom         DECIMAL(2)      NOT NULL, --mes en la que se está haciendo la nomina 
    per_nom         DECIMAL(1)      NOT NULL, --periodo de la nomina
    id_emplea       DECIMAL(10)     NOT NULL, --FK que referencia al empleado al que se le hace la nomina
    id_concepto     DECIMAL(2)      NOT NULL, --Fk que especifica los detalles legales y económicos 
    val_dias_trab   DECIMAL(2)      NOT NULL    CHECK(val_dias_trab >= 1 AND val_dias_trab <= 30), --cantidad de días habiles trabajados
    val_nomina      DECIMAL(8)      NOT NULL    CHECK (val_nomina >= 0), --valor final y total de la nomina
    PRIMARY KEY(ano_nom,mes_nom,per_nom),
    FOREIGN KEY(id_emplea)      REFERENCES tab_emplea(id_emplea)        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_concepto)    REFERENCES tab_conceptos(id_concepto)   ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(mes_nom)        REFERENCES tab_meses(id_mes)        ON DELETE CASCADE ON UPDATE CASCADE
);





/*novedades en la nomina, cambios o ajustes que se le hacen a la nomina*/
CREATE TABLE IF NOT EXISTS tab_novedades
(
    ano_nom         DECIMAL(4,0)    NOT NULL, --año actual
    mes_nom         DECIMAL(2)      NOT NULL, --mes actual
    per_nom         DECIMAL(1)      NOT NULL, --???????????????????
    id_emplea       DECIMAL(10)     NOT NULL, --FK para identificar un empleado 
    id_concepto     DECIMAL(2)      NOT NULL, --FK para saber a que concepto viene relacionada la novedad
    val_dias_trab   DECIMAL(2)      NOT NULL CHECK(val_dias_trab >= 1 AND val_dias_trab <= 30), 
    val_nomina      DECIMAL(8)      NOT NULL CHECK (val_nomina >= 0),
    PRIMARY KEY(ano_nom,mes_nom,per_nom),
    FOREIGN KEY(id_emplea)      REFERENCES tab_emplea(id_emplea)        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_concepto)    REFERENCES tab_conceptos(id_concepto)   ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(mes_nom)        REFERENCES tab_meses(id_mes)            ON DELETE CASCADE ON UPDATE CASCADE
);