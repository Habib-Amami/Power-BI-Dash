"""Validate the independent source expectations for the ticket #9 Overview."""

import csv
from collections import Counter
from pathlib import Path


DATA_DIR = Path(__file__).parents[1] / "data" / "raw"
START_YEAR = 2015
END_YEAR = 2024


def read_csv(name: str) -> list[dict[str, str]]:
    with (DATA_DIR / name).open(newline="", encoding="utf-8-sig") as source:
        return list(csv.DictReader(source))


def main() -> None:
    races = read_csv("races.csv")
    results = read_csv("results.csv")
    drivers = read_csv("drivers.csv")
    constructors = read_csv("constructors.csv")
    circuits = read_csv("circuits.csv")
    statuses = read_csv("status.csv")
    race_by_id = {int(row["raceId"]): row for row in races}

    scoped_results = [
        row
        for row in results
        if START_YEAR <= int(race_by_id[int(row["raceId"])]["year"]) <= END_YEAR
    ]
    scoped_races = {
        int(row["raceId"])
        for row in scoped_results
    }
    keys = [
        (int(row["raceId"]), int(row["driverId"]))
        for row in scoped_results
    ]
    duplicate_keys = [
        key for key, count in Counter(keys).items() if count > 1
    ]
    dimension_checks = {
        "race": ("raceId", races),
        "driver": ("driverId", drivers),
        "constructor": ("constructorId", constructors),
        "circuit": ("circuitId", circuits),
        "status": ("statusId", statuses),
    }
    for dimension, (key_name, rows) in dimension_checks.items():
        ids = [row[key_name] for row in rows]
        if len(ids) != len(set(ids)):
            raise SystemExit(f"Duplicate {dimension} keys found")

    required_ids = {
        "race": {row["raceId"] for row in scoped_results},
        "driver": {row["driverId"] for row in scoped_results},
        "constructor": {row["constructorId"] for row in scoped_results},
        "status": {row["statusId"] for row in scoped_results},
    }
    available_ids = {
        "race": {row["raceId"] for row in races},
        "driver": {row["driverId"] for row in drivers},
        "constructor": {row["constructorId"] for row in constructors},
        "status": {row["statusId"] for row in statuses},
    }
    for dimension, required in required_ids.items():
        missing = required - available_ids[dimension]
        if missing:
            raise SystemExit(f"Missing {dimension} dimension keys: {sorted(missing)[:5]}")

    scoped_circuit_ids = {
        race_by_id[int(row["raceId"])]["circuitId"] for row in scoped_results
    }
    available_circuit_ids = {row["circuitId"] for row in circuits}
    if missing := scoped_circuit_ids - available_circuit_ids:
        raise SystemExit(f"Missing circuit dimension keys: {sorted(missing)[:5]}")

    expected = {
        "races": 209,
        "entries": 4219,
        "races_2024": 24,
        "entries_2024": 479,
    }
    actual = {
        "races": len(scoped_races),
        "entries": len(scoped_results),
        "races_2024": len(
            {
                int(row["raceId"])
                for row in scoped_results
                if race_by_id[int(row["raceId"])]["year"] == "2024"
            }
        ),
        "entries_2024": sum(
            race_by_id[int(row["raceId"])]["year"] == "2024"
            for row in scoped_results
        ),
    }

    if actual != expected:
        raise SystemExit(f"Overview source expectations failed: {actual} != {expected}")
    if duplicate_keys:
        raise SystemExit(f"Duplicate driver/race keys found: {duplicate_keys[:5]}")

    print("Overview validation passed:")
    print(f"- {actual['races']} Grand Prix races, {actual['entries']} entries")
    print(f"- 2024: {actual['races_2024']} races, {actual['entries_2024']} entries")
    print("- driver/race entry grain is unique")
    print("- dimension keys are unique and referentially complete")


if __name__ == "__main__":
    main()
