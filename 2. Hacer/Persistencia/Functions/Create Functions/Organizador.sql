CREATE FUNCTION "insertorganizador"(
	"p_nombre" VARCHAR,
	"p_telefono" VARCHAR
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
	INSERT INTO "Organizador" ("NombreOrganizador", "Telefono")
   VALUES (p_Nombre, p_Telefono);
END;
 $$
 
 -------------------------------------------------------------------
 --UPDATE
 CREATE FUNCTION "actualizarorganizador"(
	"p_idorganizador" UUID,
	"p_nombreorganizador" VARCHAR,
	"p_telefono" VARCHAR
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Organizador"
    SET "NombreOrganizador" = p_NombreOrganizador, "Telefono" = p_Telefono, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdOrganizador" = p_IdOrganizador
      AND "Activo" = b'1';
END;
 $$
 --------------------------------------------------------------------------
 --Retirar
 CREATE FUNCTION "retirarorganizador"(
	"p_idorganizador" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Organizador"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdOrganizador" = p_IdOrganizador;
END;
 $$
 ------------------------------------------------------
 --Consultas
 CREATE FUNCTION "consultaorganizador"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdOrganizador", p."NombreOrganizador", p."Telefono", p."Activo", p."Actualiza"
    FROM "Organizador" p
    WHERE p."Activo" = B'1';
END;
 $$
 -------------------------------------------
 CREATE FUNCTION "consultaorganizadorporid"(
	"p_idorganizador" UUID
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
    SELECT p."IdOrganizador", p."NombreOrganizador", p."Activo", p."Actualiza"
    FROM "Organizador" p
    WHERE p."IdOrganizador" = p_IdOrganizador
      AND p."Activo" = B'1';
END;
 $$