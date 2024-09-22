CREATE FUNCTION "insertcargo"(
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
	INSERT INTO "Cargo" ("NombreCargo")
   VALUES (p_Nombre);
END;
 $$
 
 ------------------------------------------------------------
 --UPDATE
 
 CREATE FUNCTION "actualizarcargo"(
	"p_idcargo" UUID,
	"p_nombrecargo" VARCHAR
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Cargo"
    SET "NombreCargo" = p_NombreCargo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCargo" = p_IdCargo
      AND "Activo" = b'1';
END;
 $$
 -----------------------------------------------------------------
 
 --Retirar
 CREATE FUNCTION "retirarcargo"(
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
    UPDATE "Cargo"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCargo" = p_IdCargo;
END;
 $$
 
 --------------------------------------------------------------
 --Consultas
 CREATE FUNCTION "consultacargo"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdCargo", p."NombreCargo", p."Activo", p."Actualiza"
    FROM "Cargo" p
    WHERE p."Activo" = B'1';
END;
 $$
 -----------------------------------------
 CREATE FUNCTION "consultacargoporid"(
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
    RETURN QUERY
    SELECT p."IdCargo", p."NombreCargo", p."Activo", p."Actualiza"
    FROM "Cargo" p
    WHERE p."IdCargo" = p_IdCargo
      AND p."Activo" = B'1';
END;
 $$