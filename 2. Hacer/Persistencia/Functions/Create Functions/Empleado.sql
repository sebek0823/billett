CREATE FUNCTION "insertempleado"(
	"p_nombreempleado" VARCHAR,
	"p_iddocumento" UUID,
	"p_numerodocumento" VARCHAR,
	"p_idsede" UUID,
	"p_idcargo" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
	INSERT INTO "Empleado" ("NombreEmpleado", "IdDocumento", "NumeroDocumento", "IdSede", "IdCargo")
   VALUES (p_NombreEmpleado, p_IdDocumento, p_NumeroDocumento, p_IdSede, p_IdCargo);
END;
 $$
 
 ------------------------------------------------------------------------------
 --UPDATE
 CREATE FUNCTION "actualizarempleado"(
	"p_idempleado" UUID,
	"p_nombreempleado" VARCHAR,
	"p_iddocumento" VARCHAR,
	"p_numerodocumento" VARCHAR,
	"p_idsede" UUID,
	"p_idcargo" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Empleado"
    SET "NombreEmpleado" = p_NombreEmpleado, "IdDocumento" = p_IdDocumento, "NumeroDocumento" = p_NumeroDocumento, "IdSede" = p_IdSede, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEmpleado" = p_IdEmpleado
      AND "Activo" = b'1';
END;
 $$
 
 ------------------------------------------------------------------------------------------
 --Retirar
 CREATE FUNCTION "retirarempleado"(
	"p_idempleado" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Empleado"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEmpleado" = p_IdEmpleado;
END;
 $$
 -------------------------------------------------------
 CREATE FUNCTION "consultaempleadoporid"(
	"p_idempleado" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdEmpleado", p."NombreEmpleado", p."IdDocumento", p."NumeroDocumento", p."IdSede", p."IdCargo", p."Activo", p."Actualiza"
    FROM "Empleado" p
    WHERE p."IdEmpleado" = p_IdEmpleado
      AND p."Activo" = B'1';
END;
 $$
 -------------------------
 CREATE FUNCTION "consultaempleado"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
	 RETURN QUERY
    SELECT p."IdEmpleado", p."NombreEmpleado", p."IdDocumento", p."NumeroDocumento", p."IdSede", p."IdCargo", p."Activo", p."Actualiza"
    FROM "Empleado" p
	 WHERE p."Activo" = B'1';
END;
 $$
 