CREATE FUNCTION "insertgenero"(
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
	INSERT INTO "Genero" ("NombreGenero")
   VALUES (p_Nombre);
END;
 $$
 
 ----------------------------------------------------------------------------
 --UPDATE
 CREATE FUNCTION "actualizargenero"(
	"p_idgenero" UUID,
	"p_nombregenero" VARCHAR
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Genero"
    SET "NombreGenero" = p_NombreGenero, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdGenero" = p_IdGenero
      AND "Activo" = b'1';
END;
 $$
 -----------------------------------------------------------------------------
 --Retirar
 CREATE FUNCTION "retirargenero"(
	"p_idgenero" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Genero"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdGenero" = p_IdGenero;
END;
 $$
 
 -------------------------------------------------------------------
 --Consultas
 CREATE FUNCTION "consultagenero"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdGenero", p."NombreGenero", p."Activo", p."Actualiza"
    FROM "Genero" p
    WHERE p."Activo" = B'1';
END;
 $$
 
 ------------------------------------
 CREATE FUNCTION "consultageneroporid"(
	"p_idgenero" UUID
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
    SELECT p."IdGenero", p."NombreGenero", p."Activo", p."Actualiza"
    FROM "Genero" p
    WHERE p."IdGenero" = p_IdGenero
      AND p."Activo" = B'1';
END;
 $$