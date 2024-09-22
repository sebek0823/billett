SELECT json_agg(row_to_json(Organizacion)) AS resultado
FROM (
    SELECT 
        e."IdEmpresa",
        e."RazonSocial",
        e."NIT",
        s."IdSede",
        s."NombreSede",
        s."Direccion" AS "DireccionSede",
        emp."IdEmpleado",
        emp."NombreEmpleado",
        td."IdDocumento",
        td."NombreDocumento",
        emp."NumeroDocumento",
        c."IdCargo",
        c."NombreCargo",
        e."Activo" AS "EmpresaActiva",
        s."Activo" AS "SedeActiva",
        emp."Activo" AS "EmpleadoActivo",
        emp."Actualiza"
    FROM "Empleado" emp
    INNER JOIN "Sede" s ON emp."IdSede" = s."IdSede"
    INNER JOIN "Empresa" e ON s."IdEmpresa" = e."IdEmpresa"
    INNER JOIN "TipoDocumento" td ON emp."IdDocumento" = td."IdDocumento"
    INNER JOIN "Cargo" c ON emp."IdCargo" = c."IdCargo"
    WHERE emp."Activo" = B'1'
      AND s."Activo" = B'1'
      AND e."Activo" = B'1'
      AND td."Activo" = B'1'
      AND c."Activo" = B'1'
) AS Organizacion;
