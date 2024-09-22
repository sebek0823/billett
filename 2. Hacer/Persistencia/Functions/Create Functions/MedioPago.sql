CREATE FUNCTION "insertmediopago"(
	"p_nombre" VARCHAR
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
	INSERT INTO "MedioPago" ("NombreMedioPago")
   VALUES (p_Nombre);
END;
 $$
 
 ------------------------------------------------------------------
 
 --UPDATE
 CREATE FUNCTION "actualizarmediopago"(
	"p_idmediopago" UUID,
	"p_nombremediopago" VARCHAR
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "MedioPago"
    SET "NombreMedioPago" = p_NombreMedioPago, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdMedioPago" = p_IdMedioPago
      AND "Activo" = b'1';
END;
 $$
 --------------------------------------------------------------------
 --Retirar
 CREATE FUNCTION "retirarmediopago"(
	"p_idmediopago" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "MedioPago"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdMedioPago" = p_IdMedioPago;
END;
 $$
 
 ---------------------------------------------------------------------
 --Consultas
 CREATE FUNCTION "consultamediopago"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdMedioPago", p."NombreMedioPago", p."Activo", p."Actualiza"
    FROM "MedioPago" p
    WHERE p."Activo" = B'1';
END;
 $$
 
 ---------------
 CREATE FUNCTION "consultamediopagoporid"(
	"p_idmediopago" UUID
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
    SELECT p."IdMedioPago", p."NombreMedioPago", p."Activo", p."Actualiza"
    FROM "MedioPago" p
    WHERE p."IdMedioPago" = p_IdMedioPago
      AND p."Activo" = B'1';
END;
 $$