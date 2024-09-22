CREATE OR REPLACE FUNCTION InsertPais(p_nombre VARCHAR)
RETURNS VOID AS '
BEGIN
	INSERT INTO "Pais" ("NombrePais")
   VALUES (p_nombre);
END;
' LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION ActualizarPais(
	"p_idpais" UUID,
	"p_nombrepais" VARCHAR
)
RETURNS VOID AS '
BEGIN
    UPDATE "Pais"
    SET "NombrePais" = p_NombrePais, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdPais" = p_IdPais
      AND "Activo" = b''1'';
END;
' LANGUAGE plpgsql;
 
 --Retirar
CREATE OR REPLACE FUNCTION RetirarPais(
	"p_idpais" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Pais"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdPais" = p_idpais;
END;
 ' LANGUAGE plpgsql;
 
--Consultas
CREATE OR REPLACE FUNCTION "ConsultaPais"()
RETURNS TABLE(
"IdPais" UUID, 
"NombrePais" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP) AS '
BEGIN
    RETURN QUERY
    SELECT p."IdPais", p."NombrePais", p."Activo", p."Actualiza"
    FROM "Pais" p
    WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 
 
 CREATE OR REPLACE FUNCTION "ConsultaPaisPorId"(
	"p_idpais" UUID
)
RETURNS TABLE(
"IdPais" UUID, 
"NombrePais" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP) AS '
BEGIN
    RETURN QUERY
    SELECT p."IdPais", p."NombrePais", p."Activo", p."Actualiza"
    FROM "Pais" p
    WHERE p."IdPais" = p_idpais
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "InsertDepartamento"(
	"p_nombre" VARCHAR,
	"p_idpais" UUID
)
RETURNS VOID AS '
BEGIN
	INSERT INTO "Departamento" ("IdPais", "NombreDepartamento")
   VALUES (p_IdPais, p_Nombre);
END;
'LANGUAGE plpgsql; 
 
 -------------------------------------------------------------------
 --UPDATE
 
 CREATE OR REPLACE FUNCTION "ActualizarDepartamento"(
	"p_iddepartamento" UUID,
	"p_nombredepartamento" VARCHAR,
	"p_idpais" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Departamento"
    SET "NombreDepartamento" = p_NombreDepartamento, "IdPais" = p_IdPais, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDepartamento" = p_IdDepartamento
      AND "Activo" = b''1'';
END;
 'LANGUAGE plpgsql;
 
 -------------------------------------------------
 
 --Reirar
 CREATE OR REPLACE FUNCTION "RetirarDepartamento"(
	"p_iddepartamento" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Departamento"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDepartamento" = p_IdDepartamento;
END;
'LANGUAGE plpgsql;
 
 --------------------------------------------------------------
 --Consultas
 CREATE OR REPLACE FUNCTION "ConsultaDepartamento"()
RETURNS TABLE("IdDepartamento" UUID, 
"NombreDepartamento" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS'
BEGIN
    RETURN QUERY
    SELECT p."IdDepartamento", p."IdPais",p."NombreDepartamento", p."Activo", p."Actualiza"
    FROM "Departamento" p
    WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 
 ----------
 CREATE OR REPLACE FUNCTION "ConsultaDepartamentoPorId"(
	"p_iddepartamento" UUID
)
RETURNS TABLE("IdDepartamento" UUID, 
"NombreDepartamento" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS'
BEGIN
    RETURN QUERY
    SELECT p."IdDepartamento", p."IdPais", p."NombreDepartamento", p."Activo", p."Actualiza"
    FROM "Departamento" p
    WHERE p."IdDepartamento" = p_IdDepartamento
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 
 CREATE OR REPLACE FUNCTION "InsertCiudad"(
	"p_nombre" VARCHAR,
	"p_iddepartamento" UUID
)
RETURNS VOID AS '
BEGIN
	INSERT INTO "Ciudad" ("IdDepartamento", "NombreCiudad")
   VALUES (p_IdDepartamento, p_Nombre);
END;
 ' LANGUAGE plpgsql;
 
 ---------------------------------------------------------------
 --UPDATE
 CREATE OR REPLACE FUNCTION "ActualizarCiudad"(
	"p_idciudad" UUID,
	"p_nombreciudad" VARCHAR,
	"p_iddepartamento" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Ciudad"
    SET "NombreCiudad" = p_NombreCiudad, "IdDepartamento" = p_IdDepartamento, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCiudad" = p_IdCiudad
      AND "Activo" = b''1'';
END;
'LANGUAGE plpgsql;
 -----------------------------------------------------------------
 --Retirar
 CREATE OR REPLACE FUNCTION "RetirarCiudad"(
	"p_idciudad" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Ciudad"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCiudad" = p_IdCiudad;
END;
'LANGUAGE plpgsql;
 
 --------------------------------------------------------------------
 --Consultas
 CREATE OR REPLACE FUNCTION "ConsultaCiudad"()
RETURNS TABLE(
"IdCiudad" UUID, 
"IdDepartamento" UUID, 
"NombreCiudad" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP) AS'
BEGIN
    RETURN QUERY
    SELECT p."IdCiudad", p."IdDepartamento",p."NombreCiudad", p."Activo", p."Actualiza"
    FROM "Ciudad" p
    WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 
 -----------------------------------
 CREATE OR REPLACE FUNCTION "ConsultaCiudadPorId"(
	"p_idciudad" UUID
)
RETURNS TABLE(
"IdCiudad" UUID, 
"IdDepartamento" UUID, 
"NombreCiudad" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP) AS'
BEGIN
    RETURN QUERY
    SELECT p."IdCiudad", p."IdDepartamento", p."NombreCiudad", p."Activo", p."Actualiza"
    FROM "Ciudad" p
    WHERE p."IdCiudad" = p_IdCiudad
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "InsertMedioPago"(
	"p_nombre" VARCHAR
)
RETURNS VOID AS ' 
BEGIN
	INSERT INTO "MedioPago" ("NombreMedioPago")
   VALUES (p_Nombre);
END;
'LANGUAGE plpgsql;
 
 ------------------------------------------------------------------
 
 --UPDATE
 CREATE OR REPLACE FUNCTION "ActualizarMedioPago"(
	"p_idmediopago" UUID,
	"p_nombremediopago" VARCHAR
)
RETURNS VOID AS '
BEGIN
    UPDATE "MedioPago"
    SET "NombreMedioPago" = p_NombreMedioPago, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdMedioPago" = p_IdMedioPago
      AND "Activo" = b''1'';
END;
'LANGUAGE plpgsql;
 --------------------------------------------------------------------
 --Retirar
 CREATE OR REPLACE FUNCTION "RetirarMediPago"(
	"p_idmediopago" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "MedioPago"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdMedioPago" = p_IdMedioPago;
END;
 'LANGUAGE plpgsql;
 
 ---------------------------------------------------------------------
 --Consultas
 CREATE OR REPLACE FUNCTION "ConsultaMedioPago"()
RETURNS TABLE(
"IdMedioPago" UUID, 
"NombreMedioPago" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS '
BEGIN
    RETURN QUERY
    SELECT p."IdMedioPago", p."NombreMedioPago", p."Activo", p."Actualiza"
    FROM "MedioPago" p
    WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 
 ---------------
 CREATE OR REPLACE FUNCTION "ConsultaMedioPagoPorId"(
	"p_idmediopago" UUID
)
RETURNS TABLE(
"IdMedioPago" UUID, 
"NombreMedioPago" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS '
BEGIN
    RETURN QUERY
    SELECT p."IdMedioPago", p."NombreMedioPago", p."Activo", p."Actualiza"
    FROM "MedioPago" p
    WHERE p."IdMedioPago" = p_IdMedioPago
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "InsertGenero"(
	"p_nombre" VARCHAR
)
RETURNS VOID AS'
BEGIN
	INSERT INTO "Genero" ("NombreGenero")
   VALUES (p_Nombre);
END;
'LANGUAGE plpgsql;
 
 ----------------------------------------------------------------------------
 --UPDATE
 CREATE FUNCTION "ActualizarGenero"(
	"p_idgenero" UUID,
	"p_nombregenero" VARCHAR
)
RETURNS VOID AS '
BEGIN
    UPDATE "Genero"
    SET "NombreGenero" = p_NombreGenero, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdGenero" = p_IdGenero
      AND "Activo" = b''1'';
END;
'LANGUAGE plpgsql;
 -----------------------------------------------------------------------------
 --Retirar
 CREATE FUNCTION "RetirarGenero"(
	"p_idgenero" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Genero"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdGenero" = p_IdGenero;
END;
'LANGUAGE plpgsql;
 
 -------------------------------------------------------------------
 --Consultas
 CREATE FUNCTION "ConsultaGenero"()
RETURNS TABLE (
"IdGenero" UUID, 
"NombreGenero" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP) AS'
BEGIN
    RETURN QUERY
    SELECT p."IdGenero", p."NombreGenero", p."Activo", p."Actualiza"
    FROM "Genero" p
    WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 
 ------------------------------------
 CREATE FUNCTION "ConsultaGeneroPorId"(
	"p_idgenero" UUID
)
RETURNS TABLE (
"IdGenero" UUID, 
"NombreGenero" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP) AS'
BEGIN
    RETURN QUERY
    SELECT p."IdGenero", p."NombreGenero", p."Activo", p."Actualiza"
    FROM "Genero" p
    WHERE p."IdGenero" = p_IdGenero
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "InsertTipoDocumento"(
	"p_nombre" VARCHAR
)
RETURNS VOID AS'
BEGIN
	INSERT INTO "TipoDocumento" ("NombreDocumento")
   VALUES (p_Nombre);
END;
'LANGUAGE plpgsql;
 
 --------------------------------------------------------------
 --UPDATE
 
 CREATE OR REPLACE FUNCTION "ActualizarTipoDocumento"(
	"p_iddocumento" UUID,
	"p_nombredocumento" VARCHAR
)
RETURNS VOID AS'
BEGIN
    UPDATE "TipoDocumento"
    SET "NombreDocumento" = p_NombreDocumento, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDocumento" = p_IdDocumento
      AND "Activo" = b''1'';
END;
'LANGUAGE plpgsql;
 -------------------------------------------------------------------
 --Retirar
 CREATE OR REPLACE FUNCTION "RetirarTipoDocumento"(
	"p_iddocumento" UUID
)
RETURNS VOID AS'
BEGIN
    UPDATE "Documento"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDocumento" = p_IdDocumento;
END;
 'LANGUAGE plpgsql;
 ---------------------------------------
 --Consultas
 CREATE OR REPLACE FUNCTION "ConsultaTipoDocumento"()
RETURNS TABLE (
"IdDocumento" UUID, 
"NombreDocumento" VARCHAR, 
"Activo" BIT,
"Actualiza" TIMESTAMP
)AS'
BEGIN
    RETURN QUERY
    SELECT p."IdDocumento", p."NombreDocumento", p."Activo", p."Actualiza"
    FROM "TipoDocumento" p
    WHERE p."Activo" = B''1'';
END;
 'LANGUAGE plpgsql;
 
 -------------------------------
 CREATE FUNCTION "ConsultaTipoDocumentoPorId"(
	"p_iddocumento" UUID
)
RETURNS TABLE (
"IdDocumento" UUID, 
"NombreDocumento" VARCHAR, 
"Activo" BIT,
"Actualiza" TIMESTAMP
)AS'
BEGIN
    RETURN QUERY
    SELECT p."IdDocumento", p."NombreDocumento", p."Activo", p."Actualiza"
    FROM "TipoDocumento" p
    WHERE p."IdDocumento" = p_IdDocumento
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION "InsertCargo"(
	"p_nombre" VARCHAR
)
RETURNS VOID AS'
BEGIN
	INSERT INTO "Cargo" ("NombreCargo")
   VALUES (p_Nombre);
END;
'LANGUAGE plpgsql;
 
 ------------------------------------------------------------
 --UPDATE
 
 CREATE OR REPLACE FUNCTION "ActualizarCargo"(
	"p_idcargo" UUID,
	"p_nombrecargo" VARCHAR
)
RETURNS VOID AS '
BEGIN
    UPDATE "Cargo"
    SET "NombreCargo" = p_NombreCargo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCargo" = p_IdCargo
      AND "Activo" = b''1'';
END;
 'LANGUAGE plpgsql;
 -----------------------------------------------------------------
 
 --Retirar
 CREATE OR REPLACE FUNCTION "RetirarCargo"(
	"p_idcargo" UUID
)
RETURNS VOID AS'
BEGIN
    UPDATE "Cargo"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCargo" = p_IdCargo;
END;
' LANGUAGE plpgsql;
 
 --------------------------------------------------------------
 --Consultas
 CREATE OR REPLACE FUNCTION "ConsultaCargo"()
RETURNS TABLE (
"IdCargo" UUID, 
"NombreCargo" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS '
BEGIN
    RETURN QUERY
    SELECT p."IdCargo", p."NombreCargo", p."Activo", p."Actualiza"
    FROM "Cargo" p
    WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 -----------------------------------------
 CREATE FUNCTION "ConsultaCargoPorId"(
	"p_idcargo" UUID
)
RETURNS TABLE (
"IdCargo" UUID, 
"NombreCargo" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS '
BEGIN
    RETURN QUERY
    SELECT p."IdCargo", p."NombreCargo", p."Activo", p."Actualiza"
    FROM "Cargo" p
    WHERE p."IdCargo" = p_IdCargo
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION "InsertLugar"(
	"p_nombre" VARCHAR
)
RETURNS VOID AS ' 
BEGIN
	INSERT INTO "Lugar" ("NombreLugar")
   VALUES (p_Nombre);
END;
'LANGUAGE plpgsql;
 
 --------------------------------------------------------
 --UPDATE
 CREATE OR REPLACE FUNCTION "ActualizarLugar"(
	"p_idlugar" UUID,
	"p_nombrelugar" VARCHAR
)
RETURNS VOID AS '
BEGIN
    UPDATE "Lugar"
    SET "NombreLugar" = p_NombreLugar, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdLugar" = p_IdLugar
      AND "Activo" = b''1'';
END;
'LANGUAGE plpgsql;
 
 --------------------------------------------------------------
 --Retirar
 CREATE OR REPLACE FUNCTION "RetirarLugar"(
	"p_idlugar" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Lugar"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdLugar" = p_IdLugar;
END;
'LANGUAGE plpgsql;
 
 -----------------------------------------------------------
 --Consultas
 CREATE OR REPLACE FUNCTION "ConsultaLugar"()
RETURNS TABLE(
"IdLugar" UUID, 
"NombreLugar" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS '
BEGIN
    RETURN QUERY
    SELECT p."IdLugar", p."NombreLugar", p."Activo", p."Actualiza"
    FROM "Lugar" p
    WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 
 --------------------------------------------------------------
 CREATE OR REPLACE FUNCTION "ConsultaLugarPorId"(
	"p_idlugar" UUID
)
RETURNS TABLE(
"IdLugar" UUID, 
"NombreLugar" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS '
BEGIN
    RETURN QUERY
    SELECT p."IdLugar", p."NombreLugar", p."Activo", p."Actualiza"
    FROM "Lugar" p
    WHERE p."IdLugar" = p_IdLugar
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 
 ----------------------------------------------------



CREATE OR REPLACE FUNCTION "InsertCategoria"(
	"p_nombre" VARCHAR
)
RETURNS VOID AS '
BEGIN
	INSERT INTO "Categoria" ("NombreCategoria")
   VALUES (p_Nombre);
END;
'LANGUAGE plpgsql;
 
 ----------------------------------------------------
 --UPDATE
 
 CREATE OR REPLACE FUNCTION "ActualizarCategoria"(
	"p_idcategoria" UUID,
	"p_nombrecategoria" VARCHAR
)
RETURNS VOID AS '
BEGIN
    UPDATE "Categoria"
    SET "NombreCategoria" = p_NombreCategoria, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCategoria" = p_IdCategoria
      AND "Activo" = b''1'';
END;
'LANGUAGE plpgsql;
 ------------------------------------------------------
 
 --Retirar
 CREATE OR REPLACE FUNCTION "RetirarCategoria"(
	"p_idcategoria" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Categoria"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCategoria" = p_IdCategoria;
END;
'LANGUAGE plpgsql;
 -------------------------------------------------------------
 --Consultas
 CREATE OR REPLACE FUNCTION "ConsultaCategoria"()
RETURNS TABLE(
"IdCategoria" UUID, 
"NombreCategoria" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
)AS '
BEGIN
    RETURN QUERY
    SELECT p."IdCategoria", p."NombreCategoria", p."Activo", p."Actualiza"
    FROM "Categoria" p
    WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 
 --------------------------------------------------------------
CREATE FUNCTION "ConsultaCategoriaPorId"(
	"p_idcategoria" UUID
)
RETURNS TABLE(
"IdCategoria" UUID, 
"NombreCategoria" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
)AS '
BEGIN
    RETURN QUERY
    SELECT p."IdCategoria", p."NombreCategoria", p."Activo", p."Actualiza"
    FROM "Categoria" p
    WHERE p."IdCategoria" = p_IdCategoria
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "InsertEstadoBoleta"(
	"p_nombre" VARCHAR
)
RETURNS VOID AS '
BEGIN
	INSERT INTO "EstadoBoleta" ("NombreEstadoBoleta")
   VALUES (p_Nombre);
END;
'LANGUAGE plpgsql;
 
 --------------------------------------------------------
 --UPDATE
 
 CREATE OR REPLACE FUNCTION "ActualizarEstadoBoleta"(
	"p_idestadoboleta" UUID,
	"p_nombreestadoboleta" VARCHAR
)
RETURNS VOID AS'
BEGIN
    UPDATE "EstadoBoleta"
    SET "NombreEstadoBoleta" = p_NombreEstadoBoleta, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEstadoBoleta" = p_IdEstadoBoleta
      AND "Activo" = b''1'';
END;
'LANGUAGE plpgsql;
 
 -----------------------------------------------------------------
 
 --Retirar
 CREATE OR REPLACE FUNCTION "RetirarEstadoBoleta"(
	"p_idestadoboleta" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "EstadoBoleta"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEstadoBoleta" = p_IdEstadoBoleta;
END;
'LANGUAGE plpgsql;
 
 -------------------------------------------------------------------
 --Consultas
 CREATE FUNCTION "ConsultaEstadoBoleta"()
RETURNS TABLE(
"IdEstadoBoleta" UUID, 
"NombreEstadoBoleta" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS'
BEGIN
    RETURN QUERY
    SELECT p."IdEstadoBoleta", p."NombreEstadoBoleta", p."Activo", p."Actualiza"
    FROM "EstadoBoleta" p
    WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 --------------------------------------------------
 CREATE FUNCTION "ConsultaEstadoBoletaPorId"(
	"p_idestadoboleta" UUID
)
RETURNS TABLE(
"IdEstadoBoleta" UUID, 
"NombreEstadoBoleta" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS'
BEGIN
    RETURN QUERY
    SELECT p."IdEstadoBoleta", p."NombreEstadoBoleta", p."Activo", p."Actualiza"
    FROM "EstadoBoleta" p
    WHERE p."IdEstadoBoleta" = p_IdEstadoBoleta
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "InsertOrganizador"(
	"p_nombre" VARCHAR,
	"p_telefono" VARCHAR
)
RETURNS VOID AS '
BEGIN
	INSERT INTO "Organizador" ("NombreOrganizador", "Telefono")
   VALUES (p_Nombre, p_Telefono);
END;
'LANGUAGE plpgsql;
 
 -------------------------------------------------------------------
 --UPDATE
 CREATE OR REPLACE FUNCTION "ActualizarOrganizador"(
	"p_idorganizador" UUID,
	"p_nombreorganizador" VARCHAR,
	"p_telefono" VARCHAR
)
RETURNS VOID AS '
BEGIN
    UPDATE "Organizador"
    SET "NombreOrganizador" = p_NombreOrganizador, "Telefono" = p_Telefono, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdOrganizador" = p_IdOrganizador
      AND "Activo" = b''1'';
END;
'LANGUAGE plpgsql;
 --------------------------------------------------------------------------
 --Retirar
 CREATE OR REPLACE FUNCTION "RetirarOrganizador"(
	"p_idorganizador" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Organizador"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdOrganizador" = p_IdOrganizador;
END;
'LANGUAGE plpgsql;
 ------------------------------------------------------
 --Consultas
 CREATE OR REPLACE FUNCTION "ConsultaOrganizador"()
RETURNS TABLE (
"IdOrganizador" UUID, 
"NombreOrganizador" VARCHAR, 
"Telefono" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS '
BEGIN
    RETURN QUERY
    SELECT p."IdOrganizador", p."NombreOrganizador", p."Telefono", p."Activo", p."Actualiza"
    FROM "Organizador" p
    WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 -------------------------------------------
 CREATE OR REPLACE FUNCTION "ConsultaOrganizadorPorId"(
	"p_idorganizador" UUID
)
RETURNS TABLE (
"IdOrganizador" UUID, 
"NombreOrganizador" VARCHAR, 
"Telefono" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS '
BEGIN
    RETURN QUERY
    SELECT p."IdOrganizador", p."NombreOrganizador", p."Activo", p."Actualiza"
    FROM "Organizador" p
    WHERE p."IdOrganizador" = p_IdOrganizador
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "InsertEmpresa"(
	"p_nit" VARCHAR,
	"p_razonsocial" VARCHAR,
	"p_direccion" VARCHAR,
	"p_telefono" VARCHAR
)
RETURNS VOID AS '
BEGIN
	INSERT INTO "Empresa" ("NIT", "RazonSocial", "Direccion", "Telefono")
   VALUES (p_Nit, p_RazonSocial, p_Direccion, p_Telefono);
END;
'LANGUAGE plpgsql;
 
 --------------------------------------------------------------------------------
 --UPDATE
 
 CREATE OR REPLACE FUNCTION "ActualizarEmpresa"(
	"p_idempresa" UUID,
	"p_nit" VARCHAR,
	"p_razonsocial" VARCHAR,
	"p_direccion" VARCHAR,
	"p_telefono" VARCHAR
)
RETURNS VOID AS '
BEGIN
    UPDATE "Empresa"
    SET "NIT" = p_NIT, "RazonSocial" = p_RazonSocial, "Direccion" = p_Direccion, "Telefono" = p_Telefono, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEmpresa" = p_IdEmpresa
      AND "Activo" = b''1'';
END;
'LANGUAGE plpgsql;
 
 -------------------------------------------------------------------------------------
 --Retirar
 CREATE OR REPLACE FUNCTION "RetirarEmpresa"(
	"p_idempresa" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Empresa"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEmpresa" = p_IdEmpresa;
END;
'LANGUAGE plpgsql;
 -------------------------------------------------
 CREATE OR REPLACE FUNCTION "ConsultaEmpresa"()
RETURNS TABLE (
"IdEmpresa" UUID, 
"NIT" VARCHAR, 
"RazonSocial" VARCHAR, 
"Direccion" VARCHAR, 
"Telefono" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS'
BEGIN
    RETURN QUERY
    SELECT p."IdEmpresa", p."NIT", p."RazonSocial", p."Direccion", p."Telefono", p."Activo", p."Actualiza"
    FROM "Empresa" p
    WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 -------------------------------------------------
 CREATE OR REPLACE FUNCTION "ConsultaEmpresaPorId"(
	"p_idempresa" UUID
)
RETURNS TABLE (
"IdEmpresa" UUID, 
"NIT" VARCHAR, 
"RazonSocial" VARCHAR, 
"Direccion" VARCHAR, 
"Telefono" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS'
BEGIN
    RETURN QUERY
    SELECT p."IdEmpresa", p."NIT", p."RazonSocial", p."Direccion", p."Telefono", p."Activo", p."Actualiza"
    FROM "Empresa" p
    WHERE p."IdEmpresa" = p_IdEmpresa
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "InsertSede"(
	"p_nombresede" VARCHAR,
	"p_direccion" VARCHAR,
	"p_telefono" VARCHAR,
	"p_idempresa" UUID
)
RETURNS VOID AS '
BEGIN
	INSERT INTO "Sede" ("NombreSede", "Direccion", "Telefono", "IdEmpresa")
   VALUES (p_NombreSede, p_Direccion, p_Telefono, p_IdEmpresa);
END;
'LANGUAGE plpgsql;
 
 ----------------------------------------------------------
 --UPDATE
 CREATE OR REPLACE FUNCTION "ActualizarSede"(
	"p_idsede" UUID,
	"p_nombresede" VARCHAR,
	"p_direccion" VARCHAR,
	"p_telefono" VARCHAR,
	"p_idempresa" UUID
)
RETURNS VOID AS' 
BEGIN
    UPDATE "Sede"
    SET "NombreSede" = p_NombreSede, "Direccion" = p_Direccion, "Telefono" = p_Telefono, "IdEmpresa" = p_IdEmpresa, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdSede" = p_IdSede
      AND "Activo" = b''1'';
END;
'LANGUAGE plpgsql;
 -------------------------------------------------------------------
 --Retirar
 CREATE OR REPLACE FUNCTION "RetirarSede"(
	"p_idsede" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Sede"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdSede" = p_IdSede;
END;
'LANGUAGE plpgsql;
 -------------------------------------------------------
 --Consultas
 CREATE OR REPLACE FUNCTION "ConsultaSede"()
RETURNS TABLE (
"IdSede" UUID, 
"NombreSede" VARCHAR, 
"Direccion" VARCHAR,
"Telefono" VARCHAR, 
"IdEmpresa" UUID, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS'
BEGIN
    RETURN QUERY
    SELECT p."IdSede", p."NombreSede", p."Direccion", p."Telefono", p."IdEmpresa", p."Activo", p."Actualiza"
    FROM "Sede" p
    WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 -----------------------------------
 CREATE OR REPLACE FUNCTION "ConsultaSedePorId"(
	"p_idsede" UUID
)
RETURNS TABLE (
"IdSede" UUID, 
"NombreSede" VARCHAR, 
"Direccion" VARCHAR,
"Telefono" VARCHAR, 
"IdEmpresa" UUID, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS'
BEGIN
    RETURN QUERY
    SELECT p."IdSede", p."NombreSede", p."Direccion", p."Telefono", p."IdEmpresa", p."Activo", p."Actualiza"
    FROM "Sede" p
    WHERE p."IdSede" = p_IdSede
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "InsertBoleta"(
	"p_nombreboleta" VARCHAR,
	"p_idcategoria" UUID,
	"p_idlugar" UUID,
	"p_idorganizador" UUID,
	"p_fecha" DATE,
	"p_hora" TIME,
	"p_precio" NUMERIC,
	"p_idestadoboleta" UUID
)
RETURNS VOID AS '
BEGIN
	INSERT INTO "Boleta" ("NombreBoleta", "IdCategoria", "IdLugar", "IdOrganizador", "Fecha", "Hora", "Precio", "IdEstadoBoleta")
   VALUES (p_NombreBoleta, p_IdCategoria, p_IdLugar, p_IdOrganizador, p_Fecha, p_Hora, p_Precio, p_IdEstadoBoleta);
END;
'LANGUAGE plpgsql;
 
 ------------------------------------------------------------
 --UPDATE
 CREATE OR REPLACE FUNCTION "ActualizarBoleta"(
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
RETURNS VOID AS '
BEGIN
    UPDATE "Boleta"
    SET "NombreBoleta" = p_NombreBoleta, "IdCategoria" = p_IdCategoria, "IdLugar" = p_IdLugar, "IdOrganizador" = p_IdOrganizador, "Fecha" = p_Fecha, "Hora" = p_Hora, "Precio" = p_Precio,"IdEstadoBoleta" = p_IdEstadoBoleta, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdBoleta" = p_IdBoleta
      AND "Activo" = b''1'';
END;
'LANGUAGE plpgsql;
 -------------------------------------------------------------------------------
 --retirar
 CREATE OR REPLACE FUNCTION "RetirarBoleta"(
	"p_idboleta" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Boleta"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdBoleta" = p_IdBoleta;
END;
'LANGUAGE plpgsql;
 -------------------------------------------------------------------------------------
 --Consultas
 CREATE OR REPLACE FUNCTION "ConsultaBoleta"()
RETURNS TABLE 
(
"IdBoleta" UUID, 
"NombreBoleta" VARCHAR, 
"IdCategoria" UUID, 
"IdLugar" UUID, 
"IdOrganizador" UUID, 
"Fecha" DATE,
"Hora" TIME, 
"Precio" NUMERIC, 
"IdEstadoBoleta" UUID, 
"Activo" BIT,
"Actualiza" TIMESTAMP
) AS'
BEGIN
    RETURN QUERY
    SELECT p."IdBoleta", p."NombreBoleta", p."IdCategoria", p."IdLugar", p."IdOrganizador", p."Fecha",p."Hora", p."Precio", p."IdEstadoBoleta", p."Activo", p."Actualiza"
    FROM "Boleta" p
	 WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 --------------------------------------
 CREATE FUNCTION "ConsultaBoletaPorId"(
	"p_idboleta" UUID
)
RETURNS TABLE 
(
"IdBoleta" UUID, 
"NombreBoleta" VARCHAR, 
"IdCategoria" UUID, 
"IdLugar" UUID, 
"IdOrganizador" UUID, 
"Fecha" DATE,
"Hora" TIME, 
"Precio" NUMERIC, 
"IdEstadoBoleta" UUID, 
"Activo" BIT,
"Actualiza" TIMESTAMP
) AS'
BEGIN
    RETURN QUERY
    SELECT p."IdBoleta", p."NombreBoleta", p."IdCategoria", p."IdLugar", p."IdOrganizador", p."Fecha",p."Hora", p."Precio", p."IdEstadoBoleta", p."Activo", p."Actualiza"
    FROM "Boleta" p
    WHERE p."IdBoleta" = p_IdBoleta
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "InsertEmpleado"(
	"p_nombreempleado" VARCHAR,
	"p_iddocumento" UUID,
	"p_numerodocumento" VARCHAR,
	"p_idsede" UUID,
	"p_idcargo" UUID
)
RETURNS VOID AS '
BEGIN
	INSERT INTO "Empleado" ("NombreEmpleado", "IdDocumento", "NumeroDocumento", "IdSede", "IdCargo")
   VALUES (p_NombreEmpleado, p_IdDocumento, p_NumeroDocumento, p_IdSede, p_IdCargo);
END;
'LANGUAGE plpgsql;
 
 ------------------------------------------------------------------------------
 --UPDATE
 CREATE OR REPLACE FUNCTION "ActualizarEmpleado"(
	"p_idempleado" UUID,
	"p_nombreempleado" VARCHAR,
	"p_iddocumento" VARCHAR,
	"p_numerodocumento" VARCHAR,
	"p_idsede" UUID,
	"p_idcargo" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Empleado"
    SET "NombreEmpleado" = p_NombreEmpleado, "IdDocumento" = p_IdDocumento, "NumeroDocumento" = p_NumeroDocumento, "IdSede" = p_IdSede, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEmpleado" = p_IdEmpleado
      AND "Activo" = b''1'';
END;
'LANGUAGE plpgsql;
 
 ------------------------------------------------------------------------------------------
 --Retirar
 CREATE OR REPLACE FUNCTION "RetirarEmpleado"(
	"p_idempleado" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Empleado"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEmpleado" = p_IdEmpleado;
END;
'LANGUAGE plpgsql;

 -------------------------------------------------------
 CREATE OR REPLACE FUNCTION "ConsultaEmpleadoPorId"(
	"p_idempleado" UUID
)
RETURNS TABLE 
(
"IdEmpleado" UUID, 
"NombreEmpleado" VARCHAR, 
"IdDocumento" UUID, 
"NumeroDocumento" VARCHAR, 
"IdSede" UUID, 
"IdCargo" UUID, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
)AS' 
BEGIN
    RETURN QUERY
    SELECT p."IdEmpleado", p."NombreEmpleado", p."IdDocumento", p."NumeroDocumento", p."IdSede", p."IdCargo", p."Activo", p."Actualiza"
    FROM "Empleado" p
    WHERE p."IdEmpleado" = p_IdEmpleado
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 -------------------------
 CREATE OR REPLACE FUNCTION "ConsultaEmpleado"()
RETURNS TABLE 
(
"IdEmpleado" UUID, 
"NombreEmpleado" VARCHAR, 
"IdDocumento" UUID, 
"NumeroDocumento" VARCHAR, 
"IdSede" UUID, 
"IdCargo" UUID, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
)AS' 
BEGIN
	 RETURN QUERY
    SELECT p."IdEmpleado", p."NombreEmpleado", p."IdDocumento", p."NumeroDocumento", p."IdSede", p."IdCargo", p."Activo", p."Actualiza"
    FROM "Empleado" p
	 WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 
 CREATE OR REPLACE FUNCTION "InsertCliente"(
	"p_nombrecliente" VARCHAR,
	"p_iddocumento" UUID,
	"p_numerodocumento" VARCHAR,
	"p_idgenero" UUID,
	"p_idestadocivil" UUID,
	"p_telefono" VARCHAR,
	"p_correo" VARCHAR
)
RETURNS VOID AS '
BEGIN
	INSERT INTO "Cliente" ("NombreCliente", "IdDocumento", "NumeroDocumento", "IdGenero","IdEstadoCivil", "Telefono", "Correo")
   VALUES (p_NombreCliente, p_IdDocumento, p_NumeroDocumento, p_IdGenero, p_IdEstadoCivil ,p_Telefono, p_Correo);
END;
'LANGUAGE plpgsql;
 
 ---------------------------------------------------------------------------------------------
 --UPDATE
 
 CREATE OR REPLACE FUNCTION "ActualizarCliente"(
	"p_idcliente" UUID,
	"p_nombrecliente" VARCHAR,
	"p_iddocumento" VARCHAR,
	"p_numerodocumento" VARCHAR,
	"p_idgenero" UUID,
	"p_idestadocivil" UUID,
	"p_telefono" VARCHAR,
	"p_correo" VARCHAR
)
RETURNS VOID AS '
BEGIN
    UPDATE "Cliente"
    SET "NombreCliente" = p_NombreCliente, "IdDocumento" = p_IdDocumento, "NumeroDocumento" = p_NumeroDocumento, "IdGenero" = p_IdGenero, 
	"IdEstadoCivil" = p_IdEstadoCivil, "Telefono" = p_Telefono, "Correo" = p_Correo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCliente" = p_idcliente
      AND "Activo" = b''1'';
END;
'LANGUAGE plpgsql;
 
 ------------------------------------------------------------------------------------------
 --Retirar
 CREATE OR REPLACE FUNCTION "RetirarCliente"(
	"p_idcliente" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Cliente"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCliente" = p_IdCliente;
END;
'LANGUAGE plpgsql;
 
 -----------------------------------------------------------
 --Cosultas
 CREATE OR REPLACE FUNCTION "ConsultaCliente"()
RETURNS TABLE (
"IdCliente" UUID, 
"NombreCliente" VARCHAR, 
"IdDocumento" UUID, 
"NumeroDocumento" VARCHAR, 
"IdGenero" UUID, 
"IdEstadoCivil" UUID, 
"Telefono" VARCHAR,
"Correo" VARCHAR, 
"Activo" BIT , 
"Actualiza" TIMESTAMP
)AS'
BEGIN
    RETURN QUERY
    SELECT p."IdCliente", p."NombreCliente", p."IdDocumento", p."NumeroDocumento", p."IdGenero", p."IdEstadoCivil", p."Telefono",p."Correo", p."Activo", p."Actualiza"
    FROM "Cliente" p
	 WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 -----------------------------------------------------
 CREATE OR REPLACE FUNCTION "ConsultaClientePorId"(
	"p_idcliente" UUID
)
RETURNS TABLE (
"IdCliente" UUID, 
"NombreCliente" VARCHAR, 
"IdDocumento" UUID, 
"NumeroDocumento" VARCHAR, 
"IdGenero" UUID, 
"IdEstadoCivil" UUID, 
"Telefono" VARCHAR,
"Correo" VARCHAR, 
"Activo" BIT , 
"Actualiza" TIMESTAMP
)AS'
BEGIN
    RETURN QUERY
    SELECT p."IdCliente", p."NombreCliente", p."IdDocumento", p."NumeroDocumento", p."IdGenero", p."IdEstadoCivil", p."Telefono",p."Correo", p."Activo", p."Actualiza"
    FROM "Cliente" p
    WHERE p."IdCliente" = p_IdCliente
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "InsertTransaccion"(
	"p_totalventa" NUMERIC,
	"p_idmediopago" UUID,
	"p_idcliente" UUID,
	"p_idempleado" UUID,
	"p_idciudad" UUID
)
RETURNS VOID AS '
BEGIN
	INSERT INTO "Transaccion" ("TotalVenta", "IdMedioPago", "IdCliente", "IdEmpleado", "p_idciudad")
   VALUES (p_TotalVenta, p_IdMedioPago, p_IdCliente, p_IdEmpleado, p_idciudad);
END;
'LANGUAGE plpgsql;
 
 ----------------------------------------------------------------------------
--UPDATE
CREATE OR REPLACE FUNCTION "ActualizarTransaccion"(
	"p_idtransaccion" UUID,
	"p_totalventa" NUMERIC,
	"p_idmediopago" UUID,
	"p_idcliente" UUID,
	"p_idempleado" UUID,
	"p_idciudad" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Transaccion"
    SET "TotalVenta" = p_TotalVenta, "IdMedioPago" = p_IdMedioPago, "IdCliente" = p_IdCliente, "IdEmpleado" = p_IdEmpleado, 
	"IdCiudad" = p_IdCiudad, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTransaccion" = p_IdTransaccion
      AND "Activo" = b''1'';
END;
'LANGUAGE plpgsql;
 
 ----------------------------------------------------------------------------------
 --Retirar
CREATE OR REPLACE FUNCTION "RetirarTransaccion"(
	"p_idtransaccion" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "Transaccion"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTransaccion" = p_IdTransaccion;
END;
'LANGUAGE plpgsql;
 ---------------------------------
 --Consultas
 
 CREATE OR REPLACE FUNCTION "ConsultaTransaccion"()
RETURNS TABLE (
"IdTransaccion" UUID, 
"TotalVenta" NUMERIC, 
"IdMedioPago" UUID, 
"IdCliente" UUID, 
"IdEmpleado" UUID, 
"IdCiudad" UUID, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS'
BEGIN
    RETURN QUERY
    SELECT p."IdTransaccion", p."TotalVenta", p."IdMedioPago", p."IdCliente", p."IdEmpleado", p."IdCiudad", p."Activo", p."Actualiza"
    FROM "Transaccion" p
	 WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 -------------------------------------
 CREATE OR REPLACE FUNCTION "ConsultaTransaccionPorId"(
	"p_idtransaccion" UUID
)
RETURNS TABLE (
"IdTransaccion" UUID, 
"TotalVenta" NUMERIC, 
"IdMedioPago" UUID, 
"IdCliente" UUID, 
"IdEmpleado" UUID, 
"IdCiudad" UUID, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
) AS'
BEGIN
    RETURN QUERY
    SELECT p."IdTransaccion", p."TotalVenta", p."IdMedioPago", p."IdCliente", p."IdEmpleado", p."IdCiudad", p."Activo", p."Actualiza"
    FROM "Transaccion" p
    WHERE p."IdTransaccion" = p_IdTransaccion
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "InsertDetalleTransaccion"(
	"p_idboleta" UUID,

	"p_idtransaccion" UUID,
	"p_numeroboleta" VARCHAR,
	"p_cantidad" INTEGER,
	"p_descuento" NUMERIC,
	"p_subtotal" NUMERIC
)
RETURNS VOID AS '
BEGIN
	INSERT INTO "DetalleTransaccion" ("IdBoleta", "IdTransaccion", "NumeroBoleta", "Cantidad", "Descuento", "Subtotal")
   VALUES (p_IdBoleta, p_IdTransaccion, p_NumeroBoleta, p_Cantidad, p_Descuento, p_Subtotal);
END;
'LANGUAGE plpgsql;
------------------------------------------------------------------------------------------------------- 
  --UPDATE
 
 CREATE OR REPLACE FUNCTION "ActualizarDetalleTransaccion"(
	"p_iddetalletransaccion" UUID,
	"p_idboleta" UUID,

	"p_idtransaccion" UUID,
	"p_numeroboleta" VARCHAR,
	"p_cantidad" INTEGER,
	"p_descuento" NUMERIC,
	"p_subtotal" NUMERIC
)
RETURNS VOID AS '
BEGIN
    UPDATE "DetalleTransaccion"
    SET "IdBoleta" = p_IdBoleta,
	  "IdTransaccion" = p_IdTransaccion, "NumeroBoleta" = p_NumeroBoleta, "Cantidad" = p_Cantidad, 
	  "Descuento" = p_Descuento, "Subtotal" = p_Subtotal, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDetalleTransaccion" = p_IdDetalleTransaccion
      AND "Activo" = b''1'';
END;
'LANGUAGE plpgsql;
 -------------------------------------------------------------------------------------
 --Retirar
 CREATE OR REPLACE FUNCTION "RetirarDetalleTransaccion"(
	"p_iddetalletransaccion" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "DetalleTransaccion"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDetalleTransaccion" = p_IdDetalleTransaccion;
END;
'LANGUAGE plpgsql;
 ----------------------------------------------------
 --Consultas
 CREATE OR REPLACE FUNCTION "ConsultaDetalleTransaccion"()
RETURNS TABLE (
"IdDetalleTransaccion" UUID, 
"IdBoleta" UUID, 
"IdTransaccion" UUID, 
"NumeroBoleta" VARCHAR, 
"Cantidad" SMALLINT, 
"Descuento" NUMERIC, 
"Subtotal" NUMERIC, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
)AS'
BEGIN
    RETURN QUERY
    SELECT p."IdDetalleTransaccion", p."IdBoleta", p."IdTransaccion", p."NumeroBoleta", p."Cantidad", p."Descuento", p."Subtotal", p."Activo", p."Actualiza"
    FROM "DetalleTransaccion" p
	 WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 
 -----------------------------------------------------
 
 CREATE FUNCTION "ConsultaDetalleTransaccionPorId"(
	"p_idtransaccion" UUID
)
RETURNS TABLE (
"IdDetalleTransaccion" UUID, 
"IdBoleta" UUID, 
"IdTransaccion" UUID, 
"NumeroBoleta" VARCHAR, 
"Cantidad" SMALLINT, 
"Descuento" NUMERIC, 
"Subtotal" NUMERIC, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
)AS'
BEGIN
    RETURN QUERY
    SELECT p."IdDetalleTransaccion", p."IdBoleta", p."IdTransaccion", p."NumeroBoleta", p."Cantidad", p."Descuento", p."Subtotal", p."Activo", p."Actualiza"
    FROM "DetalleTransaccion" p
    WHERE p."IdDetalleTransaccion" = p_IdDetalleTransaccion
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION "InsertEstadoCivil"(
	"p_nombre" VARCHAR
)
RETURNS VOID AS '
BEGIN
	INSERT INTO "EstadoCivil" ("NombreEstado")
   VALUES (p_Nombre);
END;
'LANGUAGE plpgsql;
 
 ------------------------------------------------------------
 --UPDATE
 
 CREATE OR REPLACE FUNCTION "ActualizarEstadoCivil"(
	"p_idestado" UUID,
	"p_nombreestado" VARCHAR
)
RETURNS VOID AS '
BEGIN
    UPDATE "EstadoCivil"
    SET "NombreEstado" = p_NombreEstado, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEstadoCivil" = p_IdEstado
      AND "Activo" = b''1'';
END;
'LANGUAGE plpgsql;
 -----------------------------------------------------------------
 
 --Retirar
 CREATE OR REPLACE FUNCTION "RetirarEstadoCivil"(
	"p_idestado" UUID
)
RETURNS VOID AS '
BEGIN
    UPDATE "EstadoCivil"
    SET "Activo" = b''0'', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEstadoCivil" = p_IdEstado;
END;
'LANGUAGE plpgsql;
 
 --------------------------------------------------------------
 --Consultas
 CREATE OR REPLACE FUNCTION "ConsultaEstadoCivil"()
RETURNS TABLE (
"IdEstadoCivil" UUID, 
"NombreEstado" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
)AS '
BEGIN
    RETURN QUERY
    SELECT p."IdEstadoCivil", p."NombreEstado", p."Activo", p."Actualiza"
    FROM "EstadoCivil" p
    WHERE p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
 -----------------------------------------
 CREATE OR REPLACE FUNCTION "ConsultaEstadoCivilPorId"(
	"p_idestado" UUID
)
RETURNS TABLE (
"IdEstadoCivil" UUID, 
"NombreEstado" VARCHAR, 
"Activo" BIT, 
"Actualiza" TIMESTAMP
)AS '
BEGIN
    RETURN QUERY
    SELECT p."IdEstadoCivil", p."NombreEstado", p."Activo", p."Actualiza"
    FROM "EstadoCivil" p
    WHERE p."IdEstadoCivil" = p_IdEstado
      AND p."Activo" = B''1'';
END;
'LANGUAGE plpgsql;
