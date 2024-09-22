CREATE FUNCTION "insertcategoria"(
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
	INSERT INTO "Categoria" ("NombreCategoria")
   VALUES (p_Nombre);
END;
 $$
 
 ----------------------------------------------------
 --UPDATE
 
 CREATE FUNCTION "actualizarcategoria"(
	"p_idcategoria" UUID,
	"p_nombrecategoria" VARCHAR
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Categoria"
    SET "NombreCategoria" = p_NombreCategoria, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCategoria" = p_IdCategoria
      AND "Activo" = b'1';
END;
 $$
 ------------------------------------------------------
 
 --Retirar
 CREATE FUNCTION "retirarcategoria"(
	"p_idcategoria" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Categoria"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCategoria" = p_IdCategoria;
END;
 $$
 -------------------------------------------------------------
 --Consultas
 CREATE FUNCTION "consultacategoria"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdCategoria", p."NombreCategoria", p."Activo", p."Actualiza"
    FROM "Categoria" p
    WHERE p."Activo" = B'1';
END;
 $$
 
 --------------------------------------------------------------
CREATE FUNCTION "consultacategoriaporid"(
	"p_idcategoria" UUID
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
    SELECT p."IdCategoria", p."NombreCategoria", p."Activo", p."Actualiza"
    FROM "Categoria" p
    WHERE p."IdCategoria" = p_IdCategoria
      AND p."Activo" = B'1';
END;
 $$