CREATE FUNCTION "insertboleta"(
	"p_nombreboleta" VARCHAR,
	"p_idcategoria" UUID,
	"p_idlugar" UUID,
	"p_idorganizador" UUID,
	"p_fecha" DATE,
	"p_hora" TIME,
	"p_precio" NUMERIC,
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
	INSERT INTO "Boleta" ("NombreBoleta", "IdCategoria", "IdLugar", "IdOrganizador", "Fecha", "Hora", "Precio", "IdEstadoBoleta")
   VALUES (p_NombreBoleta, p_IdCategoria, p_IdLugar, p_IdOrganizador, p_Fecha, p_Hora, p_Precio, p_IdEstadoBoleta);
END;
 $$
 
 ------------------------------------------------------------
 --UPDATE
 CREATE FUNCTION "actualizarboleta"(
	"p_idboleta" UUID,
	"p_nombreboleta" VARCHAR,
	"p_idcategoria" UUID,
	"p_idlugar" UUID,
	"p_idorganizador" UUID,
	"p_fecha" DATE,
	"p_hora" TIME,
	"p_precio" NUMERIC,
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
    UPDATE "Boleta"
    SET "NombreBoleta" = p_NombreBoleta, "IdCategoria" = p_IdCategoria, "IdLugar" = p_IdLugar, "IdOrganizador" = p_IdOrganizador, "Fecha" = p_Fecha, "Hora" = p_Hora, "Precio" = p_Precio,"IdEstadoBoleta" = p_IdEstadoBoleta, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdBoleta" = p_IdBoleta
      AND "Activo" = b'1';
END;
 $$
 -------------------------------------------------------------------------------
 --retirar
 CREATE FUNCTION "retirarboleta"(
	"p_idboleta" UUID
)
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    UPDATE "Boleta"
    SET "Activo" = b'0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdBoleta" = p_IdBoleta;
END;
 $$
 -------------------------------------------------------------------------------------
 --Consultas
 CREATE FUNCTION "consultaboleta"()
RETURNS UNKNOWN
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
$$ 
BEGIN
    RETURN QUERY
    SELECT p."IdBoleta", p."NombreBoleta", p."IdCategoria", p."IdLugar", p."IdOrganizador", p."Fecha",p."Hora", p."Precio", p."IdEstadoBoleta", p."Activo", p."Actualiza"
    FROM "Boleta" p
	 WHERE p."Activo" = B'1';
END;
 $$
 --------------------------------------
 CREATE FUNCTION "consultaboletaporid"(
	"p_idboleta" UUID
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
    SELECT p."IdBoleta", p."NombreBoleta", p."IdCategoria", p."IdLugar", p."IdOrganizador", p."Fecha",p."Hora", p."Precio", p."IdEstadoBoleta", p."Activo", p."Actualiza"
    FROM "Boleta" p
    WHERE p."IdBoleta" = p_IdBoleta
      AND p."Activo" = B'1';
END;
 $$