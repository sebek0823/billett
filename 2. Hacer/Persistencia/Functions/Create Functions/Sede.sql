CREATE FUNCTION "insertsede"(
	"p_nombresede" VARCHAR,
	"p_direccion" VARCHAR,
	"p_telefono" VARCHAR,
	"p_idempresa" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
	INSERT INTO "Sede" ("NombreSede", "Direccion", "Telefono", "IdEmpresa")
   VALUES (p_NombreSede, p_Direccion, p_Telefono, p_IdEmpresa);
END;
 $$
 
 ----------------------------------------------------------
 --UPDATE
 CREATE FUNCTION "actualizarsede"(
	"p_idsede" UUID,
	"p_nombresede" VARCHAR,
	"p_direccion" VARCHAR,
	"p_telefono" VARCHAR,
	"p_idempresa" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Sede"
    SET "NombreSede" = p_NombreSede, "Direccion" = p_Direccion, "Telefono" = p_Telefono, "IdEmpresa" = p_IdEmpresa, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdSede" = p_IdSede
      AND "Activo" = b'1';
END;
 $$
 -------------------------------------------------------------------
 --Retirar
 CREATE FUNCTION "retirarsede"(
	"p_idsede" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Sede"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdSede" = p_IdSede;
END;
 $$
 -------------------------------------------------------
 --Consultas
 CREATE FUNCTION "consultasede"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdSede", p."NombreSede", p."Direccion", p."Telefono", p."IdEmpresa", p."Activo", p."Actualiza"
    FROM "Sede" p
    WHERE p."Activo" = B'1';
END;
 $$
 -----------------------------------
 CREATE FUNCTION "consultasedeporid"(
	"p_idsede" UUID
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
    SELECT p."IdSede", p."NombreSede", p."Direccion", p."Telefono", p."IdEmpresa", p."Activo", p."Actualiza"
    FROM "Sede" p
    WHERE p."IdSede" = p_IdSede
      AND p."Activo" = B'1';
END;
 $$