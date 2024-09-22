CREATE FUNCTION "insertcliente"(
	"p_nombrecliente" VARCHAR,
	"p_iddocumento" UUID,
	"p_numerodocumento" VARCHAR,
	"p_idgenero" UUID,
	"p_idestadocivil" UUID,
	"p_telefono" VARCHAR,
	"p_correo" VARCHAR
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
	INSERT INTO "Cliente" ("NombreCliente", "IdDocumento", "NumeroDocumento", "IdGenero", "IdEstadoCivil", "Telefono", "Correo")
   VALUES (p_NombreCliente, p_IdDocumento, p_NumeroDocumento, p_IdGenero, p_Idestadocivil ,p_Telefono, p_Correo);
END;
 $$
 
 ---------------------------------------------------------------------------------------------
 --UPDATE
 
 CREATE FUNCTION "actualizarcliente"(
	"p_idcliente" UUID,
	"p_nombrecliente" VARCHAR,
	"p_iddocumento" VARCHAR,
	"p_numerodocumento" VARCHAR,
	"p_idgenero" UUID,
	"p_idestadocivil" UUID,
	"p_telefono" VARCHAR,
	"p_correo" VARCHAR
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Cliente"
    SET "NombreCliente" = p_NombreCliente, "IdDocumento" = p_IdDocumento, "NumeroDocumento" = p_NumeroDocumento, "IdGenero" = p_IdGenero, 
	"IdEstadoCivil" = p_idestadocivil, "Telefono" = p_Telefono, "Correo" = p_Correo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCliente" = p_idcliente
      AND "Activo" = b'1';
END;
 $$
 
 ------------------------------------------------------------------------------------------
 --Retirar
 CREATE FUNCTION "retirarcliente"(
	"p_idcliente" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Cliente"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCliente" = p_IdCliente;
END;
 $$
 
 -----------------------------------------------------------
 --Cosultas
 CREATE FUNCTION "consultacliente"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdCliente", p."NombreCliente", p."IdDocumento", p."NumeroDocumento", p."IdGenero", p."IdEstadoCivil", p."Telefono",p."Correo", p."Activo", p."Actualiza"
    FROM "Cliente" p
	 WHERE p."Activo" = B'1';
END;
 $$
 -----------------------------------------------------
 CREATE FUNCTION "consultaclienteporid"(
	"p_idcliente" UUID
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
    SELECT p."IdCliente", p."NombreCliente", p."IdDocumento", p."NumeroDocumento", p."IdGenero", p."IdEstadoCivil", p."Telefono",p."Correo", p."Activo", p."Actualiza"
    FROM "Cliente" p
    WHERE p."IdCliente" = p_IdCliente
      AND p."Activo" = B'1';
END;
 $$