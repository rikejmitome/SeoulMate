# SeoulMate v2.0 — Rozcestník dokumentace (Documentation Index)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený plán:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)

---

## 1. Struktura kompletní výrobní dokumentace v2.0

```text
docs/v2/
├── [VSTUPNÍ SPECIFIKACE]
│   ├── 00_MASTER_PLAN.md                  # Hlavní zadávací dokument a vize (Zachováno)
│   ├── 23_CLAUDE_CODE_HANDOFF.md          # Zadávací kontrakt pro implementaci (Zachováno)
│   └── ANTIGRAVITY_DOCUMENTATION_BRIEF.md # Primární zadání dokumentačního úkolu (Zachováno)
│
├── [PRODUKTOVÁ A UX SPECIFIKACE]
│   ├── 01_VISION_AND_PRINCIPLES.md        # Vize, JTBD a neměnné principy
│   ├── 02_PRODUCT_SCOPE.md                # Rozsah P0, P1, P2 a mobilní úplnost
│   ├── 03_PRD.md                          # Kompletní funkční (REQ) a nefunkční (NFR) požadavky
│   ├── 04_PERSONAS_AND_JOBS.md            # Persony 4 cestovatelů a situace
│   ├── 05_USER_FLOWS.md                   # 10 detailních uživatelských toků
│   ├── 06_INFORMATION_ARCHITECTURE.md     # Navigační struktura a strom modulů
│   ├── 07_SCREEN_CATALOG.md               # Katalog 26 obrazovek
│   ├── 08_UX_SPECIFICATION.md             # Pravidla pro "Co teď?", Show to Local a stres
│   ├── 09_DESIGN_SYSTEM.md                # Paleta Hanok/Dancheong, Pretendard, komponenty
│   ├── 10_HAECHI_GUIDE.md                 # 11 stavů maskota Haechiho a šablony
│   └── 11_CONTENT_STRATEGY.md             # Česká fonetika, alergeny, jídla a fráze
│
├── [TECHNICKÁ A SYSTÉMOVÁ ARCHITEKTURA]
│   ├── 12_TECHNICAL_ARCHITECTURE.md       # Feature-First, Riverpod, Drift SQLite, Outbox
│   ├── 13_DATA_MODEL.md                   # Entitní diagram a schémata Drift tabulek
│   ├── 14_SYNC_AND_CONFLICTS.md           # Outbox pattern, LWW, Decision Center
│   ├── 15_OFFLINE_STRATEGY.md             # Offline Trip Pack, velikosti, manifest
│   ├── 16_INTEGRATIONS_AND_DATA_SOURCES.md# ML Kit, Open-Meteo, Naver/Kakao, Firestore
│   ├── 17_SECURITY_AND_PRIVACY.md         # AES-256 Vault, Firestore rules, žádné PII
│   ├── 18_ACCESSIBILITY_AND_LOCALIZATION.md# A11y 150% scaling, čeština/korejština
│   ├── 19_TESTING_STRATEGY.md             # Pyramida testů, unit/widget/e2e plán
│   └── 20_RELEASE_AND_DISTRIBUTION.md     # APK/AAB build, distribuce pro 4 přátele
│
├── [MIGRACE, POSTUP A REALIZACE]
│   ├── 21_MIGRATION_V1_TO_V2.md           # Inkrementální vrstvy migrace z v1 na v2
│   ├── 22_CODEX_WORKFLOW.md               # Pravidla pro vývojové agenty a commit formát
│   ├── 24_ACCEPTANCE_CRITERIA.md          # Given-When-Then kritéria pro všech 50 požadavků
│   ├── 25_ROADMAP.md                      # Fáze A–G, schvalovací brány Gate 1–6
│   ├── 26_TASK_BACKLOG.md                 # Atomické úkoly s DoD pro všechny moduly
│   └── 27_SETUP_FOR_BEGINNERS.md          # Průvodce rozběhnutím projektu
│
├── [REGISTRY, MATICE A MANIFESTY]
│   ├── ZERO_COST_REGISTER.md              # Zákaz Storage (Blaze), audit bezplatnosti
│   ├── RISK_REGISTER.md                   # Rizika, závažnost a mitigační spouštěče
│   ├── TRACEABILITY_MATRIX.md             # 100% propojení: REQ -> AC -> TASK -> Test
│   ├── CONTENT_INVENTORY.md               # Inventář frází, jídel a survival tipů
│   ├── ASSET_MANIFEST.md                  # Přehled statických souborů
│   ├── DECISIONS.md                       # Záznamy klíčových rozhodnutí (ADR)
│   ├── GLOSSARY.md                        # Cestovní a technický slovníček pojmů
│   └── DOCUMENTATION_INDEX.md             # Tento rozcestník
│
├── [AUDIT EXISTUJÍCÍHO KÓDU (docs/v2/audit/)]
│   ├── DEPENDENCY_AND_COST_AUDIT.md       # Audit balíčků v1.0 a Zero-Cost ověření
│   ├── FEATURE_INVENTORY.md               # Klasifikace stávajících modulů (KEEP/REFINE...)
│   ├── REPOSITORY_AUDIT.md                # Výchozí stav (pouze Android a iOS)
│   ├── TEST_BASELINE.md                   # Audit stávajících testů
│   └── MIGRATION_RECOMMENDATION.md        # Doporučení fázovaného postupu
│
└── [NÁVRHY KOŘENOVÝCH SOUBORŮ (docs/v2/proposed-root-files/)]
    ├── AGENTS.md                          # Závazné instrukce pro agenty
    ├── CLAUDE.md                          # Konfigurace pro Claude Code
    └── SETUP.md                           # Rychlý start projektu
```
