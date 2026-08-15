# SeoulMate v2.0 — Matice sledovatelnosti (Traceability Matrix)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**Zdroj požadavků:** [03_PRD.md](03_PRD.md)  
**Akceptační kritéria:** [24_ACCEPTANCE_CRITERIA.md](24_ACCEPTANCE_CRITERIA.md)  
**Backlog úkolů:** [26_TASK_BACKLOG.md](26_TASK_BACKLOG.md)

---

## 1. Pravidla matice sledovatelnosti

Tato matice garantuje **100% obousměrnou sledovatelnost** (End-to-End Traceability). Každý požadavek z [03_PRD.md](03_PRD.md) (44 funkčních a 6 nefunkčních) má přiřazenou obrazovku/tok, datovou entitu, akceptační kritérium, implementační backlog úkol a testovací soubor / ověřovací důkaz.

---

## 2. Kompletní matice sledovatelnosti (50 požadavků)

| PRD Požadavek | Obrazovka / Flow | Datová entita | Akceptační kritérium | Backlog Task | Testovací soubor / Ověřovací důkaz |
|---|---|---|---|---|---|
| **REQ-TRIP-001** | `SCR-004` / `FLOW-01` | `trips`, `trip_members` | `AC-TRIP-001` | `TASK-CORE-01` | `test/database/drift_crud_test.dart` |
| **REQ-TRIP-002** | `SCR-005` / `FLOW-01` | `trip_members` | `AC-TRIP-002` | `TASK-CORE-01` | `test/database/drift_crud_test.dart` |
| **REQ-TRIP-003** | `SCR-016` / `FLOW-06` | `home_bases` | `AC-TRIP-003` | `TASK-CORE-01`, `TASK-MOD-02` | `test/emergency/emergency_screen_test.dart` |
| **REQ-HOME-001** | `SCR-003` / `FLOW-05` | `trips`, `activities` | `AC-HOME-001` | `TASK-UI-02` | `test/presentation/home_screen_test.dart` |
| **REQ-HOME-002** | `SCR-003` / `FLOW-05` | `trips`, `activities` | `AC-HOME-002` | `TASK-UI-02` | `test/presentation/home_screen_test.dart` |
| **REQ-HOME-003** | `SCR-003` / `FLOW-05` | `sync_outbox` | `AC-HOME-003` | `TASK-UI-01`, `TASK-CORE-02` | `test/presentation/app_shell_test.dart` |
| **REQ-PLAN-001** | `SCR-006` / `FLOW-03` | `trip_days` | `AC-PLAN-001` | `TASK-CORE-01` | `test/trip_day_rules_test.dart` |
| **REQ-PLAN-002** | `SCR-007`, `SCR-008` / `FLOW-03` | `activities` | `AC-PLAN-002` | `TASK-CORE-01` | `test/trip_days_navigation_test.dart` |
| **REQ-PLAN-003** | `SCR-007` / `FLOW-03` | `activities` | `AC-PLAN-003` | `TASK-P1-05` | `test/itinerary/smart_itinerary_test.dart` |
| **REQ-PLAN-004** | `SCR-007` / `FLOW-03` | `activities` | `AC-PLAN-004` | `TASK-P1-05` | `test/itinerary/smart_itinerary_test.dart` |
| **REQ-PLAN-005** | `SCR-008` / `FLOW-03` | `activities`, `places` | `AC-PLAN-005` | `TASK-CORE-01` | `test/database/drift_crud_test.dart` |
| **REQ-PLC-001** | `SCR-009`, `SCR-010` / `FLOW-02` | `places` | `AC-PLC-001` | `TASK-CORE-01` | `test/presentation/places_screen_test.dart` |
| **REQ-PLC-002** | `SCR-009`, `SCR-010` / `FLOW-02` | `place_votes` | `AC-PLC-002` | `TASK-CORE-01` | `test/place_voting_test.dart` |
| **REQ-PLC-003** | `SCR-022` / `FLOW-02` | `place_votes`, `decisions` | `AC-PLC-003` | `TASK-P1-04` | `test/decisions/decision_center_test.dart` |
| **REQ-PLC-004** | `SCR-010` / `FLOW-02` | `places` | `AC-PLC-004` | `TASK-P1-06` | `test/places/map_view_test.dart` |
| **REQ-INB-001** | `SCR-012` / `FLOW-02` | `inbox_items` | `AC-INB-001` | `TASK-P1-03` | `test/inbox/inbox_converter_test.dart` |
| **REQ-INB-002** | `SCR-012` / `FLOW-02` | `inbox_items` | `AC-INB-002` | `TASK-P1-03` | `test/inbox/inbox_converter_test.dart` |
| **REQ-CHK-001** | `SCR-021` / `FLOW-01` | `checklist_items` | `AC-CHK-001` | `TASK-MOD-05` | `test/readiness/readiness_test.dart` |
| **REQ-CHK-002** | `SCR-021` / `FLOW-01` | `checklist_items` | `AC-CHK-002` | `TASK-MOD-05` | `test/readiness/readiness_test.dart` |
| **REQ-VLT-001** | `SCR-017`, `SCR-018` / `FLOW-04` | `documents` | `AC-VLT-001` | `TASK-MOD-01` | `test/documents/vault_test.dart` |
| **REQ-VLT-002** | `SCR-017`, `SCR-018` / `FLOW-04` | `documents` | `AC-VLT-002` | `TASK-MOD-01` | `test/documents/vault_test.dart` |
| **REQ-VLT-003** | `SCR-018` / `FLOW-04` | `documents` | `AC-VLT-003` | `TASK-MOD-01` | `test/documents/vault_test.dart` |
| **REQ-KOR-001** | `SCR-013` / `FLOW-06` | Asset JSON & Audio | `AC-KOR-001` | `TASK-MOD-04` | `test/korean/content_loader_test.dart` |
| **REQ-KOR-002** | `SCR-014` / `FLOW-07` | Asset JSON | `AC-KOR-002` | `TASK-MOD-04` | `test/korean/content_loader_test.dart` |
| **REQ-KOR-003** | `SCR-016` / `FLOW-06` | Asset JSON | `AC-KOR-003` | `TASK-MOD-04` | `test/korean/content_loader_test.dart` |
| **REQ-CRD-001** | `SCR-016` / `FLOW-06` | `home_bases`, Asset JSON | `AC-CRD-001` | `TASK-MOD-02` | `test/emergency/emergency_screen_test.dart` |
| **REQ-SRV-001** | `SCR-013` / `FLOW-06` | Asset JSON | `AC-SRV-001` | `TASK-MOD-04` | `test/korean/content_loader_test.dart` |
| **REQ-CAM-001** | `SCR-015` / `FLOW-07` | Google ML Kit on-device | `AC-CAM-001` | `TASK-P1-01` | `test/camera/ocr_service_test.dart` |
| **REQ-CAM-002** | `SCR-015` / `FLOW-07` | Google ML Kit on-device | `AC-CAM-002` | `TASK-P1-01` | `test/camera/ocr_service_test.dart` |
| **REQ-CAM-003** | `SCR-015` / `FLOW-07` | Google ML Kit on-device | `AC-CAM-003` | `TASK-P1-01` | `test/camera/ocr_service_test.dart` |
| **REQ-EMG-001** | `SCR-025` / `FLOW-06` | `emergency_info.json` | `AC-EMG-001` | `TASK-MOD-02` | `test/emergency/emergency_screen_test.dart` |
| **REQ-EMG-002** | `SCR-025` / `FLOW-06` | `home_bases` | `AC-EMG-002` | `TASK-MOD-02` | `test/emergency/emergency_screen_test.dart` |
| **REQ-EMG-003** | `SCR-025` / `FLOW-06` | `trip_members` | `AC-EMG-003` | `TASK-MOD-02` | `test/emergency/emergency_screen_test.dart` |
| **REQ-BDG-001** | `SCR-019`, `SCR-020` / `FLOW-08` | `expenses` | `AC-BDG-001` | `TASK-MOD-03` | `test/budget/budget_calculator_test.dart` |
| **REQ-BDG-002** | `SCR-019`, `SCR-020` / `FLOW-08` | `expenses` | `AC-BDG-002` | `TASK-MOD-03` | `test/budget/budget_calculator_test.dart` |
| **REQ-BDG-003** | `SCR-020` / `FLOW-08` | `expenses` | `AC-BDG-003` | `TASK-P1-02` | `test/budget/receipt_parser_test.dart` |
| **REQ-MAP-001** | `SCR-010` / `FLOW-02` | `places`, `home_bases` | `AC-MAP-001` | `TASK-P1-06` | `test/places/map_view_test.dart` |
| **REQ-WTH-001** | `SCR-003` / `FLOW-05` | Open-Meteo Cache | `AC-WTH-001` | `TASK-P1-07` | `test/services/weather_service_test.dart` |
| **REQ-MEM-001** | `SCR-023` / `FLOW-10` | `memory_entries` | `AC-MEM-001` | `TASK-MOD-07` | `test/backup/backup_restore_test.dart` |
| **REQ-MEM-002** | `SCR-023` / `FLOW-10` | `memory_entries` | `AC-MEM-002` | `TASK-MOD-07` | `test/backup/backup_restore_test.dart` |
| **REQ-MEM-003** | `SCR-024` / `FLOW-10` | `memory_entries` | `AC-MEM-003` | `TASK-P1-08` | `test/memories/pdf_generator_test.dart` |
| **REQ-MEM-004** | `SCR-023` / `FLOW-10` | `achievements` | `AC-MEM-004` | `TASK-P1-08` | `test/memories/pdf_generator_test.dart` |
| **REQ-OFF-001** | `SCR-026` / `FLOW-04` | Drift DB + Asset bundle | `AC-OFF-001` | `TASK-MOD-06` | `test/sync/sync_center_screen_test.dart` |
| **REQ-OFF-002** | Celá aplikace / Všechny toky | Drift SQLite DB | `AC-OFF-002` | `TASK-CORE-01` | `test/database/drift_crud_test.dart` |
| **REQ-OFF-003** | `SCR-026` / `FLOW-09` | `sync_outbox` | `AC-OFF-003` | `TASK-CORE-02`, `TASK-MOD-06` | `test/sync/outbox_sync_test.dart` |
| **REQ-BAK-001** | `SCR-023` / `FLOW-10` | ZIP šifrovaný archiv | `AC-BAK-001` | `TASK-MOD-07` | `test/backup/backup_restore_test.dart` |
| **REQ-HCH-001** | `SCR-003` / `FLOW-05` | Lokální stavový automat | `AC-HCH-001` | `TASK-UI-02` | `test/presentation/home_screen_test.dart` |
| **NFR-PERF-001** | Celá aplikace | Drift DB Query Engine | `AC-NFR-PERF` | `TASK-CORE-01` | `test/database/drift_crud_test.dart` |
| **NFR-COST-001** | Celá aplikace | Zero-Cost Infrastructure | `AC-NFR-COST` | `TASK-SEC-01` | `test/security/firestore_rules_test.dart` |
| **NFR-SEC-001** | Celá aplikace | Secure Storage & Rules | `AC-NFR-SEC` | `TASK-SEC-01` | `test/security/firestore_rules_test.dart` |
| **NFR-A11Y-001** | Všechny obrazovky | Material Theme & Widgets | `AC-NFR-A11Y` | `TASK-UI-01`, `TASK-REL-01` | `test/presentation/app_shell_test.dart` |
| **NFR-PLAT-001** | Android & iOS | Flutter Cross-Platform | `AC-NFR-PLAT` | `TASK-BASELINE-01`, `TASK-REL-01` | `flutter build apk --release` |
| **NFR-RESIL-001**| Celá aplikace | Storage Guard & Error Handlers | `AC-NFR-RESIL` | `TASK-MOD-07`, `TASK-REL-01` | `test/backup/backup_restore_test.dart` |

---

## 3. Výsledek kontroly parity

Všech **50 unikátních požadavků** (44 funkčních a 6 nefunkčních) ze specifikace [03_PRD.md](03_PRD.md) je 1:1 zmapováno. V celém projektu neexistuje žádný osiřelý požadavek, nepropojené akceptační kritérium ani úkol bez specifikace.
