# SeoulMate v2.0 — Plán fází a milníků (Roadmap & Milestones)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**Backlog úkolů:** [26_TASK_BACKLOG.md](26_TASK_BACKLOG.md)

---

## 1. Časová osa fází projektu

```text
┌────────────────────────────────────────────────────────────────────────┐
│ Fáze A: Kompletní Specifikace & Audit (DOKONČENO)                      │
│ Master Plan, PRD, AC, Backlog, Zero-Cost Audit, Matice sledovatelnosti │
└──────────────────────────────────┬─────────────────────────────────────┘
                                   │ Gate 1: Documentation Sign-Off
┌──────────────────────────────────▼─────────────────────────────────────┐
│ Fáze B: Stabilizace Baseline & Datové jádro (Local-First)              │
│ Git baseline tag, Drift SQLite tabulky, Outbox worker, Firestore adaptér│
└──────────────────────────────────┬─────────────────────────────────────┘
                                   │ Gate 2: Local-First Core Ready
┌──────────────────────────────────▼─────────────────────────────────────┐
│ Fáze C: UI Shell, Design Systém & Adaptivní Home                       │
│ AppShell 5 záložek, Dancheong téma, Adaptivní "Co teď?", Haechi widget │
└──────────────────────────────────┬─────────────────────────────────────┘
                                   │ Gate 3: UI Shell & Navigation Signed Off
┌──────────────────────────────────▼─────────────────────────────────────┐
│ Fáze D: P0 Cestovní Moduly (Must-Have)                                 │
│ Vault (šifrované PDF), Emergency Center, Budget Split, Korean, Offline │
└──────────────────────────────────┬─────────────────────────────────────┘
                                   │ Gate 4: Core Travel Features Ready
┌──────────────────────────────────▼─────────────────────────────────────┐
│ Fáze E: P1 Chytré Propojení & Rozšíření                                │
│ Camera OCR (ML Kit), Inbox, Smart Itinerary, Decision Center, PDF Book │
└──────────────────────────────────┬─────────────────────────────────────┘
                                   │ Gate 5: All P0 & P1 Modules Complete
┌──────────────────────────────────▼─────────────────────────────────────┐
│ Fáze F: Hardening, Bezpečnost & Mobilní Release (RC)                   │
│ A11y 150% scaling testy, Offline resilience, Bezpečnostní audit pravidel│
└──────────────────────────────────┬─────────────────────────────────────┘
                                   │ Gate 6: Production Flight Release
┌──────────────────────────────────▼─────────────────────────────────────┐
│ Fáze G: P2 Desktop Companion (Po návratu z cesty)                      │
│ Windows & macOS verze pro plánování na PC (bez exkluzivních funkcí)    │
└────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Definice schvalovacích bran (Quality Gates)

### Gate 1: Dokumentační připravenost (Fáze A -> B)
- **Kritéria:** 100% výrobní dokumentace v `docs/v2/` vytvořena, matice sledovatelnosti propojuje všech 50 požadavků, nulové změny v kódu.
- **Stav:** **DOKONČENO A SCHVÁLENO**.

### Gate 2: Local-First jádro a Drift DB (Fáze B -> C)
- **Kritéria:** Všechny tabulky v Drift SQLite jsou vytvořeny, CRUD testy procházejí na 100 %, Outbox ukládá změny offline.
- **Stav:** Připraveno k zahájení (`TASK-BASELINE-01`).

### Gate 3: UI Shell, Navigace & Adaptivní Home (Fáze C -> D)
- **Kritéria:**
  - `AppShell` umožňuje plynulé přepínání mezi 5 hlavními sekcemi s vizuální odezvou.
  - Tlačítko `Emergency` je trvale přístupné z libovolné obrazovky do 1 klepnutí.
  - Domovská obrazovka adaptivně reaguje na čas a stav tripu a zobrazuje dominantní kartu „Co teď?“.
  - Lokální stavový automat maskota Haechiho správně přepíná mezi 11 stavy na základě pravidel bez externí AI.

### Gate 4: P0 Moduly a Cestovní spolehlivost (Fáze D -> E)
- **Kritéria:** Travel Vault bezpečně šifruje lokální PDF letenek, Emergency funguje offline, rozpočet v KRW správně dělí útratu mezi 4 členy, korejské fráze přehrávají audio.

### Gate 5: Dokončení všech P0 a P1 modulů (Fáze E -> F)
- **Kritéria:**
  - Všech 44 funkčních požadavků a 6 nefunkčních požadavků ze specifikace [03_PRD.md](03_PRD.md) je plně implementováno.
  - Camera Companion spolehlivě rozpoznává korejský Hangul on-device přes Google ML Kit.
  - Group Decision Center agreguje všechny nerozhodné volby skupiny.
  - Mobilní generátor PDF Trip Booku vytváří validní vícestránkový fotodeník.
  - Synchronizační diagnostika v Sync Centru potvrzuje nulové neřešené chyby.

### Gate 6: Finální Release Candidate (Fáze F)
- **Kritéria:** Release build APK/AAB je sestavitelný, prošel testy přístupnosti při 150% škálování a testem simulovaného offline provozu bez sítě.
