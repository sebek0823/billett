CREATE FUNCTION "inserttransaccion"(
	"p_totalventa" NUMERIC,
	"p_idmediopago" UUID,
	"p_idcliente" UUID,
	"p_idempleado" UUID,
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
	INSERT INTO "Transaccion" ("TotalVenta", "IdMedioPago", "IdCliente", "IdEmpleado", "p_idciudad")
   VALUES (p_TotalVenta, p_IdMedioPago, p_IdCliente, p_IdEmpleado, p_idciudad);
END;
 $$
 
 ----------------------------------------------------------------------------
--UPDATE
CREATE FUNCTION "actualizartransaccion"(
	"p_idtransaccion" UUID,
	"p_totalventa" NUMERIC,
	"p_idmediopago" UUID,
	"p_idcliente" UUID,
	"p_idempleado" UUID,
	"p_idciudad" UUID,
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Transaccion"
    SET "TotalVenta" = p_TotalVenta, "IdMedioPago" = p_IdMedioPago, "IdCliente" = p_IdCliente, "IdEmpleado" = p_IdEmpleado, 
	"IdCiudad" = p_IdCiudad, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTransaccion" = p_IdTransaccion
      AND "Activo" = b'1';
END;
 $$
 
 ----------------------------------------------------------------------------------
 --Retirar
CREATE FUNCTION "retirartransaccion"(
	"p_idtransaccion" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Transaccion"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTransaccion" = p_IdTransaccion;
END;
 $$
 ---------------------------------
 --Consultas
 
 CREATE FUNCTION "consultatransaccion"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdTransaccion", p."TotalVenta", p."IdMedioPago", p."IdCliente", p."IdEmpleado", p."IdCiudad", p."Activo", p."Actualiza"
    FROM "Transaccion" p
	 WHERE p."Activo" = B'1';
END;
 $$
 -------------------------------------
 CREATE FUNCTION "consultatransaccionporid"(
	"p_idtransaccion" UUID
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
    SELECT p."IdTransaccion", p."TotalVenta", p."IdMedioPago", p."IdCliente", p."IdEmpleado", p."IdCiudad", p."Activo", p."Actualiza"
    FROM "Transaccion" p
    WHERE p."IdTransaccion" = p_IdTransaccion
      AND p."Activo" = B'1';
END;
 $$