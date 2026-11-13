## Problem Statement

An F1 analyst needs to understand how drivers and constructors performed across the 2015–2024 seasons. The supplied CSV snapshot contains the relevant records, but it does not provide an interactive view of yearly trends, meaningful participation-based comparisons, championship standings, or the race results behind an aggregate.

Unequal season lengths, differing sprint counts, cumulative standings snapshots, team identity changes, and missing values can make a superficially plausible comparison misleading. In particular, championship points are not always equal to summed result points, and a team's two podium finishes in one race must not become two podium races.

The coursework also requires demonstrable data preparation, a clear data model, explicit DAX indicators, an interactive Power BI report, the supporting datasets, and documentation of at most five pages.

## Solution

Build an English-language Formula 1 dashboard covering all drivers and supplied constructor identities from 2015 through 2024. Use the supplied local CSV snapshot, preserve its raw records, and provide three connected pages: Overview, Yearly Comparisons, and Race Details.

Show race participation, Grand Prix wins, podium finishes, driver and team rates, and clearly distinguished result points and season-end championship points. Present trends across all ten seasons and compare a selected season with its immediately preceding year. Make filter context, missing comparisons, and full-season standings scope visible.

Use a readable dark motorsport theme with restrained red accents. Deliver a refreshable, validated Power BI report with its supporting data and a concise explanatory report. Final refresh and interaction validation take place in Power BI Desktop on a Windows machine accessible to the user.

## User Stories

