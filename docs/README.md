# Documentación general del repositorio de nómina

## Propósito y alcance

Este repositorio contiene la capa de base de datos de un prototipo de liquidación de nómina escrito para **PostgreSQL**. No contiene una aplicación web, un servicio, archivos de configuración de conexión ni un sistema de migraciones: sus entregables son el esquema SQL, funciones PL/pgSQL, un diagrama de entidad-relación y guiones de prueba manual.

La lógica principal pretende calcular la nómina por año, mes y período, registrando los componentes de cada empleado en `tab_nomina`. El proyecto usa las convenciones `tab_` para tablas y `fun_` para funciones.

> **Estado del material.** El contenido debe tratarse como material de desarrollo/estudio y no como un despliegue de producción. El script principal elimina tablas antes de crearlas, los datos de ejemplo están comentados y varias validaciones quedan después de un `RETURN`, por lo que no se alcanzan. Esta documentación describe el estado actual; no corrige ni presupone comportamiento que los scripts no implementan.

## Inventario del repositorio

| Ruta | Rol | Relación con la nómina |
| --- | --- | --- |
| `script_nomina.sql` | DDL principal: elimina y crea las tablas del modelo. | Central. |
| `func/fun_act_nomin.sql` | Función de cálculo y regeneración de la nómina para un período. | Central. |
| `func/cargos/`, `func/conceptos/`, `func/emplea/`, `func/meses/`, `func/novedades/`, `func/pmtros/`, `func/nomina/` | Funciones CRUD y consulta por área funcional. | Central, con las observaciones de compatibilidad indicadas abajo. |
| `MER_nomina.pgerd` | Archivo JSON de diagrama de pgAdmin ERD. | Artefacto de diseño del modelo, no ejecutable por PostgreSQL. |
| `pruebas.sql` | Ejemplos comentados para invocar algunas funciones manualmente. | Apoyo de desarrollo; no es una suite automatizada. |
| `err/tab_error.sql` | Tabla y catálogo extenso de SQLSTATE de PostgreSQL. | **Auxiliar, no es parte del esquema de nómina creado por `script_nomina.sql`.** |
| `err/fun_errcode.sql` | Busca la descripción de un código en `tab_error`. | **Auxiliar de diagnóstico**, independiente de la liquidación. |
| `err/pruebas.sql` | Borrador de función para insertar errores. | **Archivo de prueba/diagnóstico**, no integrado en el flujo de nómina. |
| `users` (tabla declarada en `script_nomina.sql`) | Guarda usuario, contraseña, correo y nombre. | **Funcionalidad de autenticación ajena al dominio de nómina**; no hay funciones ni relaciones que la usen. |

## Modelo de datos

### Tablas del esquema principal

| Tabla | Clave primaria | Finalidad y relaciones |
| --- | --- | --- |
| `users` | `uid` serial | Usuarios de inicio de sesión. Está aislada del resto del modelo. La contraseña se define como `VARCHAR` sin ninguna protección implementada por el repositorio. |
| `tab_conceptos` | `id_concepto` | Catálogo de conceptos de liquidación. `ind_operacion` distingue suma/resta; `ind_perio_pago` admite `Q` o `M`; `neto_pagado` e `ind_legal` identifican su tipo. La usan parámetros, novedades y nómina. |
| `tab_cargos` | `id_cargo` | Catálogo de cargos. Es referenciada por empleados. |
| `tab_meses` | `id_mes` | Catálogo de meses, restringido a 1–12. Es referenciado por parámetros, novedades y nómina. |
| `tab_pmtros` | `id_empresa` | Parámetros de una empresa: período, SMLV, auxilio de transporte, fecha de nómina, días del mes y los conceptos que representan salario básico y auxilio. Referencia meses y conceptos. |
| `tab_emplea` | `id_emplea` | Información personal y laboral de empleados, incluido cargo y salario básico. Referencia `tab_cargos`. |
| `tab_novedades` | `ano_nomina`, `mes_nomina`, `per_nomina`, `id_emplea`, `id_concepto` | Ajustes por empleado, período y concepto, con días y horas trabajadas. Referencia empleados, conceptos y meses. |
| `tab_nomina` | `ano_nomina`, `mes_nomina`, `per_nomina`, `id_emplea`, `id_concepto` | Resultado detallado por concepto, empleado y período. Referencia empleados, conceptos y meses. |

Relaciones principales:

```text
tab_cargos ──< tab_emplea ──< tab_novedades
                       └──< tab_nomina
tab_conceptos ──< tab_novedades
       ├───────< tab_nomina
       └───────< tab_pmtros >──── tab_meses
                         tab_novedades ──> tab_meses
                         tab_nomina ─────> tab_meses
```

Las claves foráneas declaradas en el esquema aplican `ON DELETE CASCADE` y `ON UPDATE CASCADE`; borrar un registro de catálogo o empleado puede, por tanto, eliminar registros relacionados.

### Diagrama ERD y diferencias con el DDL

`MER_nomina.pgerd` contiene el diagrama exportado de pgAdmin y representa las tablas del modelo, incluido `tab_error`. Es un archivo de diseño, no una fuente de creación de objetos. Además, conserva nombres de columnas distintos de los usados por el DDL actual: en el ERD aparecen, por ejemplo, `per_nom`, `ano_nom` y `mes_nom` en partes del modelo, mientras que `script_nomina.sql` usa `per_nomina`, `ano_nomina` y `mes_nomina`. Para crear o modificar la base se debe tomar `script_nomina.sql` como referencia ejecutable y revisar esas diferencias antes de regenerar el diagrama.

