# Formula 1 dashboard tickets

Status: approved and published as issues #9–#15 under [specification #8](https://github.com/Habib-Amami/Power-BI-Dash/issues/8). Every ticket is open, labeled `ready-for-agent`, and linked through native GitHub blocking relationships. The issue bodies and dependencies were verified after publication.

Each slice delivers observable Power BI behavior, including the preparation, model, measures, visuals, and validation needed for that behavior. There is no existing application to prefactor. The tickets are sub-issues of the specification. Its title, body, state, and labels were preserved. This document records the published bodies and their dependency graph; GitHub remains the issue tracker.

## [#9](https://github.com/Habib-Amami/Power-BI-Dash/issues/9) — Explore 2015–2024 Grand Prix participation in a refreshable Overview

### Parent

[Specification #8](https://github.com/Habib-Amami/Power-BI-Dash/issues/8).

### What to build

Deliver a Power BI report that refreshes from the supplied CSV snapshot and lets an analyst explore Grand Prix participation across 2015–2024. An initial Overview shows race and driver-entry counts, working season/driver/team/circuit filters, and visible selection context. Include the data preparation, relationships, count measures, readable English dark-theme presentation, and report-output checks needed to demonstrate this working slice.

Primary specification coverage: user stories 1–9, 28, 37, 40–42, 46–47, and 50–52.

### Acceptance criteria

- [ ] The report opens and refreshes in Power BI Desktop from a configurable location for the supplied CSV snapshot, with raw records preserved and refresh instructions provided.
- [ ] The analytical scope includes every supplied driver and constructor identity participating in 2015–2024, without inventing a merged team lineage or importing out-of-scope seasons into the visuals.
- [ ] The unfiltered Overview displays 209 Grand Prix races and 4,219 driver Grand Prix entries. Selecting 2024 displays 24 races and 479 entries.
- [ ] A recorded driver/race result is counted as one entry, including retirement, withdrawal, and disqualification outcomes. Labels describe entries rather than confirmed starts.
- [ ] Source identifiers, fractional numeric values, and valid entries survive preparation. Missing-value markers become missing values, and a missing measurement does not remove an otherwise valid entry.
- [ ] Relationships and source key assumptions are checked without multiplying entries or silently deleting duplicate-looking records. The in-scope driver/race grain remains unique.
- [ ] Season, driver, Team, and circuit selections update the applicable count measures consistently, with active selections visible.
- [ ] The Overview uses readable English labels, a dark theme, and restrained red accents; missing numeric measurements are presented as N/A where shown.
- [ ] Evidence compares the refreshed report's counts and filter behavior with independent source expectations and documents the initial preparation and model relationships.

### Blocked by

None; this ticket can start immediately.

## [#10](https://github.com/Habib-Amami/Power-BI-Dash/issues/10) — Compare Grand Prix performance with driver and team rates

### Parent

[Specification #8](https://github.com/Habib-Amami/Power-BI-Dash/issues/8).

### What to build

Extend the refreshable Overview into a usable Grand Prix performance comparison for 2015–2024. Let an analyst compare drivers and teams using wins, podium finishes, Grand Prix result points, and explicitly defined participation-based rates. Deliver the required model extensions, measures, comparison visuals, filtering behavior, explanatory labels, and observable result checks together.

Primary specification coverage: user stories 10–17 and 49.

### Acceptance criteria

- [ ] Driver and team comparison visuals show Grand Prix wins, podium finishes, and Grand Prix result points, with totals and meaningful participation-based rates available together.
- [ ] Driver win rate divides Grand Prix wins by that driver's recorded Grand Prix entries; driver podium rate divides Grand Prix podium finishes by those entries. Recorded non-finishing, withdrawal, and disqualification outcomes remain in the entry denominator.
- [ ] A team race appearance counts a race once when the constructor has at least one recorded entry. Team win rate uses team race appearances, rather than the number of driver entries, as its denominator.
- [ ] Team podium-race rate divides races with at least one team podium finish by team race appearances. A two-driver podium in one race produces two podium finishes and one team podium race.
- [ ] Grand Prix wins and podium finishes follow recorded classified finishing positions. Selecting 2024 across the full field produces 24 wins and 72 podium finishes.
- [ ] Grand Prix result points are labeled as result points and retain fractional values. They are distinguishable from championship points and sprint outcomes.
- [ ] Season, driver, team, and circuit filters affect applicable result measures consistently. Rates without an eligible denominator display N/A, and rates are presented with an identifiable driver or team context.
- [ ] Hand-calculated driver and team scenarios, including the two-podium-finish scenario, reconcile with the refreshed report outputs. Existing participation-count behavior remains correct.

### Blocked by

- [#9](https://github.com/Habib-Amami/Power-BI-Dash/issues/9) — Explore 2015–2024 Grand Prix participation in a refreshable Overview.

## [#11](https://github.com/Habib-Amami/Power-BI-Dash/issues/11) — Explore sprint results separately from Grand Prix outcomes

### Parent

[Specification #8](https://github.com/Habib-Amami/Power-BI-Dash/issues/8).

### What to build

Let an analyst inspect sprint participation, result points, wins, and podium finishes in a clearly labeled section of the Overview for the 2015–2024 study. Deliver sprint preparation and relationships, measures, visuals, selection context, and checks as one working feature, retaining a clear distinction from Grand Prix results.

Primary specification coverage: user stories 18–19 and 36.

### Acceptance criteria

- [ ] The report refreshes sprint results against the shared study dimensions without multiplying Grand Prix entries or sprint result rows.
- [ ] Sprint race counts, result points, wins, and podium finishes are explicitly labeled as sprint measures, separate from Grand Prix outcomes.
- [ ] Within the agreed study, source coverage reconciles to 18 races with sprint results and 360 recorded sprint result rows. Selecting 2024 produces six sprint wins and 18 sprint podium finishes.
- [ ] Season, driver, team, and circuit filters update applicable sprint visuals, with active context visible.
- [ ] Seasons or selections without sprint records display clear no-sprint-results context; genuinely missing numeric measurements remain N/A.
- [ ] Fractional result points are preserved, and race/sprint counts remain available as context for comparing annual points.
- [ ] Introducing sprint data leaves Grand Prix participation counts and rate denominators unchanged. Source expectations and refreshed report outputs establish the distinction.

### Blocked by

- [#9](https://github.com/Habib-Amami/Power-BI-Dash/issues/9) — Explore 2015–2024 Grand Prix participation in a refreshable Overview.

## [#12](https://github.com/Habib-Amami/Power-BI-Dash/issues/12) — Explore season-end driver and team championship standings

### Parent

[Specification #8](https://github.com/Habib-Amami/Power-BI-Dash/issues/8).

### What to build

Add a clearly labeled full-season standings section in which an analyst can inspect driver and team season-end championship positions and points for 2015–2024. Deliver the preparation of final snapshots, their independent filter behavior, championship measures, ranking visuals, and reconciliation checks without conflating championship points with result-point sums.

Primary specification coverage: user stories 20–27.

### Acceptance criteria

- [ ] Driver and constructor season-end standings are taken from the supplied season-final snapshots, with one terminal snapshot used per season instead of adding cumulative rounds.
- [ ] Driver and team championship rankings are separate, identify their season, and use the supplied competitor identities and standings values.
- [ ] Driver standings respond to the relevant season and driver selection; constructor standings respond to the relevant season and constructor selection.
- [ ] Race and circuit selections preserve the full-season meaning of standings, visibly labeled Full-season standings. A team selection does not reattribute a driver's complete championship total to that team.
- [ ] Championship points are labeled distinctly from result points. The feature remains demoable independently of a result-points comparison visual.
- [ ] All in-scope final driver and constructor championship points reconcile with the supplied terminal snapshots, preserving fractional values.
- [ ] The report preserves the observed constructor discrepancies: Force India in 2018 has 52 championship points versus 111 summed result points, and Racing Point in 2020 has 195 versus 210. Documentation does not invent their causes.
- [ ] Refreshed report checks cover snapshot selection, season/competitor selection, and a circuit-filter scenario that leaves full-season points unchanged.

### Blocked by

- [#9](https://github.com/Habib-Amami/Power-BI-Dash/issues/9) — Explore 2015–2024 Grand Prix participation in a refreshable Overview.

## [#13](https://github.com/Habib-Amami/Power-BI-Dash/issues/13) — Compare yearly performance across 2015–2024

### Parent

[Specification #8](https://github.com/Habib-Amami/Power-BI-Dash/issues/8).

### What to build

Deliver the Yearly Comparisons page, connecting the available Grand Prix, sprint, and championship measures into ten-season trends and a selected-season comparison with the immediately preceding calendar year. Include the comparison calculations, visuals, selection rules, contextual labels, and boundary-case validation needed for an analyst to interpret yearly differences correctly.

Primary specification coverage: user stories 29–35 and 38; integrates the race/sprint context delivered by user story 36.

### Acceptance criteria

- [ ] The page presents trends over 2015–2024 and lets the analyst compare driver and team performance using the available totals and rates, preserving supplied team identities.
- [ ] Grand Prix result points, sprint result points, and season-end championship points remain distinct. Race and sprint counts provide context for annual points.
- [ ] The default comparison is 2024 versus 2023. A selected year compares with its immediately preceding calendar year inside the study, even if that prior year is absent from another visual's selection.
- [ ] The previous-year comparison for 2015 is N/A. Missing prior-year driver or constructor participation is N/A and is not silently treated as zero performance.
- [ ] Percentage changes in totals are calculated only with a defined, nonzero prior-year baseline. A zero baseline produces N/A for percentage change.
- [ ] Changes in rates use percentage points: 25% to 30% displays a five-percentage-point increase.
- [ ] Applicable season, driver, team, and circuit filtering is consistent with result measures, while championship comparisons preserve their clearly labeled full-season scope.
- [ ] Active comparison years and selection context are visible, and the page reuses the agreed English dark theme.
- [ ] Refreshed report checks cover the default, the study boundary, a missing competitor baseline, a zero baseline, a percentage-point change, and preservation of Grand Prix/sprint/championship distinctions.

### Blocked by

- [#10](https://github.com/Habib-Amami/Power-BI-Dash/issues/10) — Compare Grand Prix performance with driver and team rates.
- [#11](https://github.com/Habib-Amami/Power-BI-Dash/issues/11) — Explore sprint results separately from Grand Prix outcomes.
- [#12](https://github.com/Habib-Amami/Power-BI-Dash/issues/12) — Explore season-end driver and team championship standings.

## [#14](https://github.com/Habib-Amami/Power-BI-Dash/issues/14) — Drill through to race details and navigate the complete report

### Parent

[Specification #8](https://github.com/Habib-Amami/Power-BI-Dash/issues/8).

### What to build

Complete the analyst's path from Overview or Yearly Comparisons to supporting records on Race Details and back. Deliver the details presentation, required record context, drill-through relationships, navigation and reset controls, filter-scope labels, and Desktop interaction validation across all three pages.

Primary specification coverage: user stories 39, 43–45, and 48; completes the cross-page behavior of user stories 40–42.

### Acceptance criteria

- [ ] Race Details exposes the records behind a selected driver, team, season, or race context, including race identity, driver, team, recorded outcome/status, and applicable result points.
- [ ] Grand Prix and sprint records remain identifiable and distinct. Missing numerical results display N/A while recorded finishing status and the underlying entry remain available.
- [ ] Drill-through from applicable Overview and Yearly Comparisons visuals preserves the selected analytical context and reaches the corresponding supporting records.
- [ ] Page navigation reaches Overview, Yearly Comparisons, and Race Details; back navigation returns the analyst to the originating investigation.
- [ ] Season, driver, team, and circuit context is visible and consistent across relevant visuals. Full-season championship labels remain clear when race details are filtered.
- [ ] Reset controls restore the documented presentation defaults, including the 2024 versus 2023 comparison default, and recover from a narrowed or empty selection.
- [ ] All three pages use consistent English terminology, readable dark styling, and restrained red accents.
- [ ] A Power BI Desktop walkthrough validates the navigation, filter, drill-through, back, and reset behavior with both ordinary and missing-value records. Capture actual report interaction evidence alongside automated measure checks.

### Blocked by

- [#13](https://github.com/Habib-Amami/Power-BI-Dash/issues/13) — Compare yearly performance across 2015–2024.

## [#15](https://github.com/Habib-Amami/Power-BI-Dash/issues/15) — Deliver and validate the final Power BI submission

### Parent

[Specification #8](https://github.com/Habib-Amami/Power-BI-Dash/issues/8).

### What to build

Deliver a reproducible coursework submission that an evaluator can open, refresh, inspect, and follow through a concise presentation. Package the finished Power BI report and supporting datasets, supply an English explanatory report of at most five pages, and validate the complete package in the user's accessible Windows Power BI Desktop environment.

Primary specification coverage: user stories 53–58; consolidates the preparation/model explanation from user story 5 and the acceptance behavior of the earlier slices.

### Acceptance criteria

- [ ] The submission includes the completed Power BI `.pbix`, supporting datasets, and clear instructions for refreshing from the packaged data after relocation.
- [ ] A fresh refresh from the submitted package succeeds in the user's accessible Windows Power BI Desktop environment, with source data preserved.
- [ ] An English report of at most five pages explains the objective, supplied sources, transformations, model relationships, indicator definitions, visuals, and material limitations.
- [ ] Source attribution identifies the supplied local CSV snapshot and its unverified original download source and license; a verified original link is included if available, without inventing provenance.
- [ ] Final report outputs reconcile to 209 Grand Prix races and 4,219 entries for 2015–2024, plus 24 Grand Prix wins and 72 podium finishes in 2024, with sprint outcomes separate.
- [ ] Season-end standings, constructor-point discrepancies, driver/team denominators, missing values, undefined comparisons, and percentage-point changes pass the accepted behavioral checks.
- [ ] A final presentation walkthrough demonstrates all three pages, visible selections, filtering, drill-through, back navigation, and reset behavior.
- [ ] Validation evidence clearly distinguishes independent data calculations, actual report-output checks, and the Windows Desktop walkthrough; unresolved failures are fixed before calling the package complete.
- [ ] The submitted scope remains the agreed 2015–2024 descriptive study, without adding forecasts, lap-by-lap pace, pit-stop speed analysis, or merged team lineages.

### Blocked by

- [#14](https://github.com/Habib-Amami/Power-BI-Dash/issues/14) — Drill through to race details and navigate the complete report.

## Execution order

1. Start with [#9](https://github.com/Habib-Amami/Power-BI-Dash/issues/9).
2. After #9 closes, [#10](https://github.com/Habib-Amami/Power-BI-Dash/issues/10), [#11](https://github.com/Habib-Amami/Power-BI-Dash/issues/11), and [#12](https://github.com/Habib-Amami/Power-BI-Dash/issues/12) are independently unblocked.
3. [#13](https://github.com/Habib-Amami/Power-BI-Dash/issues/13) waits for #10, #11, and #12.
4. [#14](https://github.com/Habib-Amami/Power-BI-Dash/issues/14) waits for #13.
5. [#15](https://github.com/Habib-Amami/Power-BI-Dash/issues/15) waits for #14.
