(fileName as text) as table =>
let
    Source = Csv.Document(
        File.Contents(pDataFolder & "\" & fileName),
        [
            Delimiter = ",",
            Encoding = 65001,
            QuoteStyle = QuoteStyle.Csv
        ]
    ),
    Headers = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
    MissingAsNull = Table.ReplaceValue(
        Headers,
        "\N",
        null,
        Replacer.ReplaceValue,
        Table.ColumnNames(Headers)
    ),
    EmptyAsNull = Table.ReplaceValue(
        MissingAsNull,
        "",
        null,
        Replacer.ReplaceValue,
        Table.ColumnNames(MissingAsNull)
    )
in
    EmptyAsNull