## Funciones disponibles

| Área | Funciones | Descripción |
| --- | --- | --- |
| Cargos | `fun_insert_cargos`, `fun_update_cargos`, `fun_delete_cargos` | Alta, modificación y baja de `tab_cargos`. |
| Conceptos | `fun_insert_conceptos`, `fun_update_conceptos`, `fun_delete_conceptos` | Alta, modificación y baja de conceptos. |
| Empleados | `fun_insert_emplea`, `fun_update_emplea`, `fun_delete_emplea`, `fun_listar_emplea` | Gestión y consulta de `tab_emplea`. |
| Meses | `fun_insert_meses`, `fun_update_meses`, `fun_delete_meses` | Gestión del catálogo de meses. |
| Parámetros | `fun_insert_pmtros`, `fun_update_pmtros`, `fun_delete_pmtros` | Gestión de parámetros empresariales y de liquidación. |
| Novedades | `fun_insert_novedades`, `fun_update_novedades`, `fun_delete_novedades` | Gestión de novedades por período. |
| Nómina | `fun_act_nomina`, `fun_delete_nomina` | Cálculo de nómina y eliminación de registros de nómina. |
| Diagnóstico auxiliar | `fun_errcode`, `fun_insert_err` | Consulta e inserción de códigos de error; `fun_insert_err` está en un archivo llamado `err/pruebas.sql`. |

Las funciones CRUD se distribuyen en archivos separados y deben cargarse **después** del esquema, porque sus tipos de parámetros se declaran usando `%TYPE` sobre columnas de las tablas. La función `fun_act_nomina` debe cargarse una vez exista `tab_nomina`.

## Flujo de cálculo implementado

`fun_act_nomina(año, mes, período)` implementa el siguiente flujo:

1. Lee un registro de `tab_pmtros` y comprueba que el año y el mes recibidos coincidan con sus parámetros; el período debe ser como máximo `2`.
2. Determina los días a pagar: la mitad de `num_diasmes` para un período quincenal (`ind_perio_pago = 'Q'`) o el total para mensual.
3. Borra los registros existentes en `tab_nomina` para el mismo año, mes y período.
4. Recorre los empleados y los conceptos legales que no son neto pagado.
5. Inserta salario básico y, cuando el salario no supera `val_smlv * ind_num_trans`, auxilio de transporte.
6. Inserta deducciones porcentuales; también contiene una rama para valores fijos.

La sección de conceptos no obligatorios/novedades está comentada dentro de la función, por lo que `tab_novedades` no afecta el cálculo actual. Asimismo, la variable de neto se inicializa pero no se inserta en `tab_nomina`; el cálculo devuelve `BOOLEAN`, no un total monetario.

## Orden de instalación sugerido

> Ejecutar solamente en una base de desarrollo. `script_nomina.sql` comienza con `DROP TABLE IF EXISTS` y elimina los datos de las tablas que controla.

1. Crear una base PostgreSQL vacía y conectarse a ella.
2. Ejecutar `script_nomina.sql` para crear el esquema principal. Los `INSERT` de ejemplos están comentados; cargar los catálogos y parámetros necesarios antes de liquidar.
3. Opcionalmente, si se requiere el material auxiliar de errores, ejecutar `err/tab_error.sql` y después `err/fun_errcode.sql`. Es independiente del script principal y vuelve a insertar el catálogo si se ejecuta sobre una tabla ya poblada.
4. Ejecutar los archivos de `func/` una vez creadas las tablas. Primero los CRUD que se necesiten y, al final, `func/fun_act_nomin.sql`.
5. Cargar datos coherentes: meses, cargos, conceptos (incluidos los IDs configurados en `tab_pmtros`), parámetros y empleados. Luego se pueden invocar funciones como `SELECT fun_act_nomina(2025, 1, 1);`.
6. Usar `pruebas.sql` exclusivamente como referencia para pruebas manuales; sus sentencias están mayoritariamente comentadas y no validan resultados de forma automática.

## Aspectos a revisar antes de usarlo

- **Nombres incompatibles.** `func/nomina/fun_delete_nomina.sql` referencia columnas `ano_nom`, `mes_nom` y `per_nom`, pero el DDL actual define `ano_nomina`, `mes_nomina` y `per_nomina`. El ERD también conserva variantes antiguas de estos nombres.
- **Defectos de funciones CRUD.** Hay variables no declaradas, condiciones invertidas y validaciones colocadas después de retornos en diversos scripts. Por ejemplo, no debe asumirse que todas las funciones se creen o validen correctamente sin compilarlas y probarlas en PostgreSQL.
- **Carga repetida del catálogo de errores.** `err/tab_error.sql` crea `tab_error` solo si no existe, pero inserta filas sin una política de idempotencia; una segunda ejecución puede chocar con su clave primaria.
- **Seguridad de usuarios.** La tabla `users` mantiene `password` como texto y no dispone de autenticación, autorización ni hash en este repositorio. No almacenar contraseñas reales con el diseño actual.
- **Datos y transacciones.** No hay semillas activas, control de versiones de esquema, transacciones de instalación ni pruebas automatizadas. Conviene completar estas piezas antes de un uso compartido o productivo.

## Verificación manual

Después de cargar el esquema y las funciones en una base de desarrollo, consultas mínimas útiles son:

```sql
\dt
\df fun_*
SELECT * FROM tab_pmtros;
SELECT * FROM tab_nomina;
```

Para inspeccionar el diseño visual, abrir `MER_nomina.pgerd` con la herramienta ERD de pgAdmin; no se debe intentar ejecutarlo con `psql`.
