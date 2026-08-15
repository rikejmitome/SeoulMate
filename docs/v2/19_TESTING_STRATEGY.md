# SeoulMate v2.0 — Testovací strategie a QA plán (Testing Strategy)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**Backlog úkolů:** [26_TASK_BACKLOG.md](26_TASK_BACKLOG.md)  
**Akceptační kritéria:** [24_ACCEPTANCE_CRITERIA.md](24_ACCEPTANCE_CRITERIA.md)

---

## 1. Testovací pyramida pro SeoulMate v2.0

```text
               / \
              /   \
             / E2E \       10% E2E toky (Offline roundtrip, Záloha & Obnova)
            /-------\
           / Widget  \     30% Prezenční testy (Home, Vault, Emergency, Shell)
          /-----------\
         /  Unit / DB  \   60% Doména, Drift SQLite, Outbox sync, Split kalkulátor
        /---------------\
```

---

## 2. Povinné testovací sady pro jednotlivé vrstvy

### 2.1 Unit & Doménové testy (Cíl pokrytí > 80 % pro logiku)
- **Drift SQLite CRUD:** Ověření transakčního zápisu a čtení všech tabulek (`test/database/drift_crud_test.dart`).
- **Kalkulátor rozpočtu:** Testy dělení výdajů na 4 díly, zaokrouhlování na celé KRW a minimalizace vyrovnávacích plateb (`test/budget/budget_calculator_test.dart`).
- **Detekce kolizí v itineráři:** Algoritmické testy překryvu časů aktivit (`test/itinerary/smart_itinerary_test.dart`).
- **Validace JSON obsahu:** Kontrola integrity a platnosti všech statických JSON souborů (`test/korean/content_loader_test.dart`).

### 2.2 Widget & UI testy
- **AppShell navigace:** Test přepínání 5 záložek a existence Emergency tlačítka (`test/presentation/app_shell_test.dart`).
- **Adaptive Home:** Ověření správného výběru akční karty v různých fázích tripu (`test/presentation/home_screen_test.dart`).
- **A11y Text Scaling:** Automatický test zobrazení při 150% měřítku písma bez přetečení.

### 2.3 Integrační a Offline testy
- **Outbox Sync Worker:** Simulace odpojení sítě, zápisu 10 lokálních položek a následného hromadného odeslání po obnově spojení (`test/sync/outbox_sync_test.dart`).
- **Backup & Restore:** Vyexportování celého tripu do šifrovaného ZIPu, vyčištění databáze a úspěšná obnova (`test/backup/backup_restore_test.dart`).
- **Security Rules:** Testy odmítnutí neautorizovaného přístupu přes Firestore Emulator (`test/security/firestore_rules_test.dart`).
