let
    Source = fxLoadCsv("results.csv"),
    SelectedColumns = Table.SelectColumns(
        Source,
        {
            "resultId", "raceId", "driverId", "constructorId", "number", "grid",
            "position", "positionText", "positionOrder", "points", "laps",
            "time", "milliseconds", "fastestLap", "rank", "fastestLapTime",
            "fastestLapSpeed", "statusId"
        }
    ),
    Typed = Table.TransformColumnTypes(
        SelectedColumns,
        {
            {"resultId", Int64.Type},
            {"raceId", Int64.Type},
            {"driverId", Int64.Type},
            {"constructorId", Int64.Type},
            {"number", Int64.Type},
            {"grid", Int64.Type},
            {"position", Int64.Type},
            {"positionText", type text},
            {"positionOrder", Int64.Type},
            {"points", type number},
            {"laps", Int64.Type},
            {"time", type text},
            {"milliseconds", Int64.Type},
            {"fastestLap", Int64.Type},
            {"rank", Int64.Type},
            {"fastestLapTime", type text},
            {"fastestLapSpeed", type number},
            {"statusId", Int64.Type}
        }
    ),
    WithRace = Table.NestedJoin(
        Typed,
        {"raceId"},
        DimRace,
        {"raceId"},
        "Race",
        JoinKind.Inner
    ),
    ExpandedRace = Table.ExpandTableColumn(WithRace, "Race", {"year"}, {"year"}),
    InStudy = Table.SelectRows(ExpandedRace, each [year] >= 2015 and [year] <= 2024),
    WithoutYear = Table.RemoveColumns(InStudy, {"year"})
in
    WithoutYear
