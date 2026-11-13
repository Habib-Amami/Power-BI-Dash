let
    Source = fxLoadCsv("races.csv"),
    SelectedColumns = Table.SelectColumns(
        Source,
        {"raceId", "year", "round", "circuitId", "name", "date", "time"}
    ),
    Typed = Table.TransformColumnTypes(
        SelectedColumns,
        {
            {"raceId", Int64.Type},
            {"year", Int64.Type},
            {"round", Int64.Type},
            {"circuitId", Int64.Type},
            {"name", type text},
            {"date", type date},
            {"time", type time}
        }
    ),
    InStudy = Table.SelectRows(Typed, each [year] >= 2015 and [year] <= 2024)
in
    InStudy
