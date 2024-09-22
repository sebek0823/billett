CREATE FUNCTION "insertciudad"(
	"p_nombre" VARCHAR,
	"p_iddepartamento" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
	INSERT INTO "Ciudad" ("IdDepartamento", "NombreCiudad")
   VALUES (p_IdDepartamento, p_Nombre);
END;
 $$
 
 ---------------------------------------------------------------
 --UPDATE
 CREATE FUNCTION "actualizarciudad"(
	"p_idciudad" UUID,
	"p_nombreciudad" VARCHAR,
	"p_iddepartamento" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Ciudad"
    SET "NombreCiudad" = p_NombreCiudad, "IdDepartamento" = p_IdDepartamento, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCiudad" = p_IdCiudad
      AND "Activo" = b'1';
END;
 $$
 -----------------------------------------------------------------
 --Retirar
 CREATE FUNCTION "retirarciudad"(
	"p_idciudad" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Ciudad"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCiudad" = p_IdCiudad;
END;
 $$
 
 --------------------------------------------------------------------
 --Consultas
 CREATE FUNCTION "consultaciudad"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdCiudad", p."IdDepartamento",p."NombreCiudad", p."Activo", p."Actualiza"
    FROM "Ciudad" p
    WHERE p."Activo" = B'1';
END;
 $$
 
 -----------------------------------
 CREATE FUNCTION "consultaciudadporid"(
	"p_idciudad" UUID
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
    SELECT p."IdCiudad", p."IdDepartamento", p."NombreCiudad", p."Activo", p."Actualiza"
    FROM "Ciudad" p
    WHERE p."IdCiudad" = p_IdCiudad
      AND p."Activo" = B'1';
END;
 $$