# Ticket #9 model

Load the following tables and mark `FactGrandPrixEntries` as the fact table:

| From | Column | To | Column | Cardinality |
| --- | --- | --- | --- | --- |
| `DimRace` | `raceId` | `FactGrandPrixEntries` | `raceId` | One-to-many |
| `DimDriver` | `driverId` | `FactGrandPrixEntries` | `driverId` | One-to-many |
| `DimConstructor` | `constructorId` | `FactGrandPrixEntries` | `constructorId` | One-to-many |
| `DimCircuit` | `circuitId` | `DimRace` | `circuitId` | One-to-many |
| `DimStatus` | `statusId` | `FactGrandPrixEntries` | `statusId` | One-to-many |

Use single-direction filtering from dimensions to facts. Do not relate
`DimDriver` directly to `DimConstructor`; a result row connects them through
`FactGrandPrixEntries`.

## Expected checks

- `Grand Prix Race Count` returns 209 with no filters and 24 for 2024.
- `Grand Prix Entry Count` returns 4,219 with no filters and 479 for 2024.
- The fact table has one row per recorded driver/race entry in the study.
- No relationship warning reports a many-side key that was expected to be
  unique.
