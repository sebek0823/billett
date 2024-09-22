CREATE FUNCTION "insertdepartamento"(
	"p_nombre" VARCHAR,
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
	INSERT INTO "Departamento" ("IdPais", "NombreDepartamento")
   VALUES (p_IdPais, p_Nombre);
END;
 $$
 
 -------------------------------------------------------------------
 --UPDATE
 
 CREATE FUNCTION "actualizardepartamento"(
	"p_iddepartamento" UUID,
	"p_nombredepartamento" VARCHAR,
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
    UPDATE "Departamento"
    SET "NombreDepartamento" = p_NombreDepartamento, "IdPais" = p_IdPais, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDepartamento" = p_IdDepartamento
      AND "Activo" = b'1';
END;
 $$
 
 -------------------------------------------------
 
 --Reirar
 CREATE FUNCTION "retirardepartamento"(
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
    UPDATE "Departamento"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDepartamento" = p_IdDepartamento;
END;
 $$
 
 --------------------------------------------------------------
 --Consultas
 CREATE FUNCTION "consultadepartamento"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdDepartamento", p."IdPais",p."NombreDepartamento", p."Activo", p."Actualiza"
    FROM "Departamento" p
    WHERE p."Activo" = B'1';
END;
 $$
 
 ----------
 CREATE FUNCTION "consultadepartamentoporid"(
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
    RETURN QUERY
    SELECT p."IdDepartamento", p."IdPais", p."NombreDepartamento", p."Activo", p."Actualiza"
    FROM "Departamento" p
    WHERE p."IdDepartamento" = p_IdDepartamento
      AND p."Activo" = B'1';
END;
 $$