1. As an F1 analyst, I want the dashboard to cover 2015–2024, so that I can compare ten seasons within one coherent study.
2. As an F1 analyst, I want all drivers and supplied constructor identities in the study, so that I can explore the entire field.
3. As an evaluator, I want the report to use the supplied CSV snapshot, so that the analysis is reproducible from the submitted data.
4. As an evaluator, I want the original raw data preserved, so that I can trace transformed values back to their source records.
5. As an evaluator, I want the data preparation and relationships explained, so that I can assess the cleaning and modeling work.
6. As an F1 analyst, I want the number of Grand Prix races in the current context, so that I understand the scope of a comparison.
7. As an F1 analyst, I want recorded driver Grand Prix entries counted explicitly, so that race participation has a consistent meaning.
8. As an F1 analyst, I want entries with retirement, withdrawal, or disqualification outcomes retained, so that participation is not understated.
9. As an F1 analyst, I want Grand Prix entries labeled accurately, so that they are not mistaken for confirmed race starts.
10. As an F1 analyst, I want Grand Prix wins and podium finishes counted separately, so that I can assess both winning and broader top-three performance.
11. As an F1 analyst, I want driver win rate based on that driver's Grand Prix entries, so that different participation levels are visible in the comparison.
12. As an F1 analyst, I want driver podium rate based on that driver's Grand Prix entries, so that a podium total has an interpretable denominator.
13. As an F1 analyst, I want team race appearances counted once per race, so that a constructor's two driver entries do not double its race exposure.
14. As an F1 analyst, I want team win rate based on team race appearances, so that team performance uses an appropriate denominator.
15. As an F1 analyst, I want team podium-race rate to count each race at most once, so that two podium finishes in one race do not inflate the rate.
16. As an F1 analyst, I want total podium finishes displayed distinctly from team podium races, so that both results remain understandable.
17. As an F1 analyst, I want totals and rates available together, so that seasons with different numbers of races can be compared with context.
18. As an F1 analyst, I want Grand Prix result points and sprint result points distinguished, so that different event types are not silently mixed.
19. As an F1 analyst, I want sprint wins and podium finishes distinguished from Grand Prix outcomes, so that sprint events do not inflate Grand Prix totals.
20. As an F1 analyst, I want driver season-end championship points taken from the supplied final standings, so that the ranking reflects the recorded championship outcome.
21. As an F1 analyst, I want constructor season-end championship points taken from the supplied final standings, so that differences from summed result points are preserved.
22. As an F1 analyst, I want result points and championship points labeled distinctly, so that I can interpret discrepancies correctly.
23. As an F1 analyst, I want each season's final standings used once, so that cumulative snapshots are not added across rounds.
24. As an F1 analyst, I want driver and constructor championship rankings kept separate, so that their points and identities are not conflated.
25. As an F1 analyst, I want full-season standings to retain their full-season meaning when a circuit is selected, so that a circuit filter cannot create a misleading championship total.
26. As an F1 analyst, I want full-season standings clearly labeled with their season, so that I understand their filter scope.
27. As an F1 analyst, I want a driver's championship total distinguished from points earned for a selected team, so that a team change does not cause misattribution.
28. As an F1 analyst, I want constructor identities preserved as supplied, so that renamed or reorganized teams are not merged without evidence.
29. As an F1 analyst, I want a trend across all ten seasons, so that I can identify changes over the study period.
30. As an F1 analyst, I want a selected season compared with the immediately preceding calendar year within the study, so that the yearly baseline is predictable.
31. As an F1 analyst, I want Yearly Comparisons to open at 2024 versus 2023, so that the latest available comparison is immediately useful.
32. As an F1 analyst, I want the previous-year comparison for 2015 displayed as N/A, so that the report respects the agreed study boundary.
33. As an F1 analyst, I want a missing previous-year driver or team participation displayed as N/A, so that absence is not presented as a zero-performance baseline.
34. As an F1 analyst, I want zero-baseline percentage changes displayed as N/A, so that undefined growth is not reported as a meaningful percentage.
35. As an F1 analyst, I want rate changes expressed in percentage points, so that a change from 25% to 30% is clearly shown as five percentage points.
36. As an F1 analyst, I want race and sprint counts visible as context for annual points, so that point totals are interpreted with their season exposure.
37. As an F1 analyst, I want an Overview page summarizing the study and its main indicators, so that I can understand the report quickly.
38. As an F1 analyst, I want a Yearly Comparisons page presenting trends and selected-year comparisons, so that I can investigate performance changes.
39. As an F1 analyst, I want a Race Details page showing the records behind an aggregate, so that I can verify an observation.
40. As an F1 analyst, I want season, driver, team, and circuit filters, so that I can narrow the analysis to the question I am investigating.
41. As an F1 analyst, I want applicable filters to affect race-result measures consistently, so that related visuals tell the same story.
42. As an F1 analyst, I want the active filter context visible, so that I can explain what the displayed results represent.
43. As an F1 analyst, I want to drill through from a driver, team, or result context to supporting race records, so that I can move from summary to evidence.
44. As an F1 analyst, I want navigation back to the summary pages, so that I can continue an investigation after examining details.
45. As an F1 analyst, I want reset controls that restore documented defaults, so that I can recover a known presentation state.
46. As an F1 analyst, I want missing numeric values displayed as N/A, so that unknown values are not confused with zero.
47. As an F1 analyst, I want records retained when one measurement is missing, so that unrelated participation and result information remain available.
48. As an F1 analyst, I want recorded finishing status visible in race details, so that a missing numerical finish can still be interpreted.
49. As an F1 analyst, I want rates with no eligible denominator displayed as N/A, so that empty selections do not produce misleading percentages.
50. As a presenter, I want readable charts and a consistent dark motorsport theme, so that the report is clear during evaluation.
51. As a presenter, I want restrained red accents and clear labels, so that visual emphasis supports interpretation.
52. As an evaluator, I want English terminology used consistently across the report, measures, and documentation, so that the analysis is easy to follow.
53. As an evaluator, I want the source described honestly as the supplied CSV snapshot with unverified original provenance, so that the report makes no unsupported attribution.
54. As an evaluator, I want the completed Power BI file and supporting datasets, so that I can open and inspect the submitted work.
55. As an evaluator, I want a report of at most five pages explaining the objective, sources, transformations, model, indicators, visuals, and limitations, so that I can assess the project efficiently.
56. As an evaluator, I want a refresh from the packaged data to succeed, so that the submission is reproducible outside the author's original working location.
57. As an evaluator, I want known dataset totals and championship points checked against the report, so that I can trust the core indicators.
58. As a presenter, I want the final Windows Power BI Desktop walkthrough to exercise filters, navigation, drill-through, and reset behavior, so that the report is ready for evaluation.

