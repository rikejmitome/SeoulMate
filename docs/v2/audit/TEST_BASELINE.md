# SeoulMate v2.0 — Audit testovacího základu (Test Baseline Audit)

**Datum auditu:** 15. srpna 2026  
**Stav:** VERIFIED  
**Auditor:** Antigravity Architecture Lead  
**Nadřazený dokument:** [../00_MASTER_PLAN.md](../00_MASTER_PLAN.md)  
**Testovací strategie:** [../19_TESTING_STRATEGY.md](../19_TESTING_STRATEGY.md)

---

## 1. Soupis existujících testů v repozitáři v1.0

| Testovací soubor | Testovaná oblast | Typ testu | Zjištěný rozsah |
|---|---|---|---|
| `test/auth_validators_test.dart` | Validace e-mailu a hesla | Unit test | Pokrývá formát e-mailu a délku/sílu hesla. |
| `test/place_vote_rules_test.dart` | Pravidla hlasování o místech | Unit test | Ověřuje povolené stavy hlasů (upvote, downvote, neutral). |
| `test/place_voting_test.dart` | Výpočet skóre hlasování 4 přátel | Unit / Domain test | Ověřuje shodu 4 hlasujících a řazení podle oblíbenosti. |
| `test/trip_day_rules_security_test.dart` | Oprávnění pro dny tripu | Security unit test | Ověřuje autorizaci člena vůči tripId. |
| `test/trip_day_rules_test.dart` | Pravidla řazení a datumů dnů | Domain unit test | Ověřuje kontinuitu datumů a omezení začátku/konce cesty. |
| `test/trip_days_navigation_test.dart` | Navigační toky dnů | Widget / Flow test | Testuje přechody a zobrazení prázdných/naplněných stavů dnů. |
| `test/widget_test.dart` | Základní smoke test | Widget test | Výchozí šablonový test. |

---

## 2. Analýza mezer pro v2.0 a povinné budoucí testy

Pro přechod na v2.0 musí implementace doplnit testy specifikované v [../26_TASK_BACKLOG.md](../26_TASK_BACKLOG.md):
1. **Drift SQLite CRUD testy:** `test/database/drift_crud_test.dart`
2. **Outbox synchronizace:** `test/sync/outbox_sync_test.dart`
3. **Kalkulátor rozpočtu a split KRW:** `test/budget/budget_calculator_test.dart`
4. **Šifrování dokladů ve Vaultu:** `test/documents/vault_test.dart`
5. **Round-trip zálohy a obnovy:** `test/backup/backup_restore_test.dart`
6. **Smart Itinerary detekce kolizí:** `test/itinerary/smart_itinerary_test.dart`
7. **Generování PDF Trip Booku:** `test/memories/pdf_generator_test.dart`
