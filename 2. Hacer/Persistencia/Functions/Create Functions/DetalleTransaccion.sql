CREATE FUNCTION "insertdetalletransaccion"(
	"p_idboleta" UUID,

	"p_idtransaccion" UUID,
	"p_numeroboleta" VARCHAR,
	"p_cantidad" INTEGER,
	"p_descuento" NUMERIC,
	"p_subtotal" NUMERIC
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
	INSERT INTO "DetalleTransaccion" ("IdBoleta", "IdTransaccion", "NumeroBoleta", "Cantidad", "Descuento", "Subtotal")
   VALUES (p_IdBoleta, p_IdTransaccion, p_NumeroBoleta, p_Cantidad, p_Descuento, p_Subtotal);
END;
 $$
------------------------------------------------------------------------------------------------------- 
  --UPDATE
 
 CREATE FUNCTION "actualizardetalletransaccion"(
	"p_iddetalletransaccion" UUID,
	"p_idboleta" UUID,

	"p_idtransaccion" UUID,
	"p_numeroboleta" VARCHAR,
	"p_cantidad" INTEGER,
	"p_descuento" NUMERIC,
	"p_subtotal" NUMERIC
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "DetalleTransaccion"
    SET "IdBoleta" = p_IdBoleta,
	  "IdTransaccion" = p_IdTransaccion, "NumeroBoleta" = p_NumeroBoleta, "Cantidad" = p_Cantidad, 
	  "Descuento" = p_Descuento, "Subtotal" = p_Subtotal, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDetalleTransaccion" = p_IdDetalleTransaccion
      AND "Activo" = b'1';
END;
 $$
 -------------------------------------------------------------------------------------
 --Retirar
 CREATE FUNCTION "retirardetalletransaccion"(
	"p_iddetalletransaccion" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "DetalleTransaccion"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDetalleTransaccion" = p_IdDetalleTransaccion;
END;
 $$
 ----------------------------------------------------
 --Consultas
 CREATE FUNCTION "consultadetalletransaccion"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdDetalleTransaccion", p."IdBoleta", p."IdTransaccion", p."NumeroBoleta", p."Cantidad", p."Descuento", p."Subtotal", p."Activo", p."Actualiza"
    FROM "DetalleTransaccion" p
	 WHERE p."Activo" = B'1';
END;
 $$
 
 -----------------------------------------------------
 
 CREATE FUNCTION "consultadetalletransaccionporid"(
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
    SELECT p."IdDetalleTransaccion", p."IdBoleta", p."IdTransaccion", p."NumeroBoleta", p."Cantidad", p."Descuento", p."Subtotal", p."Activo", p."Actualiza"
    FROM "DetalleTransaccion" p
    WHERE p."IdDetalleTransaccion" = p_IdDetalleTransaccion
      AND p."Activo" = B'1';
END;
 $$