## Implementation Decisions

- Use the supplied local CSV snapshot as the input. Restrict the analytical study to 2015–2024 and preserve the original raw records. Import only the tables needed for the agreed analysis; the presence of lap and pit data does not require timing analyses.
- Organize the report around refreshable Power Query preparation, a semantic model with unambiguous dimension relationships, explicit DAX measures, and the three report pages. Keep Grand Prix results, sprint results, and cumulative standings at their distinct grains, sharing relevant season, race, driver, constructor, circuit, and status context without multiplying fact records.
- Normalize source missing-value markers and empty numeric cells to missing values, apply appropriate types, retain source identifiers, and document transformations. Preserve fractional points and every in-scope result record.
- Count a recorded driver/race result as one Grand Prix entry, including recorded retirement, withdrawal, and disqualification outcomes. The inspected study window has unique driver/race pairs; verify that assumption during preparation rather than silently deleting records.
- Define driver win rate as Grand Prix wins divided by that driver's Grand Prix entries, and driver podium rate as Grand Prix podium finishes divided by that driver's Grand Prix entries. Identify wins and podium finishes from recorded classified finishing positions.
- Define a team race appearance as a Grand Prix race with at least one recorded entry for the constructor. Divide team wins by team race appearances for team win rate. Divide races with at least one team podium finish by team race appearances for team podium-race rate. Preserve the separate total of individual podium finishes.
- Keep Grand Prix and sprint result points, wins, and podium finishes explicitly distinguishable. Neither sprint outcomes nor their absence before their recorded coverage changes the Grand Prix rate denominator.
- Select season-end championship points from the supplied season-final standings snapshots. Never sum cumulative standings over rounds or reconstruct championship points from result-point sums. Present season-end standings by season and competitor, retaining source differences between result points and championship points.
- Preserve supplied constructor identities across seasons. Display constructors as Team in the report. Do not merge identities through an inferred historical lineage.
- Apply applicable season, driver, team, and circuit filters to race-result measures. Keep a clearly labeled full-season standings section: driver standings use their season and driver context; constructor standings use their season and constructor context. Circuit or race filtering must not reattribute championship points to a subset of races, and a constructor selection must not reattribute a driver's complete championship total to that constructor.
- Show trends across the study period. Use a selected season and its immediately preceding calendar year within the study for yearly comparisons. Initialize Yearly Comparisons at 2024 versus 2023; a 2015 selection has no baseline. Previous year means the preceding calendar year, even if that year is not otherwise selected in a visual.
- Use N/A for missing previous-year participation and undefined percentage changes from a zero baseline. Express differences between rates in percentage points; calculate percentage changes in totals only when the baseline is defined and nonzero. Retain race and sprint counts as context for points comparisons.
- Display missing measurements and rates without an eligible denominator as N/A. Exclude missing values only from calculations that require those values, preserve the underlying entry records, and expose recorded finishing status in race details.
- Build Overview, Yearly Comparisons, and Race Details with consistent English terminology, a readable dark theme, restrained red accents, visible selection context, relevant slicers, drill-through, page navigation, and reset controls. Full-season standings scope must remain understandable alongside filtered race measures.
- Package the report with the supporting data and reproducible refresh instructions. Validate the completed Power BI file in Power BI Desktop on Windows. Produce an English explanatory report of at most five pages covering the objective, sources, transformations, model, measures, visuals, and limitations.

## Testing Decisions

