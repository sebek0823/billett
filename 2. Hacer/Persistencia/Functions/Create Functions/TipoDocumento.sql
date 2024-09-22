CREATE FUNCTION "inserttipodocumento"(
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
	INSERT INTO "TipoDocumento" ("NombreDocumento")
   VALUES (p_Nombre);
END;
 $$
 
 --------------------------------------------------------------
 --UPDATE
 
 CREATE FUNCTION "actualizartipodocumento"(
	"p_iddocumento" UUID,
	"p_nombredocumento" VARCHAR
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "TipoDocumento"
    SET "NombreDocumento" = p_NombreDocumento, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDocumento" = p_IdDocumento
      AND "Activo" = b'1';
END;
 $$
 -------------------------------------------------------------------
 --Retirar
 CREATE FUNCTION "retirardocumento"(
	"p_iddocumento" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Documento"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDocumento" = p_IdDocumento;
END;
 $$
 ---------------------------------------
 --Consultas
 CREATE FUNCTION "consultatipodocumento"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdDocumento", p."NombreDocumento", p."Activo", p."Actualiza"
    FROM "TipoDocumento" p
    WHERE p."Activo" = B'1';
END;
 $$
 
 -------------------------------
 CREATE FUNCTION "consultatipodocumentoporid"(
	"p_iddocumento" UUID
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
    SELECT p."IdDocumento", p."NombreDocumento", p."Activo", p."Actualiza"
    FROM "TipoDocumento" p
    WHERE p."IdDocumento" = p_IdDocumento
      AND p."Activo" = B'1';
END;
 $$