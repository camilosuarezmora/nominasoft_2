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
    nom_empresa     VARCHAR         NOT NULL, -- Nombre de la empresa que liquida la nómina
    ind_perio_pago  CHAR(1)         NOT NULL DEFAULT 'Q', --Q QUINCENAL /M MENSUAL
    val_smlv        DECIMAL(8,0)    NOT NULL, -- Valor del salario mínimo legal vigente para el año según gobierno
    val_auxtrans    DECIMAL (7,0)   NOT NULL, -- Vr. Aux. Transporte vigente para el año según gobierno
    val_pagotrans   DECIMAL(1)      NOT NULL DEFAULT 2, --PARA SABER SI PAGAMOS AUXILIO DE TRANSPORTE O NO 
    val_ano_nom     DECIMAL(4,0)    NOT NULL DEFAULT 2025, --AÑO VIGENTE
    val_mes_nom     DECIMAL(2)      NOT NULL, --MES VIGENTE
    val_por_intces  DECIMAL(2,0)    NOT NULL DEFAULT 12, -- Vr. porcentaje de intereses a la cesantía
    num_diasmes     DECIMAL(2,0)    NOT NULL DEFAULT 30, -- Número de días del mes fiscal
    PRIMARY KEY(id_empresa) 
);

CREATE TABLE IF NOT EXISTS tab_cargos
(
    id_cargo        DECIMAL(2,0)    NOT NULL,
    nom_cargo       VARCHAR         NOT NULL,
    PRIMARY KEY(id_cargo)
);

CREATE TABLE IF NOT EXISTS tab_emplea
(
-- DATOS BÁSICOS DEL EMPLEADO
    id_emplea       DECIMAL(10)     NOT NULL,
    nom_emplea      VARCHAR         NOT NULL,
    ape_emplea      VARCHAR         NOT NULL,
    ind_genero      BOOLEAN         NOT NULL, -- TRUE = FEMENINO / FALSE = MASCULINO
    dir_emplea      VARCHAR         NOT NULL,
    tel_emplea      DECIMAL(10,0)   NOT NULL,
    ind_estrato     DECIMAL(1)      NOT NULL    CHECK(ind_estrato >= 1 AND ind_estrato <= 6),
-- DATOS PERSONALES
    ind_est_civil   DECIMAL(1)      NOT NULL    CHECK(ind_est_civil BETWEEN 0 AND 4), -- 0:Soltero / 1:Casado / 2:Divorciado / 3:Viudo / 4:Otro
    num_hijos       DECIMAL(1,0)    NOT NULL,
    val_tipo_sangre VARCHAR         NOT NULL,
    val_edad        DECIMAL(2,0)    NOT NULL    CHECK(val_edad >= 16),
-- DATOS LABORALES
    id_cargo        DECIMAL(2,0)    NOT NULL,
    val_sal_basico  DECIMAL(8)      NOT NULL,
    fec_ingreso     DATE            NOT NULL,
    PRIMARY KEY(id_emplea),
    FOREIGN KEY(id_cargo)   REFERENCES tab_cargos(id_cargo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS tab_conceptos
(
    id_concepto     DECIMAL(2)      NOT NULL,
    nom_concepto    VARCHAR         NOT NULL,
    ind_operacion   BOOLEAN         NOT NULL, -- TRUE SUMA / FALSE RESTA  
    ind_pereo_pago  CHAR(1)         NOT NULL DEFAULT 'Q', -- Q QUINCENA /M MENSUAL
    neto_pagado     BOOLEAN         NOT NULL DEFAULT FALSE, --TRUE NETO PAGADO/ FALSE NO NETO PAGADO
    val_porcent     DECIMAL(2,0)    NOT NULL, -- Por si el concepto se aplica con un porcentaje. Si es 0 no aplica.
    val_fijo        DECIMAL(8,0)    NOT NULL, -- Por si el conbcepto debe llegar un valor fijo permanente. Puede cambiarlo el usuario
    ind_legal       BOOLEAN         NOT NULL, --TRUE OBLIGATORIO / FALSE NO OBLIGATORIO
    PRIMARY KEY (id_concepto)
);

CREATE TABLE IF NOT EXISTS tab_meses
(
    id_mes          DECIMAL(2,0)    NOT NULL    CHECK(id_mes >= 1 AND id_mes <= 12),
    nom_mes         VARCHAR         NOT NULL,
    PRIMARY KEY(id_mes)
);

CREATE TABLE IF NOT EXISTS tab_nomina
(
    ano_nom         DECIMAL(4,0)    NOT NULL,
    mes_nom         DECIMAL(2)      NOT NULL,
    per_nom         DECIMAL(1)      NOT NULL,
    id_emplea       DECIMAL(10)     NOT NULL,
    id_concepto     DECIMAL(2)      NOT NULL,
    val_dias_trab   DECIMAL(2)      NOT NULL CHECK(val_dias_trab >= 1 AND val_dias_trab <= 30),
    val_nomina      DECIMAL(8)      NOT NULL CHECK (val_nomina >= 0),
    PRIMARY KEY(ano_nom,mes_nom,per_nom),
    FOREIGN KEY(id_emplea)      REFERENCES tab_emplea(id_emplea) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_concepto)    REFERENCES tab_conceptos(id_concepto) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS tab_novedades
(
    ano_nom         DECIMAL(4,0)    NOT NULL,
    mes_nom         DECIMAL(2)      NOT NULL,
    per_nom         DECIMAL(1)      NOT NULL,
    id_emplea       DECIMAL(10)     NOT NULL,
    id_concepto     DECIMAL(2)      NOT NULL,
    val_dias_trab   DECIMAL(2)      NOT NULL CHECK(val_dias_trab >= 1 AND val_dias_trab <= 30),
    val_nomina      DECIMAL(8)      NOT NULL CHECK (val_nomina >= 0),
    PRIMARY KEY(ano_nom,mes_nom,per_nom),
    FOREIGN KEY(id_emplea)      REFERENCES tab_emplea(id_emplea) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_concepto)    REFERENCES tab_conceptos(id_concepto) ON DELETE CASCADE ON UPDATE CASCADE
);