- Use one primary acceptance boundary: the observable outputs and interactions of the report refreshed from its packaged dataset. This is the report refresh, KPI output, and interaction boundary already approved during the design interview. Do not introduce a second application or an internal implementation interface solely for testing.
- Verify externally visible behavior rather than formula text, query organization, internal helper structure, or chart implementation. The behavior under test includes data preparation as reflected in refreshed records, semantic relationships as reflected in filtering, DAX outputs, and report interactions.
- No runnable report, existing test harness, or automated test suite currently exists in this repo. Prior art is the read-only CSV inspection that established the full-snapshot reference counts, point reconciliations, missing-value cases, and team-rate scenarios. Turn those reference results into acceptance expectations; independent CSV calculations support the checks but do not establish that the Power BI report works.
- For the unfiltered 2015–2024 study, verify 209 distinct Grand Prix races and 4,219 driver Grand Prix entries. Check source key uniqueness and relationships without silently removing valid entries.
- For 2024, verify 24 Grand Prix wins and 72 Grand Prix podium finishes. Check that sprint wins, podiums, and result points remain separate and do not inflate these Grand Prix totals or denominators.
- Exercise the same report-output boundary with small, independently hand-calculated examples for driver entry rates, team race appearances, and a race where both team drivers finish on the podium. That race must produce two podium finishes and one team podium race.
- Reconcile driver and constructor season-end championship points with the supplied final standings, using terminal snapshots once per season. Explicitly cover the observed constructor differences: 2018 Force India has 111 summed result points versus 52 season-end championship points; 2020 Racing Point has 210 versus 195. Preserve these differences without claiming the CSVs establish their causes.
- Verify that circuit and race filtering changes applicable result measures while full-season standings retain their labeled scope. Verify that driver and constructor standings remain independently attributable when competitor filters are used.
- Verify the 2024 versus 2023 default, the 2015 boundary, a competitor missing from the previous year, a zero percentage-change baseline, and a rate change from 25% to 30%. The last case must display a five-percentage-point change.
- Verify that missing numeric values remain N/A, source records with missing values remain available, no-eligible-entry rates are N/A, and recorded retirement, withdrawal, or disqualification outcomes remain included in entry counts.
- Validate season, driver, team, and circuit filtering; drill-through context; page and back navigation; and restoration of documented defaults through reset controls. Complete these interaction checks in Power BI Desktop, since reference calculations alone cannot validate report navigation or visual filtering.
- Perform a final refresh from the packaged data on the user's accessible Windows Power BI Desktop environment. Verify the submission contains the completed Power BI file, the supporting datasets, and the explanatory report within the five-page limit. Preserve the evidence of what was actually validated, distinguishing automated checks from Desktop walkthrough results.

## Out of Scope

- Seasons outside 2015–2024, including a 2025 or 2026 update, and acquisition of a replacement dataset.
- Live race tracking, live data ingestion, production deployment, or a scheduled refresh service.
- Forecasting, machine learning, and claims of causal driver or constructor superiority beyond the recorded measures.
- Lap-by-lap pace, pit-stop speed, telemetry, tyre strategy, weather, budget, or salary analysis.
- Invented mappings that merge renamed or reorganized constructors into a single lineage.
- Reconstructing championship rules, rescoring every season under a common scoring system, or inventing explanations for result-point/standings differences.
- Treating participation-based rates as a complete adjustment for every sporting or calendar difference between seasons.
- A separate custom web dashboard or an enterprise analytics platform.

## Further Notes

- The supplied snapshot extends from 1950 through 2024, but the agreed analytical study is 2015–2024. Existing older records do not extend the first yearly-comparison baseline beyond that boundary.
- The study window contains 53 drivers and 18 supplied constructor identities. Annual race counts range from 17 to 24, and sprint availability differs by season. These are context for interpretation, not missing seasons to fill with zeros.
- The original download source and dataset license are unverified. Describe the input as the supplied local Formula 1 CSV snapshot; add a verified original attribution if it becomes available. Wikipedia links in dimension records do not establish dataset provenance.
- The assignment calls for individual work, submission via Classroom on November 30 at midnight, and in-person evaluation on December 1 and 8. Its brief does not state a year; do not infer a different scheduling commitment from this specification.
- Requesting this specification follows the user's approval of the design interview choices. The refresh, output reconciliation, filter behavior, navigation, and final Desktop validation criteria are already agreed; no additional testing boundary is being introduced.
