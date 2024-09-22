CREATE FUNCTION "insertestadoboleta"(
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
	INSERT INTO "EstadoBoleta" ("NombreEstadoBoleta")
   VALUES (p_Nombre);
END;
 $$
 
 --------------------------------------------------------
 --UPDATE
 
 CREATE FUNCTION "actualizarestadoboleta"(
	"p_idestadoboleta" UUID,
	"p_nombreestadoboleta" VARCHAR
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "EstadoBoleta"
    SET "NombreEstadoBoleta" = p_NombreEstadoBoleta, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEstadoBoleta" = p_IdEstadoBoleta
      AND "Activo" = b'1';
END;
 $$
 
 -----------------------------------------------------------------
 
 --Retirar
 CREATE FUNCTION "retirarestadoboleta"(
	"p_idestadoboleta" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "EstadoBoleta"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEstadoBoleta" = p_IdEstadoBoleta;
END;
 $$
 
 -------------------------------------------------------------------
 --Consultas
 CREATE FUNCTION "consultaestadoboleta"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdEstadoBoleta", p."NombreEstadoBoleta", p."Activo", p."Actualiza"
    FROM "EstadoBoleta" p
    WHERE p."Activo" = B'1';
END;
 $$
 --------------------------------------------------
 CREATE FUNCTION "consultaestadoboletaporid"(
	"p_idestadoboleta" UUID
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
    SELECT p."IdEstadoBoleta", p."NombreEstadoBoleta", p."Activo", p."Actualiza"
    FROM "EstadoBoleta" p
    WHERE p."IdEstadoBoleta" = p_IdEstadoBoleta
      AND p."Activo" = B'1';
END;
 $$