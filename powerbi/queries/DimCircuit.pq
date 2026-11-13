let
    Source = fxLoadCsv("circuits.csv"),
    SelectedColumns = Table.SelectColumns(
        Source,
        {"circuitId", "circuitRef", "name", "location", "country", "lat", "lng", "alt"}
    ),
    Typed = Table.TransformColumnTypes(
        SelectedColumns,
        {
            {"circuitId", Int64.Type},
            {"circuitRef", type text},
            {"name", type text},
            {"location", type text},
            {"country", type text},
            {"lat", type number},
            {"lng", type number},
            {"alt", Int64.Type}
        }
    ),
    InStudy = Table.SelectRows(
        Typed,
        each List.Contains(DimRace[circuitId], [circuitId])
    )
in
    InStudy
