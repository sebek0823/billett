CREATE FUNCTION "insertlugar"(
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
	INSERT INTO "Lugar" ("NombreLugar")
   VALUES (p_Nombre);
END;
 $$
 
 --------------------------------------------------------
 --UPDATE
 CREATE FUNCTION "actualizarlugar"(
	"p_idlugar" UUID,
	"p_nombrelugar" VARCHAR
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Lugar"
    SET "NombreLugar" = p_NombreLugar, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdLugar" = p_IdLugar
      AND "Activo" = b'1';
END;
 $$
 
 --------------------------------------------------------------
 --Retirar
 CREATE FUNCTION "retirarlugar"(
	"p_idlugar" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Lugar"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdLugar" = p_IdLugar;
END;
 $$
 
 -----------------------------------------------------------
 --Consultas
 CREATE FUNCTION "consultalugar"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdLugar", p."NombreLugar", p."Activo", p."Actualiza"
    FROM "Lugar" p
    WHERE p."Activo" = B'1';
END;
 $$
 
 --------------------------------------------------------------
 CREATE FUNCTION "consultalugarporid"(
	"p_idlugar" UUID
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
    SELECT p."IdLugar", p."NombreLugar", p."Activo", p."Actualiza"
    FROM "Lugar" p
    WHERE p."IdLugar" = p_IdLugar
      AND p."Activo" = B'1';
END;
 $$
 
 ----------------------------------------------------