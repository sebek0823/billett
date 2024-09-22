SELECT json_agg(row_to_json(Cliente)) AS resultado
FROM (
    SELECT 
        c."IdCliente",
        c."NombreCliente",
        c."NumeroDocumento",
        td."IdDocumento",
        td."NombreDocumento",
        g."IdGenero",
        g."NombreGenero",
        ec."IdEstadoCivil",
        ec."NombreEstado" AS "EstadoCivil",
        c."Telefono",
        c."Correo",
        c."Activo",
        c."Actualiza"
    FROM "Cliente" c
    INNER JOIN "TipoDocumento" td ON c."IdDocumento" = td."IdDocumento"
    INNER JOIN "Genero" g ON c."IdGenero" = g."IdGenero"
    INNER JOIN "EstadoCivil" ec ON c."IdEstadoCivil" = ec."IdEstadoCivil"
    WHERE c."Activo" = B'1'
      AND td."Activo" = B'1'
      AND g."Activo" = B'1'
      AND ec."Activo" = B'1'
) AS Cliente;