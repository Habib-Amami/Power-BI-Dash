let
    Source = fxLoadCsv("constructors.csv"),
    SelectedColumns = Table.SelectColumns(
        Source,
        {"constructorId", "constructorRef", "name", "nationality"}
    ),
    Typed = Table.TransformColumnTypes(
        SelectedColumns,
        {
            {"constructorId", Int64.Type},
            {"constructorRef", type text},
            {"name", type text},
            {"nationality", type text}
        }
    ),
    InStudy = Table.SelectRows(
        Typed,
        each List.Contains(FactGrandPrixEntries[constructorId], [constructorId])
    ),
    TeamLabel = Table.RenameColumns(InStudy, {{"name", "Team"}})
in
    TeamLabel
