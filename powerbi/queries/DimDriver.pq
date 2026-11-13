let
    Source = fxLoadCsv("drivers.csv"),
    SelectedColumns = Table.SelectColumns(
        Source,
        {"driverId", "driverRef", "number", "code", "forename", "surname", "dob", "nationality"}
    ),
    Typed = Table.TransformColumnTypes(
        SelectedColumns,
        {
            {"driverId", Int64.Type},
            {"driverRef", type text},
            {"number", Int64.Type},
            {"code", type text},
            {"forename", type text},
            {"surname", type text},
            {"dob", type date},
            {"nationality", type text}
        }
    ),
    InStudy = Table.SelectRows(
        Typed,
        each List.Contains(FactGrandPrixEntries[driverId], [driverId])
    )
in
    InStudy
