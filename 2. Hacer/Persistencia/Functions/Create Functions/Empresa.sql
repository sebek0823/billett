CREATE FUNCTION "insertempresa"(
	"p_nit" VARCHAR,
	"p_razonsocial" VARCHAR,
	"p_direccion" VARCHAR,
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
	INSERT INTO "Empresa" ("NIT", "RazonSocial", "Direccion", "Telefono")
   VALUES (p_Nit, p_RazonSocial, p_Direccion, p_Telefono);
END;
 $$
 
 --------------------------------------------------------------------------------
 --UPDATE
 
 CREATE FUNCTION "actualizarempresa"(
	"p_idempresa" UUID,
	"p_nit" VARCHAR,
	"p_razonsocial" VARCHAR,
	"p_direccion" VARCHAR,
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
    UPDATE "Empresa"
    SET "NIT" = p_NIT, "RazonSocial" = p_RazonSocial, "Direccion" = p_Direccion, "Telefono" = p_Telefono, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEmpresa" = p_IdEmpresa
      AND "Activo" = b'1';
END;
 $$
 
 -------------------------------------------------------------------------------------
 --Retirar
 CREATE FUNCTION "retirarempresa"(
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
    UPDATE "Empresa"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEmpresa" = p_IdEmpresa;
END;
 $$
 -------------------------------------------------
 CREATE FUNCTION "consultaempresa"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdEmpresa", p."NIT", p."RazonSocial", p."Direccion", p."Telefono", p."Activo", p."Actualiza"
    FROM "Empresa" p
    WHERE p."Activo" = B'1';
END;
 $$
 -------------------------------------------------
 CREATE FUNCTION "consultaempresaporid"(
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
    RETURN QUERY
    SELECT p."IdEmpresa", p."NIT", p."RazonSocial", p."Direccion", p."Telefono", p."Activo", p."Actualiza"
    FROM "Empresa" p
    WHERE p."IdEmpresa" = p_IdEmpresa
      AND p."Activo" = B'1';
END;
 $$