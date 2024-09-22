SELECT json_agg(row_to_json(Boleta)) AS resultado
FROM (
    SELECT 
        b."IdBoleta",
        b."NombreBoleta",
        b."Fecha",
        b."Hora",
        b."Precio",
        l."IdLugar",
        l."NombreLugar",
        o."IdOrganizador",
        o."NombreOrganizador",
        eb."IdEstadoBoleta",
        eb."NombreEstadoBoleta",
        c."IdCategoria",
        c."NombreCategoria",
        b."Activo",
        b."Actualiza"
    FROM "Boleta" b
    INNER JOIN "Lugar" l ON b."IdLugar" = l."IdLugar"
    INNER JOIN "Organizador" o ON b."IdOrganizador" = o."IdOrganizador"
    INNER JOIN "EstadoBoleta" eb ON b."IdEstadoBoleta" = eb."IdEstadoBoleta"
    INNER JOIN "Categoria" c ON b."IdCategoria" = c."IdCategoria"
    WHERE b."Activo" = B'1'
      AND l."Activo" = B'1'
      AND o."Activo" = B'1'
      AND eb."Activo" = B'1'
      AND c."Activo" = B'1'
) AS Boleta;
