/*
======================================================================
    creación de la tabla para utilizar los errcodes :p
    camilo suarez 
    29/03/2025
======================================================================
*/


CREATE TABLE IF NOT EXISTS tab_error(
    cod_error       VARCHAR     NOT NULL,
    name_error      VARCHAR     NOT NULL,
    PRIMARY KEY (cod_error)
);


-- Clase 00 – Successfucod_l Completion
INSERT INTO tab_error(cod_error, name_error) VALUES ('00000', 'Successful Completion: Operación ejecutada sin errores.');

-- Clase 01 – Warningcod_
INSERT INTO tab_error (cod_error, name_error) VALUES ('01000', 'Warning: Advertencia general.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('0100C', 'Dynamic result sets returned: Se han devuelto conjuntos de resultados dinámicos.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('01008', 'Implicit zero bit padding: Se aplicó padding de ceros implícito.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('01003', 'Null value eliminated in set function: Se eliminaron valores nulos en función agregada.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('01007', 'Privilege not granted: Privilegio no concedido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('01006', 'Privilege not revoked: Privilegio no revocado.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('01004', 'String data right truncation: Texto truncado al asignar a campo de menor tamaño.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('01P01', 'Deprecated feature: Funcionalidad obsoleta.');

-- Clase 02 – No Data (cod_también advertencia según el estándar)
INSERT INTO tab_error (cod_error, name_error) VALUES ('02000', 'No Data: No se encontraron filas o datos.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('02001', 'No additional dynamic result sets returned: No se devolvieron conjuntos adicionales.');

-- Clase 03 – SQL Statecod_ment Not Yet Complete
INSERT INTO tab_error (cod_error, name_error) VALUES ('03000', 'SQL Statement Not Yet Complete: La sentencia SQL no ha finalizado.');

-- Clase 08 – Connectiocod_n Exception
INSERT INTO tab_error (cod_error, name_error) VALUES ('08000', 'Connection Exception: Excepción en la conexión.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('08003', 'Connection does not exist: La conexión no existe.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('08006', 'Connection failure: Fallo en la conexión.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('08001', 'SQL client unable to establish SQL connection: No se pudo establecer la conexión.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('08004', 'SQL server rejected establishment of SQL connection: El servidor rechazó la conexión.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('08007', 'Transaction resolution unknown: Resolución de transacción desconocida.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('08P01', 'Protocol violation: Violación del protocolo.');

-- Clase 09 – Triggeredcod_ Action Exception
INSERT INTO tab_error (cod_error, name_error) VALUES ('09000', 'Triggered Action Exception: Excepción en acción desencadenada.');

-- Clase 0A – Feature Ncod_ot Supported
INSERT INTO tab_error (cod_error, name_error) VALUES ('0A000', 'Feature Not Supported: Funcionalidad no soportada.');

-- Clase 0B – Invalid Tcod_ransaction Initiation
INSERT INTO tab_error (cod_error, name_error) VALUES ('0B000', 'Invalid Transaction Initiation: Inicio de transacción inválido.');

-- Clase 0F – Locator Ecod_xception
INSERT INTO tab_error (cod_error, name_error) VALUES ('0F000', 'Locator Exception: Excepción de localizador.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('0F001', 'Invalid locator specification: Especificación de localizador inválida.');

-- Clase 0L – Invalid Gcod_rantor
INSERT INTO tab_error (cod_error, name_error) VALUES ('0L000', 'Invalid Grantor: Concesionario inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('0LP01', 'Invalid Grant Operation: Operación de concesión inválida.');

-- Clase 0P – Invalid Rcod_ole Specification
INSERT INTO tab_error (cod_error, name_error) VALUES ('0P000', 'Invalid Role Specification: Especificación de rol inválida.');

-- Clase 0Z – Diagnosticod_cs Exception
INSERT INTO tab_error (cod_error, name_error) VALUES ('0Z000', 'Diagnostics Exception: Excepción de diagnóstico.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('0Z002', 'Stacked diagnostics accessed without active handler: Acceso a diagnósticos sin manejador activo.');

-- Clase 10 – XQuery Ercod_ror
INSERT INTO tab_error (cod_error, name_error) VALUES ('10608', 'Invalid argument for XQuery: Error en argumento de XQuery.');

-- Clase 20 – Case Not cod_Found
INSERT INTO tab_error (cod_error, name_error) VALUES ('20000', 'Case Not Found: No se encontró la condición en CASE.');

-- Clase 21 – Cardinalicod_ty Violation
INSERT INTO tab_error (cod_error, name_error) VALUES ('21000', 'Cardinality Violation: Número de filas incorrecto.');

-- Clase 22 – Data Excecod_ption
INSERT INTO tab_error (cod_error, name_error) VALUES ('22000', 'Data Exception: Excepción de datos.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2202E', 'Array Subscript Error: Error en índice de arreglo.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22021', 'Character Not In Repertoire: Carácter no soportado.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22008', 'Datetime Field Overflow: Desbordamiento en campo fecha/hora.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22012', 'Division By Zero: División por cero.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22005', 'Error In Assignment: Error en asignación.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2200B', 'Escape Character Conflict: Conflicto con carácter de escape.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22022', 'Indicator Overflow: Desbordamiento del indicador.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22015', 'Interval Field Overflow: Desbordamiento en intervalo.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2201E', 'Invalid Argument For Logarithm: Argumento inválido para logaritmo.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22014', 'Invalid Argument For NTILE Function: Argumento inválido para NTILE.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22016', 'Invalid Argument For NTH_VALUE Function: Argumento inválido para NTH_VALUE.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2201F', 'Invalid Argument For Power Function: Argumento inválido para potencia.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2201G', 'Invalid Argument For Width Bucket Function: Argumento inválido para WIDTH_BUCKET.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22018', 'Invalid Character Value For Cast: Valor de carácter inválido para conversión.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22007', 'Invalid Datetime Format: Formato de fecha/hora inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22019', 'Invalid Escape Character: Carácter de escape inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2200D', 'Invalid Escape Octet: Octeto de escape inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22025', 'Invalid Escape Sequence: Secuencia de escape inválida.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22P06', 'Nonstandard Use Of Escape Character: Uso no estándar de carácter de escape.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22010', 'Invalid Indicator Parameter Value: Valor de parámetro indicador inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22023', 'Invalid Parameter Value: Valor de parámetro inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22013', 'Invalid Preceding Or Following Size: Tamaño anterior o posterior inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2201B', 'Invalid Regular Expression: Expresión regular inválida.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2201W', 'Invalid Row Count In Limit Clause: Número de filas en LIMIT inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2201X', 'Invalid Row Count In Result Offset Clause: Número de filas en OFFSET inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2202H', 'Invalid Tablesample Argument: Argumento de TABLESAMPLE inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2202G', 'Invalid Tablesample Repeat: Repetición de TABLESAMPLE inválida.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22009', 'Invalid Time Zone Displacement Value: Desplazamiento de zona horaria inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2200C', 'Invalid Use Of Escape Character: Uso inválido del carácter de escape.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2200G', 'Most Specific Type Mismatch: No se encontró coincidencia específica de tipo.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22004', 'Null Value Not Allowed: Valor nulo no permitido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22002', 'Null Value No Indicator Parameter: Valor nulo sin indicador.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22003', 'Numeric Value Out Of Range: Valor numérico fuera de rango.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2200H', 'Sequence Generator Limit Exceeded: Límite de secuencia superado.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22026', 'String Data Length Mismatch: Longitud de datos de cadena no coincide.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22001', 'String Data Right Truncation: Cadena truncada a la derecha.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22011', 'Substring Error: Error en SUBSTRING.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22027', 'Trim Error: Error en función TRIM.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22024', 'Unterminated C String: Cadena C sin terminar.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2200F', 'Zero Length Character String: Cadena de longitud cero.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22P01', 'Floating Point Exception: Excepción en punto flotante.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22P02', 'Invalid Text Representation: Representación textual inválida.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22P03', 'Invalid Binary Representation: Representación binaria inválida.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22P04', 'Bad Copy File Format: Formato de archivo de COPY incorrecto.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22P05', 'Untranslatable Character: Carácter no traducible.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2200L', 'Not An XML Document: No es un documento XML.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2200M', 'Invalid XML Document: Documento XML inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2200N', 'Invalid XML Content: Contenido XML inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2200S', 'Invalid XML Comment: Comentario XML inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2200T', 'Invalid XML Processing Instruction: Instrucción de procesamiento XML inválida.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22030', 'Duplicate JSON Object Key Value: Clave duplicada en objeto JSON.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22031', 'Invalid Argument For SQL JSON Datetime Function: Argumento inválido para función JSON de fecha/hora.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22032', 'Invalid JSON Text: Texto JSON inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22033', 'Invalid SQL JSON Subscript: Subíndice JSON inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22034', 'More Than One SQL JSON Item: Se encontraron múltiples elementos JSON.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22035', 'No SQL JSON Item: No se encontró elemento JSON.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22036', 'Non-numeric SQL JSON Item: Elemento JSON no numérico.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22037', 'Non-unique Keys In A JSON Object: Claves no únicas en objeto JSON.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22038', 'Singleton SQL JSON Item Required: Se requiere un único elemento JSON.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('22039', 'SQL JSON Array Not Found: No se encontró arreglo JSON.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2203A', 'SQL JSON Member Not Found: Miembro JSON no encontrado.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2203B', 'SQL JSON Number Not Found: Número JSON no encontrado.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2203C', 'SQL JSON Object Not Found: Objeto JSON no encontrado.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2203D', 'Too Many JSON Array Elements: Demasiados elementos en arreglo JSON.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2203E', 'Too Many JSON Object Members: Demasiados miembros en objeto JSON.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2203F', 'SQL JSON Scalar Required: Se requiere valor escalar JSON.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2203G', 'SQL JSON Item Cannot Be Cast To Target Type: Elemento JSON no se puede convertir.');

-- Clase 23 – Integritycod_ Constraint Violation
INSERT INTO tab_error (cod_error, name_error) VALUES ('23000', 'Integrity Constraint Violation: Violación de restricción de integridad.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('23001', 'Restrict Violation: Violación de restricción RESTRICT.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('23502', 'Not Null Violation: Columna no permite nulos.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('23503', 'Foreign Key Violation: Violación de clave foránea.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('23505', 'Unique Violation: Violación de restricción única.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('23514', 'Check Violation: Violación de restricción CHECK.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('23P01', 'Exclusion Violation: Violación de restricción de exclusión.');

-- Clase 24 – Invalid Ccod_ursor State
INSERT INTO tab_error (cod_error, name_error) VALUES ('24000', 'Invalid Cursor State: Estado de cursor inválido.');

-- Clase 25 – Invalid Tcod_ransaction State
INSERT INTO tab_error (cod_error, name_error) VALUES ('25000', 'Invalid Transaction State: Estado de transacción inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('25001', 'Active SQL Transaction: Transacción SQL activa.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('25002', 'Branch Transaction Already Active: Transacción en rama ya activa.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('25008', 'Held Cursor Requires Same Isolation Level: El cursor requiere el mismo nivel de aislamiento.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('25003', 'Inappropriate Access Mode For Branch Transaction: Modo de acceso inapropiado en transacción en rama.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('25004', 'Inappropriate Isolation Level For Branch Transaction: Nivel de aislamiento inapropiado para transacción en rama.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('25005', 'No Active SQL Transaction For Branch Transaction: No hay transacción activa para transacción en rama.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('25006', 'Read Only SQL Transaction: Transacción SQL de solo lectura.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('25007', 'Schema And Data Statement Mixing Not Supported: Mezcla de sentencias de esquema y datos no soportada.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('25P01', 'No Active SQL Transaction: No hay transacción SQL activa.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('25P02', 'In Failed SQL Transaction: Transacción SQL fallida.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('25P03', 'Idle In Transaction Session Timeout: Tiempo de espera excedido en transacción inactiva.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('25P04', 'Transaction Timeout: Tiempo de espera de transacción excedido.');

-- Clase 26 – Invalid Scod_QL Statement Name
INSERT INTO tab_error (cod_error, name_error) VALUES ('26000', 'Invalid SQL Statement Name: Nombre de sentencia SQL inválido.');

-- Clase 27 – Triggeredcod_ Data Change Violation
INSERT INTO tab_error (cod_error, name_error) VALUES ('27000', 'Triggered Data Change Violation: Violación en cambio de datos desencadenado.');

-- Clase 28 – Invalid Acod_uthorization Specification
INSERT INTO tab_error (cod_error, name_error) VALUES ('28000', 'Invalid Authorization Specification: Especificación de autorización inválida.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('28P01', 'Invalid Password: Contraseña inválida.');

-- Clase 2B – Dependentcod_ Privilege Descriptors Still Exist
INSERT INTO tab_error (cod_error, name_error) VALUES ('2B000', 'Dependent Privilege Descriptors Still Exist: Existen descriptores de privilegios dependientes.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2BP01', 'Dependent Objects Still Exist: Existen objetos dependientes.');

-- Clase 2D – Invalid Tcod_ransaction Termination
INSERT INTO tab_error (cod_error, name_error) VALUES ('2D000', 'Invalid Transaction Termination: Terminación de transacción inválida.');

-- Clase 2F – SQL Routicod_ne Exception
INSERT INTO tab_error (cod_error, name_error) VALUES ('2F000', 'SQL Routine Exception: Excepción en rutina SQL.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2F005', 'Function Executed No Return Statement: Función sin sentencia RETURN.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2F002', 'Modifying SQL Data Not Permitted: Modificación de datos SQL no permitida.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2F003', 'Prohibited SQL Statement Attempted: Sentencia SQL prohibida.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('2F004', 'Reading SQL Data Not Permitted: Lectura de datos SQL no permitida.');

-- Clase 34 – Invalid Ccod_ursor Name
INSERT INTO tab_error (cod_error, name_error) VALUES ('34000', 'Invalid Cursor Name: Nombre de cursor inválido.');

-- Clase 38 – External cod_Routine Exception
INSERT INTO tab_error (cod_error, name_error) VALUES ('38000', 'External Routine Exception: Excepción en rutina externa.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('38001', 'Containing SQL Not Permitted: SQL contenido no permitido en rutina externa.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('38002', 'Modifying SQL Data Not Permitted (External Routine): Modificación de datos no permitida en rutina externa.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('38003', 'Prohibited SQL Statement Attempted (External Routine): Sentencia SQL prohibida en rutina externa.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('38004', 'Reading SQL Data Not Permitted (External Routine): Lectura de datos no permitida en rutina externa.');

-- Clase 39 – External cod_Routine Invocation Exception
INSERT INTO tab_error (cod_error, name_error) VALUES ('39000', 'External Routine Invocation Exception: Error al invocar rutina externa.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('39001', 'Invalid SQLSTATE Returned (External Routine): SQLSTATE devuelto inválido en rutina externa.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('39004', 'Null Value Not Allowed (External Routine): Valor nulo no permitido en rutina externa.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('39P01', 'Trigger Protocol Violated: Protocolo de trigger violado.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('39P02', 'SRF Protocol Violated: Protocolo SRF violado.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('39P03', 'Event Trigger Protocol Violated: Protocolo de event trigger violado.');

-- Clase 3B – Savepointcod_ Exception
INSERT INTO tab_error (cod_error, name_error) VALUES ('3B000', 'Savepoint Exception: Excepción en savepoint.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('3B001', 'Invalid Savepoint Specification: Especificación de savepoint inválida.');

-- Clase 3D – Invalid Ccod_atalog Name
INSERT INTO tab_error (cod_error, name_error) VALUES ('3D000', 'Invalid Catalog Name: Nombre de catálogo inválido.');

-- Clase 3F – Invalid Scod_chema Name
INSERT INTO tab_error (cod_error, name_error) VALUES ('3F000', 'Invalid Schema Name: Nombre de esquema inválido.');

-- Clase 40 – Transacticod_on Rollback
INSERT INTO tab_error (cod_error, name_error) VALUES ('40000', 'Transaction Rollback: Rollback de transacción.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('40002', 'Transaction Integrity Constraint Violation: Violación de integridad en transacción.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('40001', 'Serialization Failure: Fallo en serialización.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('40003', 'Statement Completion Unknown: Estado de finalización de sentencia desconocido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('40P01', 'Deadlock Detected: Se detectó un deadlock.');

-- Clase 42 – Syntax Ercod_ror or Access Rule Violation
INSERT INTO tab_error (cod_error, name_error) VALUES ('42000', 'Syntax Error or Access Rule Violation: Error de sintaxis o violación de reglas de acceso.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('42601', 'Syntax Error: Error de sintaxis.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('42501', 'Insufficient Privilege: Privilegios insuficientes.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('42846', 'Cannot Coerce: No se puede convertir el tipo.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('42803', 'Grouping Error: Error en agrupación.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('42P20', 'Windowing Error: Error en cláusula window.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('42P19', 'Invalid Recursion: Recursión inválida.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('42830', 'Invalid Foreign Key: Clave foránea inválida.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('42602', 'Invalid Name: Nombre inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('42622', 'Name Too Long: Nombre demasiado largo.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('42939', 'Reserved Name: Nombre reservado.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('42804', 'Datatype Mismatch: Tipos de datos incompatibles.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('42P18', 'Indeterminate Datatype: Tipo de dato indeterminado.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('42P21', 'Collation Mismatch: Colación incompatible.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('42P22', 'Indeterminate Collation: Colación indeterminada.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('42809', 'Wrong Object Type: Tipo de objeto incorrecto.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('428C9', 'Generated Always: Error en columna GENERATED ALWAYS.');

-- Clase 44 – WITH CHECcod_K OPTION Violation
INSERT INTO tab_error (cod_error, name_error) VALUES ('44000', 'WITH CHECK OPTION Violation: Violación de la opción WITH CHECK.');

-- Clase 53 – Insufficicod_ent Resources
INSERT INTO tab_error (cod_error, name_error) VALUES ('53000', 'Insufficient Resources: Recursos insuficientes.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('53100', 'Disk Full: Disco lleno.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('53200', 'Out Of Memory: Memoria insuficiente.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('53300', 'Too Many Connections: Demasiadas conexiones.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('53400', 'Configuration Limit Exceeded: Límite de configuración excedido.');

-- Clase 54 – Program Lcod_imit Exceeded
INSERT INTO tab_error (cod_error, name_error) VALUES ('54000', 'Program Limit Exceeded: Límite del programa excedido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('54001', 'Statement Too Complex: Sentencia demasiado compleja.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('54011', 'Too Many Columns: Demasiadas columnas especificadas.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('54023', 'Too Many Arguments: Demasiados argumentos.');

-- Clase 55 – Object Nocod_t In Prerequisite State
INSERT INTO tab_error (cod_error, name_error) VALUES ('55000', 'Object Not In Prerequisite State: Objeto fuera del estado requerido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('55006', 'Object In Use: Objeto en uso.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('55P02', 'Cannot Change Runtime Parameter: No se puede cambiar parámetro en tiempo de ejecución.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('55P03', 'Lock Not Available: Bloqueo no disponible.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('55P04', 'Unsafe New Enum Value Usage: Uso inseguro de nuevo valor ENUM.');

-- Clase 57 – Operator cod_Intervention
INSERT INTO tab_error (cod_error, name_error) VALUES ('57000', 'Operator Intervention: Intervención del operador.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('57014', 'Query Canceled: Consulta cancelada.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('57P01', 'Admin Shutdown: Apagado por administrador.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('57P02', 'Crash Shutdown: Apagado por fallo del sistema.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('57P03', 'Cannot Connect Now: No se puede conectar en este momento.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('57P04', 'Database Dropped: Base de datos eliminada.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('57P05', 'Idle Session Timeout: Tiempo de espera en sesión inactiva.');

-- Clase 58 – System Ercod_ror
INSERT INTO tab_error (cod_error, name_error) VALUES ('58000', 'System Error: Error del sistema.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('58030', 'I/O Error: Error de entrada/salida.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('58P01', 'Undefined File: Archivo no definido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('58P02', 'Duplicate File: Archivo duplicado.');

-- Clase F0 – Configuracod_tion File Error
INSERT INTO tab_error (cod_error, name_error) VALUES ('F0000', 'Config File Error: Error en archivo de configuración.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('F0001', 'Lock File Exists: Archivo de bloqueo existente.');

-- Clase HV – Foreign Dcod_ata Wrapper Error (SQL/MED)
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV000', 'FDW Error: Error en el Foreign Data Wrapper.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV005', 'FDW Column Name Not Found: Columna no encontrada en FDW.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV002', 'FDW Dynamic Parameter Value Needed: Se requiere parámetro dinámico en FDW.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV010', 'FDW Function Sequence Error: Error en secuencia de función FDW.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV021', 'FDW Inconsistent Descriptor Information: Inconsistencia en la información de descriptor FDW.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV024', 'FDW Invalid Attribute Value: Valor de atributo FDW inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV007', 'FDW Invalid Column Name: Nombre de columna FDW inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV008', 'FDW Invalid Column Number: Número de columna FDW inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV004', 'FDW Invalid Data Type: Tipo de dato FDW inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV006', 'FDW Invalid Data Type Descriptors: Descriptores de tipo FDW inválidos.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV091', 'FDW Invalid Descriptor Field Identifier: Identificador de campo de descriptor FDW inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV00B', 'FDW Invalid Handle: Handle FDW inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV00C', 'FDW Invalid Option Index: Índice de opción FDW inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV00D', 'FDW Invalid Option Name: Nombre de opción FDW inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV090', 'FDW Invalid String Length Or Buffer Length: Longitud de cadena o buffer FDW inválida.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV00A', 'FDW Invalid String Format: Formato de cadena FDW inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV009', 'FDW Invalid Use Of Null Pointer: Uso de puntero nulo en FDW inválido.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV014', 'FDW Too Many Handles: Demasiados handles FDW.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV001', 'FDW Out Of Memory: Memoria insuficiente en FDW.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV00P', 'FDW No Schemas: No hay esquemas definidos en FDW.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV00J', 'FDW Option Name Not Found: Opción FDW no encontrada.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV00K', 'FDW Reply Handle: Error en handle de respuesta FDW.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV00Q', 'FDW Schema Not Found: Esquema FDW no encontrado.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV00R', 'FDW Table Not Found: Tabla FDW no encontrada.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV00L', 'FDW Unable To Create Execution: No se pudo crear ejecución en FDW.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV00M', 'FDW Unable To Create Reply: No se pudo crear respuesta en FDW.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('HV00N', 'FDW Unable To Establish Connection: No se pudo establecer conexión FDW.');

-- Clase P0 – PL/pgSQL cod_Error
INSERT INTO tab_error (cod_error, name_error) VALUES ('P0000', 'PL/pgSQL Error: Error general en PL/pgSQL.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('P0001', 'Raise Exception: Se ejecutó RAISE EXCEPTION.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('P0002', 'No Data Found: No se encontraron datos en PL/pgSQL.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('P0003', 'Too Many Rows: Se obtuvieron más filas de las esperadas.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('P0004', 'Assert Failure: Falla en aserción en PL/pgSQL.');

-- Clase XX – Internal cod_Error
INSERT INTO tab_error (cod_error, name_error) VALUES ('XX000', 'Internal Error: Error interno en PostgreSQL.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('XX001', 'Data Corrupted: Datos corruptos.');
INSERT INTO tab_error (cod_error, name_error) VALUES ('XX002', 'Index Corrupted: Índice corrupto.');
