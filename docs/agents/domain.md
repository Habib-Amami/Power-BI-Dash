# Domain Docs

This repo uses a single-context layout: one root `GLOSSARY.md` and root `docs/adr/`.

## Before exploring, read these

- **`GLOSSARY.md`** at the repo root.
- **`docs/adr/`**: read ADRs that touch the area you are about to work in.

If these files do not exist, proceed silently. The `/domain-modeling` skill creates them lazily when terms or decisions actually get resolved.

## File structure

```text
/
├── GLOSSARY.md
└── docs/adr/
    ├── 0001-<decision>.md
    └── 0002-<decision>.md
```

## Use the glossary's vocabulary

When your output names a domain concept (in an issue title, a refactor proposal, a hypothesis, or a test name), use the term defined in `GLOSSARY.md`.

If a concept is missing, reconsider whether the project uses it or note a real gap for `/domain-modeling`.

## Flag ADR conflicts

If your output contradicts an existing ADR, surface the conflict explicitly and explain why the decision should be reopened.
