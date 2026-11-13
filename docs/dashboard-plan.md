# Formula 1 dashboard planning

This document records the choices agreed during the design interview. The user proceeded from the consolidated design to the to-spec flow, confirming the design for specification.

## Agreed choices

- Use the supplied CSV files in `data/raw/` for a Formula 1 dashboard.
- Cover 2015–2024 to support yearly comparisons.
- Serve an F1 analyst comparing drivers and teams and understanding how their performance evolves.
- Include the entire field, with filters for individual drivers and teams.
- Show both totals and rates to account for different numbers of races across seasons, using the definitions below.
- Use a dark motorsport theme with restrained red accents and readable charts.
- Open and validate the final report in Power BI Desktop on a Windows machine accessible to the user.
- Aim for a polished, manageable coursework project with clear KPIs, useful interactions, and an explainable model.
- Keep forecasting and machine learning outside the scope.
- Use English for the dashboard, measure names, and submission documentation.
- Deliver a report within the assignment's five-page documentation limit.
- Include the Power BI `.pbix` and datasets required by `requirements.md`.
- Focus the core indicators on race participation, Grand Prix wins, podiums, win/podium rates, and points.
- Use each season's final standings for championship points. Keep Grand Prix results and sprint results separate, including their result points, wins, and podiums.
- Preserve the constructor identities supplied in the data, without merging renamed or reorganized teams into invented lineages.
- Leave lap-by-lap pace and pit-stop speed analysis outside the initial report.
- Show trends across all ten seasons and compare a selected season with its previous year. Missing previous-year participation is N/A.
- Build Overview, Yearly Comparisons, and Race Details pages.
- Provide season, driver, team, and circuit filters, drill-through, and reset controls.

## Measure rules

- A Grand Prix entry is a recorded driver/race result, including retirement, withdrawal, and disqualification outcomes. Label these as entries, without asserting they are confirmed starts.
- Driver win rate is Grand Prix wins divided by driver Grand Prix entries. Driver podium rate is Grand Prix podium finishes divided by driver Grand Prix entries.
- A team race appearance is a race with at least one recorded entry for that constructor. Team win rate uses team race appearances as its denominator.
- Team podium-race rate counts races with at least one podium finish for the constructor and divides by its team race appearances. Two podium finishes in one race contribute two podium finishes but one team podium race.
- Keep Grand Prix and sprint result measures separate. Use final standings for season-end championship points, preserving the distinction from result points.
- Display missing numeric values as N/A. Retain the underlying records, and exclude missing values only from calculations that need them. Race details retain recorded finishing status.
- Rates with no eligible denominator are N/A.
- Present point comparisons as values recorded in their respective seasons, with race and sprint counts visible as context.

## Filter and comparison rules

- Race-result measures respond to applicable season, driver, team, and circuit filters.
- Place season-end standings in a clearly labeled full-season section. Circuit and race filtering must preserve their full-season meaning.
- Keep driver and constructor championship rankings separate. A complete driver championship total describes the driver, rather than points earned only for a selected team.
- Initialize Yearly Comparisons to 2024 versus 2023. Compare the selected season with the immediately preceding year within 2015–2024, rather than the previous year remaining in an arbitrary selection.
- For 2015, previous-year comparisons are N/A. Missing previous-year participation is also N/A.
- Express changes in rates as percentage-point differences. Calculate percentage changes in totals only when the previous-year value is nonzero; a zero baseline produces N/A for percentage change.

## Source attribution and packaging

- Identify the source as the supplied local Formula 1 CSV snapshot in `data/raw/`. The original download source and license remain unverified; include an original source link if one becomes available.
- Preserve the raw CSVs and package the data needed to reproduce the report.
- Deliver the completed Power BI `.pbix` and an English report of at most five pages describing the objective, sources, transformations, model, measures, visuals, and limitations.

## Completion criteria

- The packaged dataset refreshes successfully in Power BI Desktop on Windows.
- The unfiltered 2015–2024 study contains 209 Grand Prix races and 4,219 driver Grand Prix entries.
- The 2024 Grand Prix results produce 24 wins and 72 podium finishes; sprint outcomes remain separate.
- Displayed season-end driver and constructor championship points reconcile with the supplied final standings, including cases where result-point sums differ.
- Driver and team rate denominators follow the glossary, including the two-podium-finish/one-team-podium-race scenario.
- Yearly comparisons handle missing participation, the 2015 boundary, zero baselines, and percentage-point changes correctly.
- Filters, drill-through, page navigation, and reset controls work and preserve the documented scope of each measure.
- Missing values remain N/A in relevant visuals and do not erase their underlying result records.
- Overview, Yearly Comparisons, and Race Details form a coherent presentation.
- The final package includes the `.pbix`, supporting datasets, and report within the five-page limit.

## Verified data constraints

- The supplied race calendar and results cover 1950 through 2024. There are no 2025 or 2026 seasons.
- All 24 races in the 2024 calendar have race results, qualifying, lap times, pit stops, and standings records. Six have sprint results. This establishes race coverage, rather than completeness of every field.
- Historical coverage differs by table: lap times begin in 1996 and pit stops begin in 2011.
- The agreed 2015–2024 window contains 209 races and 4,219 race result rows, with unique driver/race pairs. Every race has results, qualifying, and lap records; pit records are absent for Belgium 2021.
- Standings are cumulative snapshots after races; summing them across rounds would overcount points.
- In 2015–2024, driver race-plus-sprint points reconcile with final standings. Constructor totals differ for constructor ID 10 in 2018 (111 result points versus 52 final standing points) and ID 211 in 2020 (210 versus 195). The CSV evidence establishes differences, not their causes; championship points and result points require distinct definitions.
- The all-time race results contain repeated driver/race pairs; preserve source result identifiers rather than silently deduplicating.
- No local dataset source note or license was found. Original provenance remains unverified.

## Design status

All analytical and scope questions raised in the interview have agreed answers. The user confirmed progression by requesting the to-spec flow. The original dataset provenance remains an acknowledged unknown. The specification retains the already approved report-refresh, KPI-output, and interaction validation boundary.

Published specification: [GitHub issue #8 — Build Formula 1 yearly performance dashboard (2015–2024)](https://github.com/Habib-Amami/Power-BI-Dash/issues/8), labeled `ready-for-agent`. A local copy is available in [dashboard-spec.md](dashboard-spec.md).

Implementation tickets: [issues #9–#15](dashboard-tickets.md), published with `ready-for-agent` and verified native dependencies. The initial unblocked ticket is [#9](https://github.com/Habib-Amami/Power-BI-Dash/issues/9).
