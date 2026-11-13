let
    Source = fxLoadCsv("status.csv"),
    SelectedColumns = Table.SelectColumns(Source, {"statusId", "status"}),
    Typed = Table.TransformColumnTypes(
        SelectedColumns,
        {
            {"statusId", Int64.Type},
            {"status", type text}
        }
    )
in
    Typed
