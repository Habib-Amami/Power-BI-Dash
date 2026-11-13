# Formula 1 Dashboard

An interactive view of Formula 1 competition for exploring performance through indicators and comparisons.

## Language

**Formula 1 dashboard**:
The project's interactive report for exploring Formula 1 competition and comparing performance.
_Avoid_: Live race tracker, prediction engine

**Season**:
The races grouped under one competition year.
_Avoid_: Calendar, race weekend

**Yearly comparison**:
A comparison of the same performance measure across seasons.
_Avoid_: Race-to-race comparison

**Driver**:
An individual competitor whose race results and championship standings are tracked separately.
_Avoid_: Team, constructor

**Constructor**:
A team identity recorded for a competitor in the constructors' championship. The dashboard uses "Team" as its display label and keeps the supplied identities separate across seasons.
_Avoid_: Merged team lineage

**Grand Prix race**:
The main race associated with a championship round, distinct from a sprint.
_Avoid_: Sprint, race weekend

**Grand Prix entry**:
A recorded driver participation in a Grand Prix race, including entries with retirement, withdrawal, or disqualification outcomes.
_Avoid_: Confirmed race start, sprint entry

**Team race appearance**:
A Grand Prix race with at least one recorded entry for a constructor.
_Avoid_: Driver entry, season participation

**Sprint**:
A separate competitive race associated with some championship rounds, with its own results and awarded points.
_Avoid_: Grand Prix race, qualifying

**Win**:
A first-place result in the stated event type. Grand Prix wins and sprint wins are separate counts.
_Avoid_: Championship title

**Podium finish**:
A result in one of the first three positions in the stated event type. Grand Prix podium finishes and sprint podium finishes are separate counts.
_Avoid_: Points finish

**Result points**:
Points awarded in individual Grand Prix or sprint results, with the event type stated explicitly.
_Avoid_: Season-end championship points

**Season-end championship points**:
The competitor's cumulative points recorded in the championship standings at the end of a season.
_Avoid_: Sum of standings snapshots, result points

**Driver win rate**:
A driver's Grand Prix wins divided by their Grand Prix entries.
_Avoid_: Share of all drivers' wins

**Driver podium rate**:
A driver's Grand Prix podium finishes divided by their Grand Prix entries.
_Avoid_: Team podium-race rate

**Team win rate**:
A constructor's Grand Prix wins divided by its team race appearances.
_Avoid_: Wins divided by driver entries

**Team podium race**:
A Grand Prix race in which at least one driver records a podium finish for a constructor. Two podium finishes for that constructor in the same race count as one team podium race.
_Avoid_: Podium finish count

**Team podium-race rate**:
A constructor's team podium races divided by its team race appearances.
_Avoid_: Podium finishes divided by races
