# Power BI Overview foundation

This directory contains the ticket #9 implementation for the Formula 1 dashboard:

- `parameters/SourceFolder.pq` defines the configurable source-folder parameter.
- `queries/` contains the shared CSV loader and six import queries.
- `measures/Overview.dax` contains the initial Overview measures.
- `validate_overview.py` checks the source expectations independently of Power BI.

## Importing into Power BI Desktop

1. Copy the repository to the Windows machine that will host the report.
2. In Power Query, create a text parameter named `pDataFolder` and set it to the
   absolute path of the copied `data/raw` directory.
3. Create the `fxLoadCsv` function from `queries/00_fxLoadCsv.pq`.
4. Create the queries in `queries/DimRace.pq`, `DimDriver.pq`,
   `DimConstructor.pq`, `DimCircuit.pq`, `DimStatus.pq`, and
   `FactGrandPrixEntries.pq`.
5. Apply the relationships in `model.md`.
6. Create the measures in `measures/Overview.dax`.

The raw CSV files are not modified. Refreshing the report reads the files from
the single `pDataFolder` parameter.

## Local validation

From the repository root:

```text
python powerbi/validate_overview.py
```

Power BI Desktop validation is still required on Windows: refresh the queries,
check the relationship warnings, and verify the Overview counts and filters.
