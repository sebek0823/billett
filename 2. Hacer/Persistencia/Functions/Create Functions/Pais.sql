CREATE FUNCTION "insertpais"(
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
	INSERT INTO "Pais" ("NombrePais")
   VALUES (p_nombre);
END;
 $$
 
 ---------------------------------------------------
 
--UPDATE
CREATE FUNCTION "actualizarpais"(
	"p_idpais" UUID,
	"p_nombrepais" VARCHAR
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Pais"
    SET "NombrePais" = p_NombrePais, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdPais" = p_IdPais
      AND "Activo" = b'1';
END;
 $$
 
-----------------------------------------------------
 --Retirar
CREATE FUNCTION "retirarpais"(
	"p_idpais" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Pais"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdPais" = p_IdPais;
END;
 $$
 
 ----------------------------------------------------------
 --Consultas
 CREATE FUNCTION "consultapais"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdPais", p."NombrePais", p."Activo", p."Actualiza"
    FROM "Pais" p
    WHERE p."Activo" = B'1';
END;
 $$
 
 ----------------
 CREATE FUNCTION "consultapaisporid"(
	"p_idpais" UUID
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
    SELECT p."IdPais", p."NombrePais", p."Activo", p."Actualiza"
    FROM "Pais" p
    WHERE p."IdPais" = p_IdPais
      AND p."Activo" = B'1';
END;
 $$
  